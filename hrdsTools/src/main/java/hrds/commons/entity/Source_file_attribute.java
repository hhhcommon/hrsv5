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
 * 源文件属性
 */
@Table(tableName = "source_file_attribute")
public class Source_file_attribute extends TableEntity
{
	private static final long serialVersionUID = 321566870187324L;
	private transient static final Set<String> __PrimaryKeys;
	public static final String TableName = "source_file_attribute";
	/**
	* 检查给定的名字，是否为主键中的字段
	* @param name String 检验是否为主键的名字
	* @return
	*/
	public static boolean isPrimaryKey(String name) { return __PrimaryKeys.contains(name); } 
	public static Set<String> getPrimaryKeyNames() { return __PrimaryKeys; } 
	/** 源文件属性 */
	static {
		Set<String> __tmpPKS = new HashSet<>();
		__tmpPKS.add("file_id");
		__PrimaryKeys = Collections.unmodifiableSet(__tmpPKS);
	}
	private String file_id; //文件编号
	private String original_name; //原始文件名或表中文名称
	private String original_update_date; //原文件最后修改日期
	private String hbase_name; //系统内对应表名
	private String storage_date; //入库日期
	private BigDecimal file_size; //文件大小
	private String file_type; //文件类型
	private String original_update_time; //原文件最后修改时间
	private String storage_time; //入库时间
	private String file_suffix; //文件后缀
	private String table_name; //采集的原始表名
	private Long collect_set_id; //数据库设置id
	private Long agent_id; //Agent_id
	private Long source_id; //数据源ID
	private Long folder_id; //文件夹编号
	private String collect_type; //采集类型
	private String source_path; //文件路径
	private String meta_info; //META元信息
	private Long seqencing; //排序计数
	private String is_in_hbase; //是否已进入HBASE
	private String file_md5; //文件MD5值
	private String file_avro_path; //所在avro文件地址
	private Long file_avro_block; //所存avro文件block号
	private String is_big_file; //是否为大文件
	private String is_cache; //是否本地缓存

