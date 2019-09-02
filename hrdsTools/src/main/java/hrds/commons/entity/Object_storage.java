package hrds.commons.entity;
/**Auto Created by VBScript Do not modify!*/
import fd.ng.db.entity.TableEntity;
import fd.ng.core.utils.StringUtil;
import fd.ng.db.entity.anno.Column;
import fd.ng.db.entity.anno.Table;
import hrds.commons.exception.BusinessException;
import java.math.BigDecimal;
import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;
import java.util.Collections;

/**
 * 对象采集存储设置
 */
@Table(tableName = "object_storage")
public class Object_storage extends TableEntity
{
	private static final long serialVersionUID = 321566870187324L;
	private transient static final Set<String> __PrimaryKeys;
	public static final String TableName = "object_storage";
	/**
	* 检查给定的名字，是否为主键中的字段
	* @param name String 检验是否为主键的名字
	* @return
	*/
	public static boolean isPrimaryKey(String name) { return __PrimaryKeys.contains(name); } 
	public static Set<String> getPrimaryKeyNames() { return __PrimaryKeys; } 
	/** 对象采集存储设置 */
	static {
		Set<String> __tmpPKS = new HashSet<>();
		__tmpPKS.add("obj_stid");
		__PrimaryKeys = Collections.unmodifiableSet(__tmpPKS);
	}
	private Long obj_stid; //存储编号
	private String is_hbase; //是否进hbase
	private String is_hdfs; //是否进hdfs
	private String remark; //备注
	private Long ocs_id; //对象采集任务编号

	/** 取得：存储编号 */
	public Long getObj_stid(){
		return obj_stid;
	}
	/** 设置：存储编号 */
	public void setObj_stid(Long obj_stid){
		this.obj_stid=obj_stid;
	}
	/** 设置：存储编号 */
	public void setObj_stid(String obj_stid){
		if(!fd.ng.core.utils.StringUtil.isEmpty(obj_stid)){
			this.obj_stid=new Long(obj_stid);
		}
	}
	/** 取得：是否进hbase */
	public String getIs_hbase(){
		return is_hbase;
	}
	/** 设置：是否进hbase */
	public void setIs_hbase(String is_hbase){
		this.is_hbase=is_hbase;
	}
	/** 取得：是否进hdfs */
	public String getIs_hdfs(){
		return is_hdfs;
	}
	/** 设置：是否进hdfs */
	public void setIs_hdfs(String is_hdfs){
		this.is_hdfs=is_hdfs;
	}
	/** 取得：备注 */
	public String getRemark(){
		return remark;
	}
	/** 设置：备注 */
	public void setRemark(String remark){
		this.remark=remark;
	}
	/** 取得：对象采集任务编号 */
	public Long getOcs_id(){
		return ocs_id;
	}
	/** 设置：对象采集任务编号 */
	public void setOcs_id(Long ocs_id){
		this.ocs_id=ocs_id;
	}
	/** 设置：对象采集任务编号 */
	public void setOcs_id(String ocs_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(ocs_id)){
			this.ocs_id=new Long(ocs_id);
		}
	}
}
