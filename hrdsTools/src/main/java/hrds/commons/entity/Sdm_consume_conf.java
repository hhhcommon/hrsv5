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
 * 流数据管理消费端配置表
 */
@Table(tableName = "sdm_consume_conf")
public class Sdm_consume_conf extends TableEntity
{
	private static final long serialVersionUID = 321566870187324L;
	private transient static final Set<String> __PrimaryKeys;
	public static final String TableName = "sdm_consume_conf";
	/**
	* 检查给定的名字，是否为主键中的字段
	* @param name String 检验是否为主键的名字
	* @return
	*/
	public static boolean isPrimaryKey(String name) { return __PrimaryKeys.contains(name); } 
	public static Set<String> getPrimaryKeyNames() { return __PrimaryKeys; } 
	/** 流数据管理消费端配置表 */
	static {
		Set<String> __tmpPKS = new HashSet<>();
		__tmpPKS.add("sdm_consum_id");
		__PrimaryKeys = Collections.unmodifiableSet(__tmpPKS);
	}
	private Long sdm_consum_id; //消费端配置id
	private String remark; //备注
	private String sdm_cons_name; //消费配置名称
	private String sdm_cons_describe; //消费配置描述
	private Long user_id; //用户ID
	private String create_date; //创建日期
	private String create_time; //创建时间
	private String con_with_par; //是否按分区消费
	private String consum_thread_cycle; //消费线程周期
	private String deadline; //截止时间
	private Long run_time_long; //运行时长
	private String end_type; //结束类型
	private Long data_volume; //数据量
	private String time_type; //时间类型
	private String consumer_type; //消费类型

	/** 取得：消费端配置id */
	public Long getSdm_consum_id(){
		return sdm_consum_id;
	}
	/** 设置：消费端配置id */
	public void setSdm_consum_id(Long sdm_consum_id){
		this.sdm_consum_id=sdm_consum_id;
	}
	/** 设置：消费端配置id */
	public void setSdm_consum_id(String sdm_consum_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(sdm_consum_id)){
			this.sdm_consum_id=new Long(sdm_consum_id);
		}
	}
	/** 取得：备注 */
	public String getRemark(){
		return remark;
	}
	/** 设置：备注 */
	public void setRemark(String remark){
		this.remark=remark;
	}
	/** 取得：消费配置名称 */
	public String getSdm_cons_name(){
		return sdm_cons_name;
	}
	/** 设置：消费配置名称 */
	public void setSdm_cons_name(String sdm_cons_name){
		this.sdm_cons_name=sdm_cons_name;
	}
	/** 取得：消费配置描述 */
	public String getSdm_cons_describe(){
		return sdm_cons_describe;
	}
	/** 设置：消费配置描述 */
	public void setSdm_cons_describe(String sdm_cons_describe){
		this.sdm_cons_describe=sdm_cons_describe;
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
	/** 取得：创建日期 */
	public String getCreate_date(){
		return create_date;
	}
	/** 设置：创建日期 */
	public void setCreate_date(String create_date){
		this.create_date=create_date;
	}
	/** 取得：创建时间 */
	public String getCreate_time(){
		return create_time;
	}
	/** 设置：创建时间 */
	public void setCreate_time(String create_time){
		this.create_time=create_time;
	}
	/** 取得：是否按分区消费 */
	public String getCon_with_par(){
		return con_with_par;
	}
	/** 设置：是否按分区消费 */
	public void setCon_with_par(String con_with_par){
		this.con_with_par=con_with_par;
	}
	/** 取得：消费线程周期 */
	public String getConsum_thread_cycle(){
		return consum_thread_cycle;
	}
	/** 设置：消费线程周期 */
	public void setConsum_thread_cycle(String consum_thread_cycle){
		this.consum_thread_cycle=consum_thread_cycle;
	}
	/** 取得：截止时间 */
	public String getDeadline(){
		return deadline;
	}
	/** 设置：截止时间 */
	public void setDeadline(String deadline){
		this.deadline=deadline;
	}
	/** 取得：运行时长 */
	public Long getRun_time_long(){
		return run_time_long;
	}
	/** 设置：运行时长 */
	public void setRun_time_long(Long run_time_long){
		this.run_time_long=run_time_long;
	}
	/** 设置：运行时长 */
	public void setRun_time_long(String run_time_long){
		if(!fd.ng.core.utils.StringUtil.isEmpty(run_time_long)){
			this.run_time_long=new Long(run_time_long);
		}
	}
	/** 取得：结束类型 */
	public String getEnd_type(){
		return end_type;
	}
	/** 设置：结束类型 */
	public void setEnd_type(String end_type){
		this.end_type=end_type;
	}
	/** 取得：数据量 */
	public Long getData_volume(){
		return data_volume;
	}
	/** 设置：数据量 */
	public void setData_volume(Long data_volume){
		this.data_volume=data_volume;
	}
	/** 设置：数据量 */
	public void setData_volume(String data_volume){
		if(!fd.ng.core.utils.StringUtil.isEmpty(data_volume)){
			this.data_volume=new Long(data_volume);
		}
	}
	/** 取得：时间类型 */
	public String getTime_type(){
		return time_type;
	}
	/** 设置：时间类型 */
	public void setTime_type(String time_type){
		this.time_type=time_type;
	}
	/** 取得：消费类型 */
	public String getConsumer_type(){
		return consumer_type;
	}
	/** 设置：消费类型 */
	public void setConsumer_type(String consumer_type){
		this.consumer_type=consumer_type;
	}
}
