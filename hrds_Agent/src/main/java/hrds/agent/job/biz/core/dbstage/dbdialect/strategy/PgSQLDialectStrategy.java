package hrds.agent.job.biz.core.dbstage.dbdialect.strategy;

import fd.ng.core.annotation.Class;
import fd.ng.core.annotation.Method;
import fd.ng.core.annotation.Param;
import fd.ng.core.annotation.Return;
import fd.ng.db.jdbc.nature.PostgreSQL;


@Class(desc = "数据库方言策略接口PostgreSQL数据库实现类", author = "WangZhengcheng")
public class PgSQLDialectStrategy implements DataBaseDialectStrategy {
	@Method(desc = "PgSQL根据对应的数据库分页类型，获取分页SQL", logicStep = "1、调用封装好的已有实现获得分页SQL")
	@Param(name = "strSql", desc = "采集SQL", range = "不为空")
	@Param(name = "start", desc = "当前页开始条数", range = "不限")
	@Param(name = "limit", desc = "当前页结束条数", range = "不限")
	@Return(desc = "根据参数组装成的用于分页查询的SQL", range = "不会为null")
	@Override
	public String createPageSql(String strSql, int start, int limit) {
		return PostgreSQL.toPagedSql(strSql, start, limit).getSql();
	}
}
