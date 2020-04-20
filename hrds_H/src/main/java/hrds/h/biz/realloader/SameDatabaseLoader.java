package hrds.h.biz.realloader;

import fd.ng.db.jdbc.DatabaseWrapper;

import hrds.commons.collection.ConnectionTool;
import hrds.commons.exception.AppSystemException;
import hrds.commons.utils.PropertyParaUtil;
import hrds.commons.utils.PropertyParaValue;
import hrds.h.biz.config.MarketConf;

import static hrds.commons.utils.Constant.*;

/**
 * @Author: Mick Yuan
 * @Date:
 * @Since jdk1.8
 */
public class SameDatabaseLoader extends AbstractRealLoader {

    private final DatabaseWrapper db;
    private final String sql;
    private final String createTableColumnTypes;
    private final String columnsWithoutHyren;

    private final String currentTableName;
    private final String deltaTableName;

    SameDatabaseLoader(MarketConf conf) {
        super(conf);
        db = ConnectionTool.getDBWrapper(tableLayerAttrs);
        sql = conf.getCompleteSql();
        createTableColumnTypes = buildCreateTableColumnTypes();
        columnsWithoutHyren = columnsWithoutHyren();
        currentTableName = conf.getEtlData() + "_" + tableName;
        deltaTableName = "delta_" + tableName;
    }


    @Override
    public void firstLoad() {
        this.replace();
    }


    @Override
    public void append() {
        ensureTableExists("追加");
        insertData(tableName);
    }

    @Override
    public void replace() {
        forceCreateTable(tableName);
        insertData(tableName);
    }

    @Override
    public void increment() {
        ensureTableExists("增量");
        //1.创建当前表
        forceCreateTable(currentTableName);
        //2.将执行sql后的结果集插入当前表中
        insertData(currentTableName);
        //3.创建增量表
        forceCreateTable(deltaTableName, "action char(1)");
        //4.当前表与最终表中的有效数据做比较，执行增量算法计算出 新增的数据 并插入到增量表中，action 字段值为 I
        computeValidDataAndInsert();
        //4.当前表与最终表中的有效数据做比较，执行增量算法计算出 关链的数据 并插入到增量表中，action 字段值为 D
        computeInvalidDataAndInsert();

    }

    private void computeValidDataAndInsert() {
        String insertDataSql = "INSERT INTO ? select *,'I' from ? WHERE NOT EXISTS " +
                "( select 1 from ? WHERE ?.? = ?.? AND ?.? = '?')";
        db.execute(insertDataSql, deltaTableName, currentTableName, tableName, currentTableName,
                MD5NAME, tableName, MD5NAME, tableName, EDATENAME, MAXDATE);
    }

    private void computeInvalidDataAndInsert() {
        final String deleteDatasql = "INSERT INTO ? select *,'D' from ? WHERE NOT EXISTS " +
                "( select 1 from ? WHERE ?.? = ?.?) AND ?.? = '?'";
        db.execute(deleteDatasql, deltaTableName, tableName, currentTableName,
                tableName, MD5NAME, currentTableName, MD5NAME, tableName, EDATENAME, MAXDATE);
    }

    @Override
    public void reappend() {
        ensureTableExists("重追加");
        restoreData();
        insertData(tableName);
    }

    @Override
    public void close() {

        if (PropertyParaValue.getBoolean("market.increment.tmptable.delete", true)) {
            deleteTmptable();
        }
        if (db != null)
            db.close();
    }

    private void deleteTmptable() {
        try {
            db.execute("DROP TABLE " + currentTableName);
            db.execute("DROP TABLE " + deltaTableName);
        } catch (Exception e) {
            logger.warn("删除临时表 " + currentTableName + "," + deltaTableName + " 失败");
        }
    }

    private void ensureTableExists(String action) {
        if (!db.isExistTable(tableName)) {
            throw new AppSystemException(String.format("表不存在,无法执行 %s 操作: %s",
                    action, tableName));
        }
    }

    /**
     * 创建表
     * 如果表存在就删除掉
     */
    private void forceCreateTable(String tableName, String... extraColumnTypes) {

        String createTableColumnTypesExtra = createTableColumnTypes;
        if (extraColumnTypes.length > 0) {
            createTableColumnTypesExtra += "," + String.join(",", extraColumnTypes);
        }
        if (db.isExistTable(tableName)) {
            db.execute("DROP TABLE " + tableName);
        }
        String createSql = "CREATE TABLE " + tableName + " (" + createTableColumnTypesExtra + ")";
        db.execute(createSql);
    }

    private void insertData(String tableName) {
        db.execute("INSERT INTO ? SELECT ?,?,?,? FROM ( ? )",
                tableName, columnsWithoutHyren, conf.getEtlData(), MAXDATE,
                lineMd5Expr(columnsWithoutHyren), sql);
    }

    private String lineMd5Expr(String columnsJoin) {
        return "md5(" + columnsJoin.replace(",", "||") + ")";
    }

    private void restoreData() {
        db.execute("DELETE FROM ? WHERE ? = ?",
                tableName, SDATENAME, conf.getEtlData());

        db.execute("UPDATE ? SET ? = ? WHERE ? = ?",
                tableName, EDATENAME, MAXDATE, EDATENAME, conf.getEtlData());

    }


}
