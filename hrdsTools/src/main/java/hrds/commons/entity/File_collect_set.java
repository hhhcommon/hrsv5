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
 * 文件系统设置
 */
@Table(tableName = "file_collect_set")
public class File_collect_set extends TableEntity
{
	private static final long serialVersionUID = 321566870187324L;
	private transient static final Set<String> __PrimaryKeys;
	public static final String TableName = "file_collect_set";
	/**
	* 检查给定的名字，是否为主键中的字段
	* @param name String 检验是否为主键的名字
	* @return
	*/
	public static boolean isPrimaryKey(String name) { return __PrimaryKeys.contains(name); } 
	public static Set<String> getPrimaryKeyNames() { return __PrimaryKeys; } 
	/** 文件系统设置 */
	static {
		Set<String> __tmpPKS = new HashSet<>();
		__tmpPKS.add("fcs_id");
		__PrimaryKeys = Collections.unmodifiableSet(__tmpPKS);
	}
	private Long fcs_id; //文件系统采集ID
	private Long agent_id; //Agent_id
	private String host_name; //主机名称
	private String system_type; //操作系统类型
	private String remark; //备注
	private String fcs_name; //文件系统采集任务名称
	private String is_sendok; //是否设置完成并发送成功
	private String is_solr; //是否入solr

	/** 取得：文件系统采集ID */
	public Long getFcs_id(){
		return fcs_id;
	}
	/** 设置：文件系统采集ID */
	public void setFcs_id(Long fcs_id){
		this.fcs_id=fcs_id;
	}
	/** 设置：文件系统采集ID */
	public void setFcs_id(String fcs_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(fcs_id)){
			this.fcs_id=new Long(fcs_id);
		}
	}
	/** 取得：Agent_id */
	public Long getAgent_id(){
		return agent_id;
	}
	/** 设置：Agent_id */
	public void setAgent_id(Long agent_id){
		this.agent_id=agent_id;
	}
	/** 设置：Agent_id */
	public void setAgent_id(String agent_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(agent_id)){
			this.agent_id=new Long(agent_id);
		}
	}
	/** 取得：主机名称 */
	public String getHost_name(){
		return host_name;
	}
	/** 设置：主机名称 */
	public void setHost_name(String host_name){
		this.host_name=host_name;
	}
	/** 取得：操作系统类型 */
	public String getSystem_type(){
		return system_type;
	}
	/** 设置：操作系统类型 */
	public void setSystem_type(String system_type){
		this.system_type=system_type;
	}
	/** 取得：备注 */
	public String getRemark(){
		return remark;
	}
	/** 设置：备注 */
	public void setRemark(String remark){
		this.remark=remark;
	}
	/** 取得：文件系统采集任务名称 */
	public String getFcs_name(){
		return fcs_name;
	}
	/** 设置：文件系统采集任务名称 */
	public void setFcs_name(String fcs_name){
		this.fcs_name=fcs_name;
	}
	/** 取得：是否设置完成并发送成功 */
	public String getIs_sendok(){
		return is_sendok;
	}
	/** 设置：是否设置完成并发送成功 */
	public void setIs_sendok(String is_sendok){
		this.is_sendok=is_sendok;
	}
	/** 取得：是否入solr */
	public String getIs_solr(){
		return is_solr;
	}
	/** 设置：是否入solr */
	public void setIs_solr(String is_solr){
		this.is_solr=is_solr;
	}
}