	/** 取得：文件编号 */
	public String getFile_id(){
		return file_id;
	}
	/** 设置：文件编号 */
	public void setFile_id(String file_id){
		this.file_id=file_id;
	}
	/** 取得：原始文件名或表中文名称 */
	public String getOriginal_name(){
		return original_name;
	}
	/** 设置：原始文件名或表中文名称 */
	public void setOriginal_name(String original_name){
		this.original_name=original_name;
	}
	/** 取得：原文件最后修改日期 */
	public String getOriginal_update_date(){
		return original_update_date;
	}
	/** 设置：原文件最后修改日期 */
	public void setOriginal_update_date(String original_update_date){
		this.original_update_date=original_update_date;
	}
	/** 取得：系统内对应表名 */
	public String getHbase_name(){
		return hbase_name;
	}
	/** 设置：系统内对应表名 */
	public void setHbase_name(String hbase_name){
		this.hbase_name=hbase_name;
	}
	/** 取得：入库日期 */
	public String getStorage_date(){
		return storage_date;
	}
	/** 设置：入库日期 */
	public void setStorage_date(String storage_date){
		this.storage_date=storage_date;
	}
	/** 取得：文件大小 */
	public BigDecimal getFile_size(){
		return file_size;
	}
	/** 设置：文件大小 */
	public void setFile_size(BigDecimal file_size){
		this.file_size=file_size;
	}
	/** 设置：文件大小 */
	public void setFile_size(String file_size){
		if(!fd.ng.core.utils.StringUtil.isEmpty(file_size)){
			this.file_size=new BigDecimal(file_size);
		}
	}
	/** 取得：文件类型 */
	public String getFile_type(){
		return file_type;
	}
	/** 设置：文件类型 */
	public void setFile_type(String file_type){
		this.file_type=file_type;
	}
	/** 取得：原文件最后修改时间 */
	public String getOriginal_update_time(){
		return original_update_time;
	}
	/** 设置：原文件最后修改时间 */
	public void setOriginal_update_time(String original_update_time){
		this.original_update_time=original_update_time;
	}
	/** 取得：入库时间 */
	public String getStorage_time(){
		return storage_time;
	}
	/** 设置：入库时间 */
	public void setStorage_time(String storage_time){
		this.storage_time=storage_time;
	}
	/** 取得：文件后缀 */
	public String getFile_suffix(){
		return file_suffix;
	}
	/** 设置：文件后缀 */
	public void setFile_suffix(String file_suffix){
		this.file_suffix=file_suffix;
	}
	/** 取得：采集的原始表名 */
	public String getTable_name(){
		return table_name;
	}
	/** 设置：采集的原始表名 */
	public void setTable_name(String table_name){
		this.table_name=table_name;
	}
	/** 取得：数据库设置id */
	public Long getCollect_set_id(){
		return collect_set_id;
	}
	/** 设置：数据库设置id */
	public void setCollect_set_id(Long collect_set_id){
		this.collect_set_id=collect_set_id;
	}
	/** 设置：数据库设置id */
	public void setCollect_set_id(String collect_set_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(collect_set_id)){
			this.collect_set_id=new Long(collect_set_id);
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
	/** 取得：数据源ID */
	public Long getSource_id(){
		return source_id;
	}
	/** 设置：数据源ID */
	public void setSource_id(Long source_id){
		this.source_id=source_id;
	}
	/** 设置：数据源ID */
	public void setSource_id(String source_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(source_id)){
			this.source_id=new Long(source_id);
		}
	}
	/** 取得：文件夹编号 */
	public Long getFolder_id(){
		return folder_id;
	}
	/** 设置：文件夹编号 */
	public void setFolder_id(Long folder_id){
		this.folder_id=folder_id;
	}
	/** 设置：文件夹编号 */
	public void setFolder_id(String folder_id){
		if(!fd.ng.core.utils.StringUtil.isEmpty(folder_id)){
			this.folder_id=new Long(folder_id);
		}
	}
	/** 取得：采集类型 */
	public String getCollect_type(){
		return collect_type;
	}
	/** 设置：采集类型 */
	public void setCollect_type(String collect_type){
		this.collect_type=collect_type;
	}
	/** 取得：文件路径 */
	public String getSource_path(){
		return source_path;
	}
	/** 设置：文件路径 */
	public void setSource_path(String source_path){
		this.source_path=source_path;
	}
	/** 取得：META元信息 */
	public String getMeta_info(){
		return meta_info;
	}
	/** 设置：META元信息 */
	public void setMeta_info(String meta_info){
		this.meta_info=meta_info;
	}
	/** 取得：排序计数 */
	public Long getSeqencing(){
		return seqencing;
	}
	/** 设置：排序计数 */
	public void setSeqencing(Long seqencing){
		this.seqencing=seqencing;
	}
	/** 设置：排序计数 */
	public void setSeqencing(String seqencing){
		if(!fd.ng.core.utils.StringUtil.isEmpty(seqencing)){
			this.seqencing=new Long(seqencing);
		}
	}
	/** 取得：是否已进入HBASE */
	public String getIs_in_hbase(){
		return is_in_hbase;
	}
	/** 设置：是否已进入HBASE */
	public void setIs_in_hbase(String is_in_hbase){
		this.is_in_hbase=is_in_hbase;
	}
	/** 取得：文件MD5值 */
	public String getFile_md5(){
		return file_md5;
	}
	/** 设置：文件MD5值 */
	public void setFile_md5(String file_md5){
		this.file_md5=file_md5;
	}
	/** 取得：所在avro文件地址 */
	public String getFile_avro_path(){
		return file_avro_path;
	}
	/** 设置：所在avro文件地址 */
	public void setFile_avro_path(String file_avro_path){
		this.file_avro_path=file_avro_path;
	}
	/** 取得：所存avro文件block号 */
	public Long getFile_avro_block(){
		return file_avro_block;
	}
	/** 设置：所存avro文件block号 */
	public void setFile_avro_block(Long file_avro_block){
		this.file_avro_block=file_avro_block;
	}
	/** 设置：所存avro文件block号 */
	public void setFile_avro_block(String file_avro_block){
		if(!fd.ng.core.utils.StringUtil.isEmpty(file_avro_block)){
			this.file_avro_block=new Long(file_avro_block);
		}
	}
	/** 取得：是否为大文件 */
	public String getIs_big_file(){
		return is_big_file;
	}
	/** 设置：是否为大文件 */
	public void setIs_big_file(String is_big_file){
		this.is_big_file=is_big_file;
	}
	/** 取得：是否本地缓存 */
	public String getIs_cache(){
		return is_cache;
	}
	/** 设置：是否本地缓存 */
	public void setIs_cache(String is_cache){
		this.is_cache=is_cache;
	}
}
