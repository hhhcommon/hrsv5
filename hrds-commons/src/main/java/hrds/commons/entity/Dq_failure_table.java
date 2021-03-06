package hrds.commons.entity;
/**Auto Created by VBScript Do not modify!*/
import hrds.commons.entity.fdentity.ProjectTableEntity;
import fd.ng.db.entity.anno.Table;
import fd.ng.core.annotation.DocBean;
import java.math.BigDecimal;
import java.util.Set;
import java.util.HashSet;
import java.util.Collections;

/**
 * 无效表信息
 */
@Table(tableName = "dq_failure_table")
public class Dq_failure_table extends ProjectTableEntity
{
	private static final long serialVersionUID = 321566870187324L;
	private transient static final Set<String> __PrimaryKeys;
	public static final String TableName = "dq_failure_table";
	/**
	* 检查给定的名字，是否为主键中的字段
	* @param name String 检验是否为主键的名字
	* @return
	*/
	public static boolean isPrimaryKey(String name) { return __PrimaryKeys.contains(name); } 
	public static Set<String> getPrimaryKeyNames() { return __PrimaryKeys; } 
	/** 无效表信息 */
	static {
		Set<String> __tmpPKS = new HashSet<>();
		__tmpPKS.add("failure_table_id");
		__PrimaryKeys = Collections.unmodifiableSet(__tmpPKS);
	}
	@DocBean(name ="failure_table_id",value="表id:",dataType = Long.class,required = true)
	private Long failure_table_id;
	@DocBean(name ="table_cn_name",value="表中文名:",dataType = String.class,required = false)
	private String table_cn_name;
	@DocBean(name ="table_en_name",value="表英文名:",dataType = String.class,required = true)
	private String table_en_name;
	@DocBean(name ="table_source",value="表来源(DataSourceType):ISL-贴源层_01<ISL> DCL-贴源层<DCL> DPL-加工层-废弃<DPL> DML-加工层<DML> SFL-系统层<SFL> AML-AI模型层<AML> DQC-管控层<DQC> UDL-自定义层<UDL> ",dataType = String.class,required = true)
	private String table_source;
	@DocBean(name ="table_meta_info",value="表元信息:",dataType = String.class,required = true)
	private String table_meta_info;
	@DocBean(name ="remark",value="备注:",dataType = String.class,required = false)
	private String remark;
	@DocBean(name ="dsl_id",value="存储层配置ID:",dataType = Long.class,required = true)
	private Long dsl_id;
	@DocBean(name ="data_source",value="存储层-数据来源(StoreLayerDataSource):1-db采集<DB> 2-数据库采集<DBA> 3-对象采集<OBJ> 4-数据集市<DM> 5-数据管控<DQ> 6-自定义<UD> ",dataType = String.class,required = false)
	private String data_source;
	@DocBean(name ="file_id",value="数据表ID:",dataType = Long.class,required = true)
	private Long file_id;

	/** 取得：表id */
	public Long getFailure_table_id(){
		return failure_table_id;
	}
	/** 设置：表id */
	public void setFailure_table_id(Long failure_table_id){
		this.failure_table_id=failure_table_id;
	}
	/** 设置：表id */
	public void setFailure_table_id(String failure_table_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(failure_table_id)){
			this.failure_table_id=new Long(failure_table_id);
		}
	}
	/** 取得：表中文名 */
	public String getTable_cn_name(){
		return table_cn_name;
	}
	/** 设置：表中文名 */
	public void setTable_cn_name(String table_cn_name){
		this.table_cn_name=table_cn_name;
	}
	/** 取得：表英文名 */
	public String getTable_en_name(){
		return table_en_name;
	}
	/** 设置：表英文名 */
	public void setTable_en_name(String table_en_name){
		this.table_en_name=table_en_name;
	}
	/** 取得：表来源 */
	public String getTable_source(){
		return table_source;
	}
	/** 设置：表来源 */
	public void setTable_source(String table_source){
		this.table_source=table_source;
	}
	/** 取得：表元信息 */
	public String getTable_meta_info(){
		return table_meta_info;
	}
	/** 设置：表元信息 */
	public void setTable_meta_info(String table_meta_info){
		this.table_meta_info=table_meta_info;
	}
	/** 取得：备注 */
	public String getRemark(){
		return remark;
	}
	/** 设置：备注 */
	public void setRemark(String remark){
		this.remark=remark;
	}
	/** 取得：存储层配置ID */
	public Long getDsl_id(){
		return dsl_id;
	}
	/** 设置：存储层配置ID */
	public void setDsl_id(Long dsl_id){
		this.dsl_id=dsl_id;
	}
	/** 设置：存储层配置ID */
	public void setDsl_id(String dsl_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(dsl_id)){
			this.dsl_id=new Long(dsl_id);
		}
	}
	/** 取得：存储层-数据来源 */
	public String getData_source(){
		return data_source;
	}
	/** 设置：存储层-数据来源 */
	public void setData_source(String data_source){
		this.data_source=data_source;
	}
	/** 取得：数据表ID */
	public Long getFile_id(){
		return file_id;
	}
	/** 设置：数据表ID */
	public void setFile_id(Long file_id){
		this.file_id=file_id;
	}
	/** 设置：数据表ID */
	public void setFile_id(String file_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(file_id)){
			this.file_id=new Long(file_id);
		}
	}
}
