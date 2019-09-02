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
 * 作业干预表
 */
@Table(tableName = "etl_job_hand")
public class Etl_job_hand extends TableEntity
{
	private static final long serialVersionUID = 321566870187324L;
	private transient static final Set<String> __PrimaryKeys;
	public static final String TableName = "etl_job_hand";
	/**
	* 检查给定的名字，是否为主键中的字段
	* @param name String 检验是否为主键的名字
	* @return
	*/
	public static boolean isPrimaryKey(String name) { return __PrimaryKeys.contains(name); } 
	public static Set<String> getPrimaryKeyNames() { return __PrimaryKeys; } 
	/** 作业干预表 */
	static {
		Set<String> __tmpPKS = new HashSet<>();
		__tmpPKS.add("event_id");
		__tmpPKS.add("etl_sys_cd");
		__tmpPKS.add("etl_job");
		__PrimaryKeys = Collections.unmodifiableSet(__tmpPKS);
	}
	private String event_id; //干预发生时间
	private String etl_hand_type; //干预类型
	private String pro_para; //干预参数
	private String hand_status; //干预状态
	private String st_time; //开始时间
	private String end_time; //结束时间
	private String warning; //错误信息
	private String main_serv_sync; //同步标志位
	private String etl_sys_cd; //工程代码
	private String etl_job; //作业名

	/** 取得：干预发生时间 */
	public String getEvent_id(){
		return event_id;
	}
	/** 设置：干预发生时间 */
	public void setEvent_id(String event_id){
		this.event_id=event_id;
	}
	/** 取得：干预类型 */
	public String getEtl_hand_type(){
		return etl_hand_type;
	}
	/** 设置：干预类型 */
	public void setEtl_hand_type(String etl_hand_type){
		this.etl_hand_type=etl_hand_type;
	}
	/** 取得：干预参数 */
	public String getPro_para(){
		return pro_para;
	}
	/** 设置：干预参数 */
	public void setPro_para(String pro_para){
		this.pro_para=pro_para;
	}
	/** 取得：干预状态 */
	public String getHand_status(){
		return hand_status;
	}
	/** 设置：干预状态 */
	public void setHand_status(String hand_status){
		this.hand_status=hand_status;
	}
	/** 取得：开始时间 */
	public String getSt_time(){
		return st_time;
	}
	/** 设置：开始时间 */
	public void setSt_time(String st_time){
		this.st_time=st_time;
	}
	/** 取得：结束时间 */
	public String getEnd_time(){
		return end_time;
	}
	/** 设置：结束时间 */
	public void setEnd_time(String end_time){
		this.end_time=end_time;
	}
	/** 取得：错误信息 */
	public String getWarning(){
		return warning;
	}
	/** 设置：错误信息 */
	public void setWarning(String warning){
		this.warning=warning;
	}
	/** 取得：同步标志位 */
	public String getMain_serv_sync(){
		return main_serv_sync;
	}
	/** 设置：同步标志位 */
	public void setMain_serv_sync(String main_serv_sync){
		this.main_serv_sync=main_serv_sync;
	}
	/** 取得：工程代码 */
	public String getEtl_sys_cd(){
		return etl_sys_cd;
	}
	/** 设置：工程代码 */
	public void setEtl_sys_cd(String etl_sys_cd){
		this.etl_sys_cd=etl_sys_cd;
	}
	/** 取得：作业名 */
	public String getEtl_job(){
		return etl_job;
	}
	/** 设置：作业名 */
	public void setEtl_job(String etl_job){
		this.etl_job=etl_job;
	}
}