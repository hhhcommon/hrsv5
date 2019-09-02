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
 * 系统参数配置
 */
@Table(tableName = "sys_para")
public class Sys_para extends TableEntity
{
	private static final long serialVersionUID = 321566870187324L;
	private transient static final Set<String> __PrimaryKeys;
	public static final String TableName = "sys_para";
	/**
	* 检查给定的名字，是否为主键中的字段
	* @param name String 检验是否为主键的名字
	* @return
	*/
	public static boolean isPrimaryKey(String name) { return __PrimaryKeys.contains(name); } 
	public static Set<String> getPrimaryKeyNames() { return __PrimaryKeys; } 
	/** 系统参数配置 */
	static {
		Set<String> __tmpPKS = new HashSet<>();
		__tmpPKS.add("para_id");
		__PrimaryKeys = Collections.unmodifiableSet(__tmpPKS);
	}
	private Long para_id; //参数ID
	private String para_name; //para_name
	private String para_value; //para_value
	private String para_type; //para_type
	private String remark; //备注

	/** 取得：参数ID */
	public Long getPara_id(){
		return para_id;
	}
	/** 设置：参数ID */
	public void setPara_id(Long para_id){
		this.para_id=para_id;
	}
	/** 设置：参数ID */
	public void setPara_id(String para_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(para_id)){
			this.para_id=new Long(para_id);
		}
	}
	/** 取得：para_name */
	public String getPara_name(){
		return para_name;
	}
	/** 设置：para_name */
	public void setPara_name(String para_name){
		this.para_name=para_name;
	}
	/** 取得：para_value */
	public String getPara_value(){
		return para_value;
	}
	/** 设置：para_value */
	public void setPara_value(String para_value){
		this.para_value=para_value;
	}
	/** 取得：para_type */
	public String getPara_type(){
		return para_type;
	}
	/** 设置：para_type */
	public void setPara_type(String para_type){
		this.para_type=para_type;
	}
	/** 取得：备注 */
	public String getRemark(){
		return remark;
	}
	/** 设置：备注 */
	public void setRemark(String remark){
		this.remark=remark;
	}
}
