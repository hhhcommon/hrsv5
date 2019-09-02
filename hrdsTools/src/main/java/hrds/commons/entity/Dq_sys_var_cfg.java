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
 * 变量配置表
 */
@Table(tableName = "dq_sys_var_cfg")
public class Dq_sys_var_cfg extends TableEntity
{
	private static final long serialVersionUID = 321566870187324L;
	private transient static final Set<String> __PrimaryKeys;
	public static final String TableName = "dq_sys_var_cfg";
	/**
	* 检查给定的名字，是否为主键中的字段
	* @param name String 检验是否为主键的名字
	* @return
	*/
	public static boolean isPrimaryKey(String name) { return __PrimaryKeys.contains(name); } 
	public static Set<String> getPrimaryKeyNames() { return __PrimaryKeys; } 
	/** 变量配置表 */
	static {
		Set<String> __tmpPKS = new HashSet<>();
		__tmpPKS.add("sys_var_id");
		__tmpPKS.add("var_name");
		__PrimaryKeys = Collections.unmodifiableSet(__tmpPKS);
	}
	private Long sys_var_id; //系统变量编号
	private String var_name; //变量名
	private String var_value; //变量值
	private String app_updt_dt; //更新日期
	private String app_updt_ti; //更新时间
	private Long user_id; //用户ID

	/** 取得：系统变量编号 */
	public Long getSys_var_id(){
		return sys_var_id;
	}
	/** 设置：系统变量编号 */
	public void setSys_var_id(Long sys_var_id){
		this.sys_var_id=sys_var_id;
	}
	/** 设置：系统变量编号 */
	public void setSys_var_id(String sys_var_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(sys_var_id)){
			this.sys_var_id=new Long(sys_var_id);
		}
	}
	/** 取得：变量名 */
	public String getVar_name(){
		return var_name;
	}
	/** 设置：变量名 */
	public void setVar_name(String var_name){
		this.var_name=var_name;
	}
	/** 取得：变量值 */
	public String getVar_value(){
		return var_value;
	}
	/** 设置：变量值 */
	public void setVar_value(String var_value){
		this.var_value=var_value;
	}
	/** 取得：更新日期 */
	public String getApp_updt_dt(){
		return app_updt_dt;
	}
	/** 设置：更新日期 */
	public void setApp_updt_dt(String app_updt_dt){
		this.app_updt_dt=app_updt_dt;
	}
	/** 取得：更新时间 */
	public String getApp_updt_ti(){
		return app_updt_ti;
	}
	/** 设置：更新时间 */
	public void setApp_updt_ti(String app_updt_ti){
		this.app_updt_ti=app_updt_ti;
	}
	/** 取得：用户ID */
	public Long getUser_id(){
		return user_id;
	}
	/** 设置：用户ID */
	public void setUser_id(Long user_id){
		this.user_id=user_id;
	}
	/** 设置：用户ID */
	public void setUser_id(String user_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(user_id)){
			this.user_id=new Long(user_id);
		}
	}
}
