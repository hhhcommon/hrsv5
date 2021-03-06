﻿--作业模版参数表
DROP TABLE IF EXISTS ETL_JOB_TEMP_PARA ;
CREATE TABLE ETL_JOB_TEMP_PARA(
ETL_TEMP_PARA_ID                                  BIGINT default 0 NOT NULL, --模版参数主键
ETL_PARA_TYPE                                     VARCHAR(512) NOT NULL, --参数类型
ETL_JOB_PRO_PARA                                  VARCHAR(512) NOT NULL, --参数名称
ETL_JOB_PARA_SIZE                                 VARCHAR(512) NOT NULL, --参数
ETL_PRO_PARA_SORT                                 BIGINT default 0 NOT NULL, --参数排序
ETL_TEMP_ID                                       BIGINT default 0 NOT NULL, --模版ID
CONSTRAINT ETL_JOB_TEMP_PARA_PK PRIMARY KEY(ETL_TEMP_PARA_ID)   );

--资源登记表
DROP TABLE IF EXISTS ETL_RESOURCE ;
CREATE TABLE ETL_RESOURCE(
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
RESOURCE_TYPE                                     VARCHAR(100) NOT NULL, --资源使用类型
RESOURCE_MAX                                      INTEGER default 0 NULL, --资源阀值
RESOURCE_USED                                     INTEGER default 0 NULL, --已使用数
MAIN_SERV_SYNC                                    CHAR(1) NOT NULL, --主服务器同步标志
CONSTRAINT ETL_RESOURCE_PK PRIMARY KEY(ETL_SYS_CD,RESOURCE_TYPE)   );

--模版作业信息表
DROP TABLE IF EXISTS ETL_JOB_TEMP ;
CREATE TABLE ETL_JOB_TEMP(
ETL_TEMP_ID                                       BIGINT default 0 NOT NULL, --模版ID
ETL_TEMP_TYPE                                     VARCHAR(512) NOT NULL, --模版名称
PRO_DIC                                           VARCHAR(512) NOT NULL, --模版shell路径
PRO_NAME                                          VARCHAR(512) NOT NULL, --模版shell名称
CONSTRAINT ETL_JOB_TEMP_PK PRIMARY KEY(ETL_TEMP_ID)   );

--作业干预表
DROP TABLE IF EXISTS ETL_JOB_HAND ;
CREATE TABLE ETL_JOB_HAND(
EVENT_ID                                          VARCHAR(30) NOT NULL, --干预发生时间
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
ETL_JOB                                           VARCHAR(512) NOT NULL, --作业名
ETL_HAND_TYPE                                     CHAR(2) NULL, --干预类型
PRO_PARA                                          VARCHAR(512) NULL, --干预参数
HAND_STATUS                                       CHAR(1) NULL, --干预状态
ST_TIME                                           VARCHAR(30) NULL, --开始时间
END_TIME                                          VARCHAR(30) NULL, --结束时间
WARNING                                           VARCHAR(80) NULL, --错误信息
MAIN_SERV_SYNC                                    CHAR(1) NULL, --同步标志位
CONSTRAINT ETL_JOB_HAND_PK PRIMARY KEY(EVENT_ID,ETL_SYS_CD,ETL_JOB)   );

--子系统定义表
DROP TABLE IF EXISTS ETL_SUB_SYS_LIST ;
CREATE TABLE ETL_SUB_SYS_LIST(
SUB_SYS_CD                                        VARCHAR(100) NOT NULL, --子系统代码
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
SUB_SYS_DESC                                      VARCHAR(200) NULL, --子系统描述
COMMENTS                                          VARCHAR(512) NULL, --备注信息
CONSTRAINT ETL_SUB_SYS_LIST_PK PRIMARY KEY(SUB_SYS_CD,ETL_SYS_CD)   );

--参数登记
DROP TABLE IF EXISTS ETL_PARA ;
CREATE TABLE ETL_PARA(
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
PARA_CD                                           VARCHAR(50) NOT NULL, --变量代码
PARA_VAL                                          VARCHAR(512) NULL, --变量值
PARA_TYPE                                         VARCHAR(50) NULL, --变量类型
PARA_DESC                                         VARCHAR(200) NULL, --作业描述
CONSTRAINT ETL_PARA_PK PRIMARY KEY(ETL_SYS_CD,PARA_CD)   );

--干预历史表
DROP TABLE IF EXISTS ETL_JOB_HAND_HIS ;
CREATE TABLE ETL_JOB_HAND_HIS(
EVENT_ID                                          VARCHAR(30) NOT NULL, --干预发生时间
ETL_JOB                                           VARCHAR(512) NOT NULL, --作业名
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
ETL_HAND_TYPE                                     CHAR(2) NULL, --干预类型
PRO_PARA                                          VARCHAR(512) NULL, --干预参数
HAND_STATUS                                       CHAR(1) NULL, --干预状态
ST_TIME                                           VARCHAR(30) NULL, --开始时间
END_TIME                                          VARCHAR(30) NULL, --结束时间
WARNING                                           VARCHAR(80) NULL, --错误信息
MAIN_SERV_SYNC                                    CHAR(1) NULL, --同步标志位
CONSTRAINT ETL_JOB_HAND_HIS_PK PRIMARY KEY(EVENT_ID,ETL_JOB,ETL_SYS_CD)   );

--作业工程登记表
DROP TABLE IF EXISTS ETL_SYS ;
CREATE TABLE ETL_SYS(
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
ETL_SYS_NAME                                      VARCHAR(512) NOT NULL, --工程名称
ETL_SERV_IP                                       VARCHAR(50) NULL, --etl服务器ip
ETL_SERV_PORT                                     VARCHAR(10) NULL, --etl服务器端口
CONTACT_PERSON                                    VARCHAR(512) NULL, --联系人
CONTACT_PHONE                                     VARCHAR(20) NULL, --联系电话
COMMENTS                                          VARCHAR(512) NULL, --备注信息
CURR_BATH_DATE                                    VARCHAR(30) NULL, --当前批量日期
BATH_SHIFT_TIME                                   VARCHAR(30) NULL, --系统日切时间
MAIN_SERV_SYNC                                    CHAR(1) NULL, --主服务器同步标志
SYS_RUN_STATUS                                    CHAR(1) NULL, --系统状态
USER_NAME                                         VARCHAR(512) NULL, --主机服务器用户名
USER_PWD                                          VARCHAR(512) NULL, --主机用户密码
SERV_FILE_PATH                                    VARCHAR(512) NULL, --部署服务器路径
ETL_CONTEXT                                       VARCHAR(512) NULL, --访问根
ETL_PATTERN                                       VARCHAR(512) NULL, --访问路径
REMARKS                                           VARCHAR(512) NULL, --备注
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
CONSTRAINT ETL_SYS_PK PRIMARY KEY(ETL_SYS_CD)   );

--主键生成表
DROP TABLE IF EXISTS KEYTABLE ;
CREATE TABLE KEYTABLE(
KEY_NAME                                          VARCHAR(80) NOT NULL, --key_name
KEY_VALUE                                         INTEGER default 0 NULL, --value
CONSTRAINT KEYTABLE_PK PRIMARY KEY(KEY_NAME)   );

--系统参数配置
DROP TABLE IF EXISTS SYS_PARA ;
CREATE TABLE SYS_PARA(
PARA_ID                                           BIGINT default 0 NOT NULL, --参数ID
PARA_NAME                                         VARCHAR(512) NULL, --para_name
PARA_VALUE                                        VARCHAR(512) NULL, --para_value
PARA_TYPE                                         VARCHAR(512) NULL, --para_type
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT SYS_PARA_PK PRIMARY KEY(PARA_ID)   );

--部门信息表
DROP TABLE IF EXISTS DEPARTMENT_INFO ;
CREATE TABLE DEPARTMENT_INFO(
DEP_ID                                            BIGINT default 0 NOT NULL, --部门ID
DEP_NAME                                          VARCHAR(512) NOT NULL, --部门名称
CREATE_DATE                                       CHAR(8) NOT NULL, --创建日期
CREATE_TIME                                       CHAR(6) NOT NULL, --创建时间
DEP_REMARK                                        VARCHAR(512) NULL, --备注
CONSTRAINT DEPARTMENT_INFO_PK PRIMARY KEY(DEP_ID)   );

--角色信息表
DROP TABLE IF EXISTS SYS_ROLE ;
CREATE TABLE SYS_ROLE(
ROLE_ID                                           BIGINT default 0 NOT NULL, --角色ID
ROLE_NAME                                         VARCHAR(512) NOT NULL, --角色名称
ROLE_REMARK                                       VARCHAR(512) NULL, --备注
CONSTRAINT SYS_ROLE_PK PRIMARY KEY(ROLE_ID)   );

--组件信息表
DROP TABLE IF EXISTS COMPONENT_INFO ;
CREATE TABLE COMPONENT_INFO(
COMP_ID                                           VARCHAR(20) NOT NULL, --组件编号
COMP_NAME                                         VARCHAR(512) NOT NULL, --组件名称
COMP_STATE                                        CHAR(1) NOT NULL, --组件状态
COMP_VERSION                                      VARCHAR(100) NOT NULL, --组件版本
ICON_INFO                                         VARCHAR(512) NULL, --图标
COLOR_INFO                                        VARCHAR(512) NULL, --颜色
COMP_TYPE                                         CHAR(1) NOT NULL, --组件类型
COMP_REMARK                                       VARCHAR(512) NULL, --备注
CONSTRAINT COMPONENT_INFO_PK PRIMARY KEY(COMP_ID)   );

--组件参数
DROP TABLE IF EXISTS COMPONENT_PARAM ;
CREATE TABLE COMPONENT_PARAM(
PARAM_ID                                          BIGINT default 0 NOT NULL, --主键参数id
PARAM_NAME                                        VARCHAR(512) NOT NULL, --参数名称
PARAM_VALUE                                       VARCHAR(100) NOT NULL, --参数value
IS_MUST                                           CHAR(1) NOT NULL, --是否必要
PARAM_REMARK                                      VARCHAR(512) NOT NULL, --备注
COMP_ID                                           VARCHAR(20) NULL, --组件编号
CONSTRAINT COMPONENT_PARAM_PK PRIMARY KEY(PARAM_ID)   );

--代码信息表
DROP TABLE IF EXISTS CODE_INFO ;
CREATE TABLE CODE_INFO(
CI_SP_CODE                                        VARCHAR(20) NOT NULL, --代码值
CI_SP_CLASS                                       VARCHAR(20) NOT NULL, --所属类别号
CI_SP_CLASSNAME                                   VARCHAR(80) NOT NULL, --类别名称
CI_SP_NAME                                        VARCHAR(255) NOT NULL, --代码名称
CI_SP_REMARK                                      VARCHAR(512) NULL, --备注
CONSTRAINT CODE_INFO_PK PRIMARY KEY(CI_SP_CODE,CI_SP_CLASS)   );

--请求Agent类型
DROP TABLE IF EXISTS REQ_AGENTTYPE ;
CREATE TABLE REQ_AGENTTYPE(
REQ_ID                                            BIGINT default 0 NOT NULL, --请求ID
REQ_NAME                                          VARCHAR(512) NOT NULL, --中文名称
REQ_NO                                            CHAR(10) NULL, --请求编号
REQ_REMARK                                        VARCHAR(80) NULL, --备注
COMP_ID                                           VARCHAR(20) NOT NULL, --组件编号
CONSTRAINT REQ_AGENTTYPE_PK PRIMARY KEY(REQ_ID)   );

--组件菜单表
DROP TABLE IF EXISTS COMPONENT_MENU ;
CREATE TABLE COMPONENT_MENU(
MENU_ID                                           BIGINT default 0 NOT NULL, --主键菜单id
MENU_PATH                                         VARCHAR(200) NOT NULL, --菜单path
USER_TYPE                                         CHAR(2) NOT NULL, --用户类型
MENU_NAME                                         VARCHAR(200) NOT NULL, --菜单名称
COMP_ID                                           VARCHAR(20) NOT NULL, --组件编号
MENU_REMARK                                       VARCHAR(512) NULL, --备注
CONSTRAINT COMPONENT_MENU_PK PRIMARY KEY(MENU_ID)   );

--系统备份信息表
DROP TABLE IF EXISTS SYS_DUMP ;
CREATE TABLE SYS_DUMP(
DUMP_ID                                           BIGINT default 0 NOT NULL, --备份id
BAK_DATE                                          CHAR(8) NOT NULL, --备份日期
BAK_TIME                                          CHAR(6) NOT NULL, --备份时间
FILE_SIZE                                         VARCHAR(512) NOT NULL, --文件大小
FILE_NAME                                         VARCHAR(512) NOT NULL, --文件名称
HDFS_PATH                                         VARCHAR(512) NOT NULL, --文件存放hdfs路径
LENGTH                                            VARCHAR(10) NOT NULL, --备份时长
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT SYS_DUMP_PK PRIMARY KEY(DUMP_ID)   );

--备份恢复信息表
DROP TABLE IF EXISTS SYS_RECOVER ;
CREATE TABLE SYS_RECOVER(
RE_ID                                             BIGINT default 0 NOT NULL, --恢复id
RE_DATE                                           CHAR(8) NOT NULL, --恢复日期
RE_TIME                                           CHAR(6) NOT NULL, --恢复时间
LENGTH                                            VARCHAR(10) NOT NULL, --恢复时长
REMARK                                            VARCHAR(512) NULL, --备注
DUMP_ID                                           BIGINT default 0 NOT NULL, --备份id
CONSTRAINT SYS_RECOVER_PK PRIMARY KEY(RE_ID)   );

--采集情况信息表
DROP TABLE IF EXISTS COLLECT_CASE ;
CREATE TABLE COLLECT_CASE(
JOB_RS_ID                                         VARCHAR(40) NOT NULL, --作业执行结果ID
COLLECT_TYPE                                      CHAR(1) NOT NULL, --采集类型
JOB_TYPE                                          VARCHAR(10) NULL, --任务类型
COLLECT_TOTAL                                     BIGINT default 0 NULL, --总共采集(文件)表
COLECT_RECORD                                     DECIMAL(16) default 0 NOT NULL, --总共采集记录数
COLLET_DATABASE_SIZE                              VARCHAR(100) NULL, --总共采集数据大小
COLLECT_S_DATE                                    CHAR(8) NOT NULL, --开始采集日期
COLLECT_S_TIME                                    CHAR(6) NOT NULL, --开始采集时间
COLLECT_E_DATE                                    CHAR(8) NULL, --采集结束日期
COLLECT_E_TIME                                    CHAR(6) NULL, --采集结束时间
EXECUTE_LENGTH                                    VARCHAR(10) NULL, --运行总时长
EXECUTE_STATE                                     CHAR(2) NOT NULL, --运行状态
IS_AGAIN                                          CHAR(1) NOT NULL, --是否重跑
AGAIN_NUM                                         BIGINT default 0 NULL, --重跑次数
JOB_GROUP                                         VARCHAR(100) NOT NULL, --agent组ID
TASK_CLASSIFY                                     VARCHAR(512) NULL, --任务分类（原子性）表名-顶级文件夹
ETL_DATE                                          VARCHAR(18) NULL, --跑批日期
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
COLLECT_SET_ID                                    BIGINT default 0 NOT NULL, --数据库设置id
SOURCE_ID                                         BIGINT default 0 NOT NULL, --数据源ID
CC_REMARK                                         VARCHAR(512) NULL, --备注
CONSTRAINT COLLECT_CASE_PK PRIMARY KEY(JOB_RS_ID)   );

--Ftp采集设置
DROP TABLE IF EXISTS FTP_COLLECT ;
CREATE TABLE FTP_COLLECT(
FTP_ID                                            BIGINT default 0 NOT NULL, --ftp采集id
FTP_NUMBER                                        VARCHAR(200) NOT NULL, --ftp任务编号
FTP_NAME                                          VARCHAR(512) NOT NULL, --ftp采集任务名称
START_DATE                                        CHAR(8) NOT NULL, --开始日期
END_DATE                                          CHAR(8) NOT NULL, --结束日期
FTP_IP                                            VARCHAR(50) NOT NULL, --ftp服务IP
FTP_PORT                                          VARCHAR(10) NOT NULL, --ftp服务器端口
FTP_USERNAME                                      VARCHAR(512) NOT NULL, --ftp用户名
FTP_PASSWORD                                      VARCHAR(100) NOT NULL, --用户密码
FTP_DIR                                           VARCHAR(512) NOT NULL, --ftp服务器目录
LOCAL_PATH                                        VARCHAR(512) NOT NULL, --本地路径
FTP_RULE_PATH                                     CHAR(1) default '1' NOT NULL, --下级目录规则
CHILD_FILE_PATH                                   VARCHAR(512) NULL, --下级文件路径
CHILD_TIME                                        CHAR(1) NULL, --下级文件时间
FILE_SUFFIX                                       VARCHAR(200) NULL, --获取文件后缀
FTP_MODEL                                         CHAR(1) default '1' NOT NULL, --FTP推拉模式是为推模式
RUN_WAY                                           CHAR(1) NOT NULL, --启动方式
REMARK                                            VARCHAR(512) NULL, --备注
IS_SENDOK                                         CHAR(1) NOT NULL, --是否完成
IS_UNZIP                                          CHAR(1) NOT NULL, --是否解压
REDUCE_TYPE                                       CHAR(1) NULL, --解压格式
IS_READ_REALTIME                                  CHAR(1) NOT NULL, --是否实时读取
REALTIME_INTERVAL                                 BIGINT default 0 NOT NULL, --实时读取间隔时间
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
CONSTRAINT FTP_COLLECT_PK PRIMARY KEY(FTP_ID)   );

--ftp已传输表
DROP TABLE IF EXISTS FTP_TRANSFERED ;
CREATE TABLE FTP_TRANSFERED(
FTP_TRANSFERED_ID                                 VARCHAR(40) NOT NULL, --已传输表id-UUID
FTP_ID                                            BIGINT default 0 NOT NULL, --ftp采集id
TRANSFERED_NAME                                   VARCHAR(512) NOT NULL, --已传输文件名称
FILE_PATH                                         VARCHAR(512) NOT NULL, --文件绝对路径
FTP_FILEMD5                                       VARCHAR(40) NULL, --文件MD5
FTP_DATE                                          CHAR(8) NOT NULL, --ftp日期
FTP_TIME                                          CHAR(6) NOT NULL, --ftp时间
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT FTP_TRANSFERED_PK PRIMARY KEY(FTP_TRANSFERED_ID)   );

--数据存储层配置属性表
DROP TABLE IF EXISTS DATA_STORE_LAYER_ATTR ;
CREATE TABLE DATA_STORE_LAYER_ATTR(
DSLA_ID                                           BIGINT default 0 NOT NULL, --存储配置主键信息
STORAGE_PROPERTY_KEY                              VARCHAR(512) NOT NULL, --属性key
STORAGE_PROPERTY_VAL                              VARCHAR(512) NOT NULL, --属性value
IS_FILE                                           CHAR(1) NOT NULL, --是否为配置文件
DSLA_REMARK                                       VARCHAR(512) NULL, --备注
DSL_ID                                            BIGINT default 0 NOT NULL, --存储层配置ID
CONSTRAINT DATA_STORE_LAYER_ATTR_PK PRIMARY KEY(DSLA_ID)   );

--错误信息表
DROP TABLE IF EXISTS ERROR_INFO ;
CREATE TABLE ERROR_INFO(
ERROR_ID                                          BIGINT default 0 NOT NULL, --错误ID
JOB_RS_ID                                         VARCHAR(40) NOT NULL, --作业执行结果ID
ERROR_MSG                                         VARCHAR(15555) NULL, --error_msg
CONSTRAINT ERROR_INFO_PK PRIMARY KEY(ERROR_ID)   );

--信号文件入库信息
DROP TABLE IF EXISTS SIGNAL_FILE ;
CREATE TABLE SIGNAL_FILE(
SIGNAL_ID                                         BIGINT default 0 NOT NULL, --信号id
IS_INTO_HBASE                                     CHAR(1) NOT NULL, --是否入hbase
IS_COMPRESSION                                    CHAR(1) default '0' NOT NULL, --Hbase是使用压缩
IS_INTO_HIVE                                      CHAR(1) NOT NULL, --是否入hive
IS_MPP                                            CHAR(1) NOT NULL, --是否为MPP
TABLE_TYPE                                        CHAR(1) NOT NULL, --是内部表还是外部表
IS_FULLINDEX                                      CHAR(1) NOT NULL, --是否创建全文索引
FILE_FORMAT                                       CHAR(1) NOT NULL, --文件格式
IS_SOLR_HBASE                                     CHAR(1) default '1' NOT NULL, --是否使用solrOnHbase
IS_CBD                                            CHAR(1) default '1' NOT NULL, --是否使用carbondata
DATABASE_ID                                       BIGINT default 0 NOT NULL, --数据库设置id
CONSTRAINT SIGNAL_FILE_PK PRIMARY KEY(SIGNAL_ID)   );

--表存储信息
DROP TABLE IF EXISTS TABLE_STORAGE_INFO ;
CREATE TABLE TABLE_STORAGE_INFO(
STORAGE_ID                                        BIGINT default 0 NOT NULL, --储存编号
FILE_FORMAT                                       CHAR(1) default '1' NOT NULL, --文件格式
STORAGE_TYPE                                      CHAR(1) NOT NULL, --进数方式
IS_ZIPPER                                         CHAR(1) NOT NULL, --是否拉链存储
STORAGE_TIME                                      BIGINT default 0 NOT NULL, --存储期限（以天为单位）
HYREN_NAME                                        VARCHAR(100) NOT NULL, --进库之后拼接的表名
TABLE_ID                                          BIGINT default 0 NULL, --表名ID
CONSTRAINT TABLE_STORAGE_INFO_PK PRIMARY KEY(STORAGE_ID)   );

--数据源
DROP TABLE IF EXISTS DATA_SOURCE ;
CREATE TABLE DATA_SOURCE(
SOURCE_ID                                         BIGINT default 0 NOT NULL, --数据源ID
DATASOURCE_NUMBER                                 VARCHAR(100) NULL, --数据源编号
DATASOURCE_NAME                                   VARCHAR(512) NOT NULL, --数据源名称
SOURCE_REMARK                                     VARCHAR(512) NULL, --数据源详细描述
CREATE_DATE                                       CHAR(8) NOT NULL, --创建日期
CREATE_TIME                                       CHAR(6) NOT NULL, --创建时间
CREATE_USER_ID                                    BIGINT default 0 NOT NULL, --用户ID
DATASOURCE_REMARK                                 VARCHAR(512) NULL, --备注
CONSTRAINT DATA_SOURCE_PK PRIMARY KEY(SOURCE_ID)   );

--数据源与部门关系
DROP TABLE IF EXISTS SOURCE_RELATION_DEP ;
CREATE TABLE SOURCE_RELATION_DEP(
SOURCE_ID                                         BIGINT default 0 NOT NULL, --数据源ID
DEP_ID                                            BIGINT default 0 NOT NULL, --部门ID
CONSTRAINT SOURCE_RELATION_DEP_PK PRIMARY KEY(SOURCE_ID,DEP_ID)   );

--Agent信息表
DROP TABLE IF EXISTS AGENT_INFO ;
CREATE TABLE AGENT_INFO(
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
AGENT_NAME                                        VARCHAR(512) NOT NULL, --Agent名称
AGENT_TYPE                                        CHAR(1) NOT NULL, --agent类别
AGENT_IP                                          VARCHAR(50) NOT NULL, --Agent所在服务器IP
AGENT_PORT                                        VARCHAR(10) NULL, --agent服务器端口
AGENT_STATUS                                      CHAR(1) NOT NULL, --agent状态
CREATE_DATE                                       CHAR(8) NOT NULL, --创建日期
CREATE_TIME                                       CHAR(6) NOT NULL, --创建时间
SOURCE_ID                                         BIGINT default 0 NOT NULL, --数据源ID
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
CONSTRAINT AGENT_INFO_PK PRIMARY KEY(AGENT_ID)   );

--源系统数据库设置
DROP TABLE IF EXISTS DATABASE_SET ;
CREATE TABLE DATABASE_SET(
DATABASE_ID                                       BIGINT default 0 NOT NULL, --数据库设置id
AGENT_ID                                          BIGINT default 0 NULL, --Agent_id
HOST_NAME                                         VARCHAR(512) NULL, --主机名
DATABASE_NUMBER                                   VARCHAR(10) NOT NULL, --数据库设置编号
SYSTEM_TYPE                                       VARCHAR(512) NULL, --操作系统类型
TASK_NAME                                         VARCHAR(512) NULL, --数据库采集任务名称
DATABASE_NAME                                     VARCHAR(512) NULL, --数据库名称
DATABASE_PAD                                      VARCHAR(100) NULL, --数据库密码
DATABASE_DRIVE                                    VARCHAR(512) NULL, --数据库驱动
DATABASE_TYPE                                     CHAR(2) NULL, --数据库类型
USER_NAME                                         VARCHAR(512) NULL, --用户名称
DATABASE_IP                                       VARCHAR(50) NULL, --数据库服务器IP
DATABASE_PORT                                     VARCHAR(10) NULL, --数据库端口
DB_AGENT                                          CHAR(1) NOT NULL, --是否DB文件数据采集
DATABASE_SEPARATORR                               VARCHAR(512) NULL, --数据采用分隔符
ROW_SEPARATOR                                     VARCHAR(512) NULL, --数据行分隔符
PLANE_URL                                         VARCHAR(512) NULL, --DB文件数据字典位置
IS_SENDOK                                         CHAR(1) NOT NULL, --是否设置完成并发送成功
CP_OR                                             VARCHAR(512) NULL, --清洗顺序
JDBC_URL                                          VARCHAR(512) NULL, --数据库连接地址
COLLECT_TYPE                                      CHAR(1) NOT NULL, --数据库采集方式
DSL_ID                                            BIGINT default 0 NULL, --存储层配置ID
CLASSIFY_ID                                       BIGINT default 0 NOT NULL, --分类id
CONSTRAINT DATABASE_SET_PK PRIMARY KEY(DATABASE_ID)   );

--清洗作业参数属性表
DROP TABLE IF EXISTS CLEAN_PARAMETER ;
CREATE TABLE CLEAN_PARAMETER(
C_ID                                              BIGINT default 0 NOT NULL, --清洗参数编号
CLEAN_TYPE                                        CHAR(1) NOT NULL, --清洗方式
FILLING_TYPE                                      CHAR(1) NULL, --补齐方式
CHARACTER_FILLING                                 VARCHAR(512) NULL, --补齐字符
FILLING_LENGTH                                    BIGINT default 0 NULL, --补齐长度
FIELD                                             VARCHAR(512) NULL, --原字段
REPLACE_FEILD                                     VARCHAR(512) NULL, --替换字段
DATABASE_ID                                       BIGINT default 0 NOT NULL, --数据库设置id
CONSTRAINT CLEAN_PARAMETER_PK PRIMARY KEY(C_ID)   );

--数据库对应表
DROP TABLE IF EXISTS TABLE_INFO ;
CREATE TABLE TABLE_INFO(
TABLE_ID                                          BIGINT default 0 NOT NULL, --表名ID
TABLE_NAME                                        VARCHAR(512) NOT NULL, --表名
TABLE_CH_NAME                                     VARCHAR(512) NOT NULL, --中文名称
REC_NUM_DATE                                      CHAR(8) NOT NULL, --数据获取时间
TABLE_COUNT                                       VARCHAR(16) default '0' NULL, --记录数
DATABASE_ID                                       BIGINT default 0 NOT NULL, --数据库设置id
SOURCE_TABLEID                                    VARCHAR(512) NULL, --源表ID
VALID_S_DATE                                      CHAR(8) NOT NULL, --有效开始日期
VALID_E_DATE                                      CHAR(8) NOT NULL, --有效结束日期
UNLOAD_TYPE                                       CHAR(1) NULL, --落地文件-卸数方式
SQL                                               VARCHAR(6000) NULL, --自定义sql语句
TI_OR                                             VARCHAR(512) NULL, --清洗顺序
IS_MD5                                            CHAR(1) NOT NULL, --是否使用MD5
IS_REGISTER                                       CHAR(1) NOT NULL, --是否仅登记
IS_CUSTOMIZE_SQL                                  CHAR(1) NOT NULL, --是否并行抽取中的自定义sql
IS_PARALLEL                                       CHAR(1) NOT NULL, --是否并行抽取
IS_USER_DEFINED                                   CHAR(1) default '1' NOT NULL, --是否sql抽取
PAGE_SQL                                          VARCHAR(6000) NULL, --分页sql
PAGEPARALLELS                                     INTEGER default 0 NULL, --分页并行数
DATAINCREMENT                                     INTEGER default 0 NULL, --每天数据增量
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT TABLE_INFO_PK PRIMARY KEY(TABLE_ID)   );

--表清洗参数信息
DROP TABLE IF EXISTS TABLE_CLEAN ;
CREATE TABLE TABLE_CLEAN(
TABLE_CLEAN_ID                                    BIGINT default 0 NOT NULL, --清洗参数编号
CLEAN_TYPE                                        CHAR(1) NOT NULL, --清洗方式
FILLING_TYPE                                      CHAR(1) NULL, --补齐方式
CHARACTER_FILLING                                 VARCHAR(512) NULL, --补齐字符
FILLING_LENGTH                                    BIGINT default 0 NULL, --补齐长度
FIELD                                             VARCHAR(512) NULL, --原字段
REPLACE_FEILD                                     VARCHAR(512) NULL, --替换字段
TABLE_ID                                          BIGINT default 0 NOT NULL, --表名ID
CONSTRAINT TABLE_CLEAN_PK PRIMARY KEY(TABLE_CLEAN_ID)   );

--列清洗参数信息
DROP TABLE IF EXISTS COLUMN_CLEAN ;
CREATE TABLE COLUMN_CLEAN(
COL_CLEAN_ID                                      BIGINT default 0 NOT NULL, --清洗参数编号
CONVERT_FORMAT                                    VARCHAR(512) NULL, --转换格式
OLD_FORMAT                                        VARCHAR(512) NULL, --原始格式
CLEAN_TYPE                                        CHAR(1) NOT NULL, --清洗方式
FILLING_TYPE                                      CHAR(1) NULL, --补齐方式
CHARACTER_FILLING                                 VARCHAR(512) NULL, --补齐字符
FILLING_LENGTH                                    BIGINT default 0 NULL, --补齐长度
CODENAME                                          VARCHAR(512) NULL, --码值名称
CODESYS                                           VARCHAR(512) NULL, --码值所属系统
FIELD                                             VARCHAR(512) NULL, --原字段
REPLACE_FEILD                                     VARCHAR(512) NULL, --替换字段
COLUMN_ID                                         BIGINT default 0 NOT NULL, --字段ID
CONSTRAINT COLUMN_CLEAN_PK PRIMARY KEY(COL_CLEAN_ID)   );

--Agent下载信息
DROP TABLE IF EXISTS AGENT_DOWN_INFO ;
CREATE TABLE AGENT_DOWN_INFO(
DOWN_ID                                           BIGINT default 0 NOT NULL, --下载编号(primary)
AGENT_NAME                                        VARCHAR(512) NOT NULL, --Agent名称
AGENT_IP                                          VARCHAR(50) NOT NULL, --Agent IP
AGENT_PORT                                        VARCHAR(10) NOT NULL, --Agent端口
USER_NAME                                         VARCHAR(10) NULL, --用户名
PASSWD                                            VARCHAR(10) NULL, --密码
SAVE_DIR                                          VARCHAR(512) NOT NULL, --存放目录
LOG_DIR                                           VARCHAR(512) NOT NULL, --日志目录
DEPLOY                                            CHAR(1) NOT NULL, --是否部署
AI_DESC                                           VARCHAR(200) NULL, --描述
AGENT_CONTEXT                                     VARCHAR(200) NOT NULL, --agent的context
AGENT_PATTERN                                     VARCHAR(200) NOT NULL, --agent的访问路径
AGENT_TYPE                                        CHAR(1) NOT NULL, --agent类别
AGENT_ID                                          BIGINT default 0 NULL, --Agent_id
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT AGENT_DOWN_INFO_PK PRIMARY KEY(DOWN_ID)   );

--表对应的字段
DROP TABLE IF EXISTS TABLE_COLUMN ;
CREATE TABLE TABLE_COLUMN(
COLUMN_ID                                         BIGINT default 0 NOT NULL, --字段ID
IS_GET                                            CHAR(1) default '0' NULL, --是否采集
IS_PRIMARY_KEY                                    CHAR(1) NOT NULL, --是否为主键
COLUMN_NAME                                       VARCHAR(512) NOT NULL, --列名
COLUMN_TYPE                                       VARCHAR(512) NULL, --列字段类型
COLUMN_CH_NAME                                    VARCHAR(512) NULL, --列中文名称
TABLE_ID                                          BIGINT default 0 NOT NULL, --表名ID
VALID_S_DATE                                      CHAR(8) NOT NULL, --有效开始日期
VALID_E_DATE                                      CHAR(8) NOT NULL, --有效结束日期
IS_ALIVE                                          CHAR(1) default '1' NOT NULL, --是否保留原字段
IS_NEW                                            CHAR(1) default '1' NOT NULL, --是否为变化生成
TC_OR                                             VARCHAR(512) NULL, --清洗顺序
TC_REMARK                                         VARCHAR(512) NULL, --备注
CONSTRAINT TABLE_COLUMN_PK PRIMARY KEY(COLUMN_ID)   );

--采集任务分类表
DROP TABLE IF EXISTS COLLECT_JOB_CLASSIFY ;
CREATE TABLE COLLECT_JOB_CLASSIFY(
CLASSIFY_ID                                       BIGINT default 0 NOT NULL, --分类id
CLASSIFY_NUM                                      VARCHAR(512) NOT NULL, --分类编号
CLASSIFY_NAME                                     VARCHAR(512) NOT NULL, --分类名称
REMARK                                            VARCHAR(512) NULL, --备注
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
CONSTRAINT COLLECT_JOB_CLASSIFY_PK PRIMARY KEY(CLASSIFY_ID)   );

--文件源设置
DROP TABLE IF EXISTS FILE_SOURCE ;
CREATE TABLE FILE_SOURCE(
FILE_SOURCE_ID                                    BIGINT default 0 NOT NULL, --文件源ID
FILE_SOURCE_PATH                                  VARCHAR(512) NOT NULL, --文件源路径
IS_PDF                                            CHAR(1) NOT NULL, --PDF文件
IS_OFFICE                                         CHAR(1) NOT NULL, --office文件
IS_TEXT                                           CHAR(1) NOT NULL, --文本文件
IS_VIDEO                                          CHAR(1) NOT NULL, --视频文件
IS_AUDIO                                          CHAR(1) NOT NULL, --音频文件
IS_IMAGE                                          CHAR(1) NOT NULL, --图片文件
IS_COMPRESS                                       CHAR(1) NOT NULL, --压缩文件
CUSTOM_SUFFIX                                     VARCHAR(80) NULL, --自定义后缀
IS_OTHER                                          CHAR(1) NOT NULL, --其他
FILE_REMARK                                       VARCHAR(512) NULL, --备注
FCS_ID                                            BIGINT default 0 NOT NULL, --文件系统采集ID
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
CONSTRAINT FILE_SOURCE_PK PRIMARY KEY(FILE_SOURCE_ID)   );

--列拆分信息表
DROP TABLE IF EXISTS COLUMN_SPLIT ;
CREATE TABLE COLUMN_SPLIT(
COL_SPLIT_ID                                      BIGINT default 0 NOT NULL, --字段编号
COL_NAME                                          VARCHAR(512) NOT NULL, --字段名称
COL_OFFSET                                        VARCHAR(512) NULL, --字段偏移量
SPLIT_SEP                                         VARCHAR(512) NULL, --拆分分隔符
SEQ                                               BIGINT default 0 NULL, --拆分对应序号
SPLIT_TYPE                                        CHAR(1) NOT NULL, --拆分方式
COL_ZHNAME                                        VARCHAR(512) NULL, --中文名称
REMARK                                            VARCHAR(512) NULL, --备注
COL_TYPE                                          VARCHAR(512) NOT NULL, --字段类型
VALID_S_DATE                                      CHAR(8) NOT NULL, --有效开始日期
VALID_E_DATE                                      CHAR(8) NOT NULL, --有效结束日期
COL_CLEAN_ID                                      BIGINT default 0 NOT NULL, --清洗参数编号
COLUMN_ID                                         BIGINT default 0 NOT NULL, --字段ID
CONSTRAINT COLUMN_SPLIT_PK PRIMARY KEY(COL_SPLIT_ID)   );

--列合并信息表
DROP TABLE IF EXISTS COLUMN_MERGE ;
CREATE TABLE COLUMN_MERGE(
COL_MERGE_ID                                      BIGINT default 0 NOT NULL, --字段编号
COL_NAME                                          VARCHAR(512) NOT NULL, --合并后字段名称
OLD_NAME                                          VARCHAR(512) NOT NULL, --要合并的字段
COL_ZHNAME                                        VARCHAR(512) NULL, --中文名称
REMARK                                            VARCHAR(512) NULL, --备注
COL_TYPE                                          VARCHAR(512) NOT NULL, --字段类型
VALID_S_DATE                                      CHAR(8) NOT NULL, --有效开始日期
VALID_E_DATE                                      CHAR(8) NOT NULL, --有效结束日期
TABLE_ID                                          BIGINT default 0 NOT NULL, --表名ID
CONSTRAINT COLUMN_MERGE_PK PRIMARY KEY(COL_MERGE_ID)   );

--对象采集对应信息
DROP TABLE IF EXISTS OBJECT_COLLECT_TASK ;
CREATE TABLE OBJECT_COLLECT_TASK(
OCS_ID                                            BIGINT default 0 NOT NULL, --对象采集任务编号
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
EN_NAME                                           VARCHAR(512) NOT NULL, --英文名称
ZH_NAME                                           VARCHAR(512) NOT NULL, --中文名称
COLLECT_DATA_TYPE                                 CHAR(1) NOT NULL, --数据类型
FIRSTLINE                                         VARCHAR(2048) NULL, --第一行数据
REMARK                                            VARCHAR(512) NULL, --备注
DATABASE_CODE                                     CHAR(1) NOT NULL, --采集编码
UPDATETYPE                                        CHAR(1) NOT NULL, --更新方式
ODC_ID                                            BIGINT default 0 NULL, --对象采集id
CONSTRAINT OBJECT_COLLECT_TASK_PK PRIMARY KEY(OCS_ID)   );

--文件系统设置
DROP TABLE IF EXISTS FILE_COLLECT_SET ;
CREATE TABLE FILE_COLLECT_SET(
FCS_ID                                            BIGINT default 0 NOT NULL, --文件系统采集ID
AGENT_ID                                          BIGINT default 0 NULL, --Agent_id
FCS_NAME                                          VARCHAR(512) NOT NULL, --文件系统采集任务名称
HOST_NAME                                         VARCHAR(512) NULL, --主机名称
SYSTEM_TYPE                                       VARCHAR(512) NULL, --操作系统类型
IS_SENDOK                                         CHAR(1) NOT NULL, --是否设置完成并发送成功
IS_SOLR                                           CHAR(1) NOT NULL, --是否入solr
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT FILE_COLLECT_SET_PK PRIMARY KEY(FCS_ID)   );

--对象采集设置
DROP TABLE IF EXISTS OBJECT_COLLECT ;
CREATE TABLE OBJECT_COLLECT(
ODC_ID                                            BIGINT default 0 NOT NULL, --对象采集id
OBJECT_COLLECT_TYPE                               CHAR(1) NOT NULL, --对象采集方式
OBJ_NUMBER                                        VARCHAR(200) NOT NULL, --对象采集设置编号
OBJ_COLLECT_NAME                                  VARCHAR(512) NOT NULL, --对象采集任务名称
SYSTEM_NAME                                       VARCHAR(512) NOT NULL, --操作系统类型
HOST_NAME                                         VARCHAR(512) NOT NULL, --主机名称
LOCAL_TIME                                        CHAR(20) NOT NULL, --本地系统时间
SERVER_DATE                                       CHAR(20) NOT NULL, --服务器日期
S_DATE                                            CHAR(8) NOT NULL, --开始日期
E_DATE                                            CHAR(8) NOT NULL, --结束日期
DATABASE_CODE                                     CHAR(1) NOT NULL, --采集编码
FILE_PATH                                         VARCHAR(512) NOT NULL, --采集文件路径
IS_DICTIONARY                                     CHAR(1) NOT NULL, --是否存在数据字典
IS_SENDOK                                         CHAR(1) NOT NULL, --是否设置完成并发送成功
DATA_DATE                                         CHAR(8) NOT NULL, --数据日期
FILE_SUFFIX                                       VARCHAR(100) NOT NULL, --文件后缀名
REMARK                                            VARCHAR(512) NULL, --备注
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
CONSTRAINT OBJECT_COLLECT_PK PRIMARY KEY(ODC_ID)   );

--数据权限设置表
DROP TABLE IF EXISTS DATA_AUTH ;
CREATE TABLE DATA_AUTH(
DA_ID                                             BIGINT default 0 NOT NULL, --数据权限设置ID
APPLY_DATE                                        CHAR(8) NOT NULL, --申请日期
APPLY_TIME                                        CHAR(6) NOT NULL, --申请时间
APPLY_TYPE                                        CHAR(1) NOT NULL, --申请类型
AUTH_TYPE                                         CHAR(1) NOT NULL, --权限类型
AUDIT_DATE                                        CHAR(8) NULL, --审核日期
AUDIT_TIME                                        CHAR(6) NULL, --审核时间
AUDIT_USERID                                      BIGINT default 0 NULL, --审核人ID
AUDIT_NAME                                        VARCHAR(512) NULL, --审核人名称
FILE_ID                                           VARCHAR(40) NOT NULL, --文件编号
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
DEP_ID                                            BIGINT default 0 NOT NULL, --部门ID
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
SOURCE_ID                                         BIGINT default 0 NOT NULL, --数据源ID
COLLECT_SET_ID                                    BIGINT default 0 NOT NULL, --数据库设置id
CONSTRAINT DATA_AUTH_PK PRIMARY KEY(DA_ID)   );

--系统采集作业结果表
DROP TABLE IF EXISTS SYS_EXEINFO ;
CREATE TABLE SYS_EXEINFO(
EXE_ID                                            BIGINT default 0 NOT NULL, --执行id
JOB_NAME                                          VARCHAR(512) NOT NULL, --作业名称名称
JOB_TABLENAME                                     VARCHAR(512) NULL, --作业表名
ETL_DATE                                          CHAR(8) NOT NULL, --执行日期
EXECUTE_STATE                                     CHAR(2) NOT NULL, --运行状态
EXE_PARAMETER                                     VARCHAR(512) NOT NULL, --参数
ERR_INFO                                          VARCHAR(512) NOT NULL, --错误信息
IS_VALID                                          CHAR(1) NOT NULL, --作业是否有效
ST_DATE                                           CHAR(14) NOT NULL, --开始日期
ED_DATE                                           CHAR(14) NOT NULL, --结束日期
DATABASE_ID                                       BIGINT default 0 NOT NULL, --数据库设置id
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
SOURCE_ID                                         BIGINT default 0 NOT NULL, --数据源ID
CONSTRAINT SYS_EXEINFO_PK PRIMARY KEY(EXE_ID)   );

--源文件属性清册
DROP TABLE IF EXISTS SOURCE_FILE_DETAILED ;
CREATE TABLE SOURCE_FILE_DETAILED(
SFD_ID                                            VARCHAR(40) NOT NULL, --源文件属性清册ID
FILE_ID                                           VARCHAR(40) NOT NULL, --文件编号
ORIGINAL_NAME                                     VARCHAR(512) NOT NULL, --原始文件名或表中文名称
ORIGINAL_UPDATE_DATE                              CHAR(8) NOT NULL, --原文件最后修改日期
ORIGINAL_UPDATE_TIME                              CHAR(6) NOT NULL, --原文件最后修改时间
TABLE_NAME                                        VARCHAR(512) NULL, --表名
META_INFO                                         VARCHAR(6000) NULL, --META元信息
HBASE_NAME                                        VARCHAR(512) NOT NULL, --HBase对应表名
STORAGE_DATE                                      CHAR(8) NOT NULL, --入库日期
STORAGE_TIME                                      CHAR(6) NOT NULL, --入库时间
FILE_SIZE                                         BIGINT default 0 NOT NULL, --文件大小
FILE_TYPE                                         VARCHAR(512) NOT NULL, --文件类型
FILE_SUFFIX                                       VARCHAR(512) NOT NULL, --文件后缀
HDFS_STORAGE_PATH                                 VARCHAR(512) NULL, --hdfs储路径
SOURCE_PATH                                       VARCHAR(512) NOT NULL, --文件路径
FILE_MD5                                          VARCHAR(40) NULL, --文件MD5值
FILE_AVRO_PATH                                    VARCHAR(500) NULL, --所在avro文件地址
FILE_AVRO_BLOCK                                   DECIMAL(15) NULL, --所存avro文件block号
IS_BIG_FILE                                       CHAR(1) default '1' NULL, --是否为大文件
FOLDER_ID                                         BIGINT default 0 NOT NULL, --文件夹编号
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
SOURCE_ID                                         BIGINT default 0 NOT NULL, --数据源ID
COLLECT_SET_ID                                    BIGINT default 0 NOT NULL, --数据库设置id
CONSTRAINT SOURCE_FILE_DETAILED_PK PRIMARY KEY(SFD_ID)   );

--源文件属性
DROP TABLE IF EXISTS SOURCE_FILE_ATTRIBUTE ;
CREATE TABLE SOURCE_FILE_ATTRIBUTE(
FILE_ID                                           VARCHAR(40) NOT NULL, --文件编号
IS_IN_HBASE                                       CHAR(1) default '1' NOT NULL, --是否已进入HBASE
SEQENCING                                         BIGINT default 0 NOT NULL, --排序计数
COLLECT_TYPE                                      CHAR(1) NOT NULL, --采集类型
ORIGINAL_NAME                                     VARCHAR(512) NOT NULL, --原始文件名或表中文名称
ORIGINAL_UPDATE_DATE                              CHAR(8) NOT NULL, --原文件最后修改日期
ORIGINAL_UPDATE_TIME                              CHAR(6) NOT NULL, --原文件最后修改时间
TABLE_NAME                                        VARCHAR(512) NULL, --采集的原始表名
HBASE_NAME                                        VARCHAR(512) NOT NULL, --系统内对应表名
META_INFO                                         VARCHAR(6000) NULL, --META元信息
STORAGE_DATE                                      CHAR(8) NOT NULL, --入库日期
STORAGE_TIME                                      CHAR(6) NOT NULL, --入库时间
FILE_SIZE                                         BIGINT default 0 NOT NULL, --文件大小
FILE_TYPE                                         VARCHAR(512) NOT NULL, --文件类型
FILE_SUFFIX                                       VARCHAR(512) NOT NULL, --文件后缀
SOURCE_PATH                                       VARCHAR(512) NULL, --文件路径
FILE_MD5                                          VARCHAR(40) NULL, --文件MD5值
FILE_AVRO_PATH                                    VARCHAR(500) NULL, --所在avro文件地址
FILE_AVRO_BLOCK                                   DECIMAL(15) NULL, --所存avro文件block号
IS_BIG_FILE                                       CHAR(1) default '1' NULL, --是否为大文件
IS_CACHE                                          CHAR(1) NULL, --是否本地缓存
FOLDER_ID                                         BIGINT default 0 NOT NULL, --文件夹编号
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
SOURCE_ID                                         BIGINT default 0 NOT NULL, --数据源ID
COLLECT_SET_ID                                    BIGINT default 0 NOT NULL, --数据库设置id
CONSTRAINT SOURCE_FILE_ATTRIBUTE_PK PRIMARY KEY(FILE_ID)   );

--源文件夹属性表
DROP TABLE IF EXISTS SOURCE_FOLDER_ATTRIBUTE ;
CREATE TABLE SOURCE_FOLDER_ATTRIBUTE(
FOLDER_ID                                         BIGINT default 0 NOT NULL, --文件夹编号
SUPER_ID                                          BIGINT default 0 NULL, --文件夹编号
FOLDER_NAME                                       VARCHAR(512) NOT NULL, --文件夹名
ORIGINAL_CREATE_DATE                              CHAR(8) NOT NULL, --文件夹生产日期
ORIGINAL_CREATE_TIME                              CHAR(6) NOT NULL, --文件夹生成时间
FOLDER_SIZE                                       DECIMAL(16,2) default 0 NOT NULL, --文件夹大小
STORAGE_DATE                                      CHAR(8) NOT NULL, --文件夹入库日期
STORAGE_TIME                                      CHAR(6) NOT NULL, --文件夹入库时间
FOLDERS_IN_NO                                     BIGINT default 0 NOT NULL, --文件夹内文件夹数量
LOCATION_IN_HDFS                                  VARCHAR(512) NOT NULL, --hdfs中存储位置
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
SOURCE_ID                                         BIGINT default 0 NOT NULL, --数据源ID
CONSTRAINT SOURCE_FOLDER_ATTRIBUTE_PK PRIMARY KEY(FOLDER_ID)   );

--全文检索排序表
DROP TABLE IF EXISTS SEARCH_INFO ;
CREATE TABLE SEARCH_INFO(
SI_ID                                             BIGINT default 0 NOT NULL, --si_id
FILE_ID                                           VARCHAR(40) NOT NULL, --文件编号
WORD_NAME                                         VARCHAR(1024) NOT NULL, --关键字
SI_COUNT                                          BIGINT default 0 NOT NULL, --点击量
SI_REMARK                                         VARCHAR(512) NULL, --备注
CONSTRAINT SEARCH_INFO_PK PRIMARY KEY(SI_ID)   );

--我的收藏
DROP TABLE IF EXISTS USER_FAV ;
CREATE TABLE USER_FAV(
FAV_ID                                            BIGINT default 0 NOT NULL, --收藏ID
ORIGINAL_NAME                                     VARCHAR(512) NOT NULL, --原始文件名称
FILE_ID                                           VARCHAR(40) NOT NULL, --文件编号
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
FAV_FLAG                                          CHAR(1) NOT NULL, --是否有效
CONSTRAINT USER_FAV_PK PRIMARY KEY(FAV_ID)   );

--数据抽取定义
DROP TABLE IF EXISTS DATA_EXTRACTION_DEF ;
CREATE TABLE DATA_EXTRACTION_DEF(
DED_ID                                            BIGINT default 0 NOT NULL, --数据抽取定义主键
TABLE_ID                                          BIGINT default 0 NOT NULL, --表名ID
DATA_EXTRACT_TYPE                                 CHAR(1) NOT NULL, --数据文件源头
IS_HEADER                                         CHAR(1) NOT NULL, --是否需要表头
DATABASE_CODE                                     CHAR(1) NOT NULL, --数据抽取落地编码
ROW_SEPARATOR                                     VARCHAR(512) NULL, --行分隔符
DATABASE_SEPARATORR                               VARCHAR(512) NULL, --列分割符
DBFILE_FORMAT                                     CHAR(1) default '1' NOT NULL, --数据落地格式
PLANE_URL                                         VARCHAR(512) NULL, --数据落地目录
FILE_SUFFIX                                       VARCHAR(80) NULL, --落地文件后缀名
IS_ARCHIVED                                       CHAR(1) default '0' NOT NULL, --是否转存
DED_REMARK                                        VARCHAR(512) NULL, --备注
CONSTRAINT DATA_EXTRACTION_DEF_PK PRIMARY KEY(DED_ID)   );

--编码信息表
DROP TABLE IF EXISTS HYREN_CODE_INFO ;
CREATE TABLE HYREN_CODE_INFO(
CODE_CLASSIFY                                     VARCHAR(100) NOT NULL, --编码分类
CODE_VALUE                                        VARCHAR(100) NOT NULL, --编码类型值
CODE_CLASSIFY_NAME                                VARCHAR(512) NOT NULL, --编码分类名称
CODE_TYPE_NAME                                    VARCHAR(512) NOT NULL, --编码名称
CODE_REMARK                                       VARCHAR(512) NULL, --编码描述
CONSTRAINT HYREN_CODE_INFO_PK PRIMARY KEY(CODE_CLASSIFY,CODE_VALUE)   );

--源系统编码信息
DROP TABLE IF EXISTS ORIG_CODE_INFO ;
CREATE TABLE ORIG_CODE_INFO(
ORIG_ID                                           BIGINT default 0 NOT NULL, --源系统编码主键
ORIG_SYS_CODE                                     VARCHAR(100) NULL, --码值系统编码
CODE_CLASSIFY                                     VARCHAR(100) NOT NULL, --编码分类
CODE_VALUE                                        VARCHAR(100) NOT NULL, --编码类型值
ORIG_VALUE                                        VARCHAR(100) NOT NULL, --源系统编码值
CODE_REMARK                                       VARCHAR(512) NULL, --系统编码描述
CONSTRAINT ORIG_CODE_INFO_PK PRIMARY KEY(ORIG_ID)   );

--源系统信
DROP TABLE IF EXISTS ORIG_SYSO_INFO ;
CREATE TABLE ORIG_SYSO_INFO(
ORIG_SYS_CODE                                     VARCHAR(100) NOT NULL, --码值系统编码
ORIG_SYS_NAME                                     VARCHAR(100) NOT NULL, --码值系统名称
ORIG_SYS_REMARK                                   VARCHAR(512) NULL, --码值系统描述
CONSTRAINT ORIG_SYSO_INFO_PK PRIMARY KEY(ORIG_SYS_CODE)   );

--数据存储层配置表
DROP TABLE IF EXISTS DATA_STORE_LAYER ;
CREATE TABLE DATA_STORE_LAYER(
DSL_ID                                            BIGINT default 0 NOT NULL, --存储层配置ID
DSL_NAME                                          VARCHAR(512) NOT NULL, --配置属性名称
STORE_TYPE                                        CHAR(1) NOT NULL, --存储类型
IS_HADOOPCLIENT                                   CHAR(1) NOT NULL, --是否支持外部表
DSL_REMARK                                        VARCHAR(512) NULL, --备注
DTCS_ID                                           BIGINT default 0 NULL, --类型对照ID
DLCS_ID                                           BIGINT default 0 NULL, --长度对照表ID
CONSTRAINT DATA_STORE_LAYER_PK PRIMARY KEY(DSL_ID)   );

--数据存储附加信息表
DROP TABLE IF EXISTS DATA_STORE_LAYER_ADDED ;
CREATE TABLE DATA_STORE_LAYER_ADDED(
DSLAD_ID                                          BIGINT default 0 NOT NULL, --附加信息ID
DSLA_STORELAYER                                   CHAR(2) NOT NULL, --配置附加属性信息
DSLAD_REMARK                                      VARCHAR(512) NULL, --备注
DSL_ID                                            BIGINT default 0 NOT NULL, --存储层配置ID
CONSTRAINT DATA_STORE_LAYER_ADDED_PK PRIMARY KEY(DSLAD_ID)   );

--存储层数据类型对照表
DROP TABLE IF EXISTS TYPE_CONTRAST ;
CREATE TABLE TYPE_CONTRAST(
DTC_ID                                            BIGINT default 0 NOT NULL, --类型对照主键
SOURCE_TYPE                                       VARCHAR(512) NOT NULL, --源表数据类型
TARGET_TYPE                                       VARCHAR(512) NOT NULL, --目标表数据类型
DTC_REMARK                                        VARCHAR(512) NULL, --备注
DTCS_ID                                           BIGINT default 0 NOT NULL, --类型对照ID
CONSTRAINT TYPE_CONTRAST_PK PRIMARY KEY(DTC_ID)   );

--存储层数据类型长度对照表
DROP TABLE IF EXISTS LENGTH_CONTRAST ;
CREATE TABLE LENGTH_CONTRAST(
DLC_ID                                            BIGINT default 0 NOT NULL, --存储层类型长度ID
DLC_TYPE                                          VARCHAR(512) NOT NULL, --字段类型
DLC_LENGTH                                        INTEGER default 0 NOT NULL, --字段长度
DLC_REMARK                                        VARCHAR(512) NULL, --备注
DLCS_ID                                           BIGINT default 0 NOT NULL, --长度对照表ID
CONSTRAINT LENGTH_CONTRAST_PK PRIMARY KEY(DLC_ID)   );

--数据类型对照主表
DROP TABLE IF EXISTS TYPE_CONTRAST_SUM ;
CREATE TABLE TYPE_CONTRAST_SUM(
DTCS_ID                                           BIGINT default 0 NOT NULL, --类型对照ID
DTCS_NAME                                         VARCHAR(512) NOT NULL, --类型对照名称
DTCS_REMARK                                       VARCHAR(512) NULL, --备注
CONSTRAINT TYPE_CONTRAST_SUM_PK PRIMARY KEY(DTCS_ID)   );

--存储层数据类型长度对照主表
DROP TABLE IF EXISTS LENGTH_CONTRAST_SUM ;
CREATE TABLE LENGTH_CONTRAST_SUM(
DLCS_ID                                           BIGINT default 0 NOT NULL, --长度对照表ID
DLCS_NAME                                         VARCHAR(512) NOT NULL, --长度对照名称
DLCS_REMARK                                       VARCHAR(512) NULL, --备注
CONSTRAINT LENGTH_CONTRAST_SUM_PK PRIMARY KEY(DLCS_ID)   );

--数据对标元管理标准元表
DROP TABLE IF EXISTS DBM_NORMBASIC ;
CREATE TABLE DBM_NORMBASIC(
BASIC_ID                                          BIGINT default 0 NOT NULL, --标准元主键
NORM_CODE                                         VARCHAR(100) NULL, --标准编号
SORT_ID                                           BIGINT default 0 NOT NULL, --分类主键
NORM_CNAME                                        VARCHAR(512) NOT NULL, --标准中文名称
NORM_ENAME                                        VARCHAR(512) NOT NULL, --标准英文名称
NORM_ANAME                                        VARCHAR(512) NULL, --标准别名
BUSINESS_DEF                                      VARCHAR(2048) NULL, --业务定义
BUSINESS_RULE                                     VARCHAR(2048) NULL, --业务规则
DBM_DOMAIN                                        VARCHAR(200) NULL, --值域
NORM_BASIS                                        VARCHAR(2048) NULL, --标准依据
DATA_TYPE                                         CHAR(3) NULL, --数据类别
CODE_TYPE_ID                                      BIGINT default 0 NULL, --代码类主键
COL_LEN                                           BIGINT default 0 NOT NULL, --字段长度
DECIMAL_POINT                                     BIGINT default 0 NULL, --小数长度
MANAGE_DEPARTMENT                                 VARCHAR(512) NULL, --标准管理部门
RELEVANT_DEPARTMENT                               VARCHAR(512) NULL, --标准相关部门
ORIGIN_SYSTEM                                     VARCHAR(512) NULL, --可信系统（数据源）
RELATED_SYSTEM                                    VARCHAR(512) NULL, --相关标准
FORMULATOR                                        VARCHAR(100) NOT NULL, --制定人
NORM_STATUS                                       CHAR(1) NOT NULL, --标准元状态（是否已发布）
CREATE_USER                                       VARCHAR(100) NOT NULL, --创建人
CREATE_DATE                                       CHAR(8) NOT NULL, --创建日期
CREATE_TIME                                       CHAR(6) NOT NULL, --创建时间
CONSTRAINT DBM_NORMBASIC_PK PRIMARY KEY(BASIC_ID)   );

--数据对标元管理标准分类信息表
DROP TABLE IF EXISTS DBM_SORT_INFO ;
CREATE TABLE DBM_SORT_INFO(
SORT_ID                                           BIGINT default 0 NOT NULL, --分类主键
PARENT_ID                                         BIGINT default 0 NOT NULL, --父级分类主键
SORT_LEVEL_NUM                                    BIGINT default 0 NOT NULL, --分类层级数
SORT_NAME                                         VARCHAR(512) NOT NULL, --分类名称
SORT_REMARK                                       VARCHAR(512) NULL, --分类描述
SORT_STATUS                                       CHAR(1) NOT NULL, --分类状态（是否发布）
CREATE_USER                                       VARCHAR(100) NOT NULL, --创建人
CREATE_DATE                                       CHAR(8) NOT NULL, --创建日期
CREATE_TIME                                       CHAR(6) NOT NULL, --创建时间
CONSTRAINT DBM_SORT_INFO_PK PRIMARY KEY(SORT_ID)   );

--数据对标元管理代码类信息表
DROP TABLE IF EXISTS DBM_CODE_TYPE_INFO ;
CREATE TABLE DBM_CODE_TYPE_INFO(
CODE_TYPE_ID                                      BIGINT default 0 NOT NULL, --代码类主键
CODE_TYPE_NAME                                    VARCHAR(512) NOT NULL, --代码类名
CODE_ENCODE                                       VARCHAR(100) NULL, --代码编码
CODE_REMARK                                       VARCHAR(512) NULL, --代码描述
CODE_STATUS                                       CHAR(1) NOT NULL, --代码状态（是否发布）
CREATE_USER                                       VARCHAR(100) NOT NULL, --创建人
CREATE_DATE                                       CHAR(8) NOT NULL, --日期创建
CREATE_TIME                                       CHAR(6) NOT NULL, --创建时间
CONSTRAINT DBM_CODE_TYPE_INFO_PK PRIMARY KEY(CODE_TYPE_ID)   );

--数据对标元管理代码项信息表
DROP TABLE IF EXISTS DBM_CODE_ITEM_INFO ;
CREATE TABLE DBM_CODE_ITEM_INFO(
CODE_ITEM_ID                                      BIGINT default 0 NOT NULL, --代码项主键
CODE_ENCODE                                       VARCHAR(100) NULL, --代码编码
CODE_ITEM_NAME                                    VARCHAR(512) NOT NULL, --代码项名
CODE_VALUE                                        VARCHAR(80) NULL, --代码值
DBM_LEVEL                                         VARCHAR(100) NULL, --层级
CODE_REMARK                                       VARCHAR(512) NULL, --代码描述
CODE_TYPE_ID                                      BIGINT default 0 NOT NULL, --代码类主键
CONSTRAINT DBM_CODE_ITEM_INFO_PK PRIMARY KEY(CODE_ITEM_ID)   );

--数据对标标准对标检测表信息表
DROP TABLE IF EXISTS DBM_DTABLE_INFO ;
CREATE TABLE DBM_DTABLE_INFO(
DBM_TABLEID                                       BIGINT default 0 NOT NULL, --检测表主键
TABLE_CNAME                                       VARCHAR(100) NOT NULL, --表中文名称
TABLE_ENAME                                       VARCHAR(512) NOT NULL, --表英文名称
SOURCE_TYPE                                       CHAR(3) NOT NULL, --数据来源类型
IS_EXTERNAL                                       CHAR(1) NOT NULL, --是否为外部数据源
TABLE_REMARK                                      VARCHAR(512) NULL, --表描述信息
DETECT_ID                                         BIGINT default 0 NOT NULL, --检测主键
TABLE_ID                                          BIGINT default 0 NULL, --表名ID
DSL_ID                                            BIGINT default 0 NOT NULL, --存储层配置ID
CONSTRAINT DBM_DTABLE_INFO_PK PRIMARY KEY(DBM_TABLEID)   );

--数据对标标准对标检测字段信息表
DROP TABLE IF EXISTS DBM_DTCOL_INFO ;
CREATE TABLE DBM_DTCOL_INFO(
COL_ID                                            BIGINT default 0 NOT NULL, --字段主键
COL_CNAME                                         VARCHAR(100) NOT NULL, --字段中文名
COL_ENAME                                         VARCHAR(512) NOT NULL, --字段英文名
COL_REMARK                                        VARCHAR(512) NULL, --字段描述
DATA_TYPE                                         VARCHAR(100) NOT NULL, --数据类型
DATA_LEN                                          BIGINT default 0 NOT NULL, --数据长度
DECIMAL_POINT                                     BIGINT default 0 NOT NULL, --小数长度
IS_KEY                                            CHAR(1) NOT NULL, --是否作为主键
IS_NULL                                           CHAR(1) NOT NULL, --是否可为空
DEFAULT_VALUE                                     VARCHAR(80) NULL, --默认值
DBM_TABLEID                                       BIGINT default 0 NOT NULL, --检测表主键
DETECT_ID                                         BIGINT default 0 NOT NULL, --检测主键
COLUMN_ID                                         BIGINT default 0 NULL, --字段ID
CONSTRAINT DBM_DTCOL_INFO_PK PRIMARY KEY(COL_ID)   );

--数据对标标准对标检测结果表
DROP TABLE IF EXISTS DBM_NORMBMD_RESULT ;
CREATE TABLE DBM_NORMBMD_RESULT(
RESULT_ID                                         VARCHAR(32) NOT NULL, --结果主键
COL_SIMILARITY                                    DECIMAL(16,2) default 0 NOT NULL, --字段相似度
REMARK_SIMILARITY                                 DECIMAL(16,2) default 0 NOT NULL, --描述相似度
DETECT_ID                                         BIGINT default 0 NOT NULL, --检测主键
COL_ID                                            BIGINT default 0 NOT NULL, --字段主键
BASIC_ID                                          BIGINT default 0 NOT NULL, --标准元主键
IS_ARTIFICIAL                                     CHAR(1) NOT NULL, --是否人工
IS_TAG                                            CHAR(1) NOT NULL, --是否标记为最终结果
CONSTRAINT DBM_NORMBMD_RESULT_PK PRIMARY KEY(RESULT_ID)   );

--数据对标标准对标检测记录表
DROP TABLE IF EXISTS DBM_NORMBM_DETECT ;
CREATE TABLE DBM_NORMBM_DETECT(
DETECT_ID                                         BIGINT default 0 NOT NULL, --检测主键
DETECT_NAME                                       VARCHAR(512) NOT NULL, --检测记名
DETECT_STATUS                                     CHAR(1) NOT NULL, --对标检查状态
DBM_MODE                                          CHAR(1) NULL, --对标方式
CREATE_USER                                       VARCHAR(100) NOT NULL, --创建人
DETECT_SDATE                                      CHAR(8) NOT NULL, --检测开始日期
DETECT_STIME                                      CHAR(6) NOT NULL, --检测开始时间
DETECT_EDATE                                      CHAR(8) NOT NULL, --检测结束日期
DETECT_ETIME                                      CHAR(6) NOT NULL, --检测结束时间
DND_REMARK                                        VARCHAR(512) NULL, --备注
CONSTRAINT DBM_NORMBM_DETECT_PK PRIMARY KEY(DETECT_ID)   );

--数据对标结果分类表
DROP TABLE IF EXISTS DBM_DATA_SORT ;
CREATE TABLE DBM_DATA_SORT(
DDS_ID                                            BIGINT default 0 NOT NULL, --对标分类结构ID
DDS_NAME                                          VARCHAR(512) NOT NULL, --分类名称
DDS_NUMBER                                        VARCHAR(100) NOT NULL, --分类编号
DDS_REMARK                                        VARCHAR(512) NULL, --分类备注
BASIC_ID                                          BIGINT default 0 NOT NULL, --标准元主键
DETECT_ID                                         BIGINT default 0 NULL, --检测主键
CONSTRAINT DBM_DATA_SORT_PK PRIMARY KEY(DDS_ID)   );

--分类对应的表字段
DROP TABLE IF EXISTS DBM_SORT_COLUMN ;
CREATE TABLE DBM_SORT_COLUMN(
DSC_ID                                            BIGINT default 0 NOT NULL, --分类对应主键ID
DDS_ID                                            BIGINT default 0 NOT NULL, --对标分类结构ID
COL_ID                                            BIGINT default 0 NOT NULL, --字段主键
DBM_TABLEID                                       BIGINT default 0 NOT NULL, --检测表主键
DSC_REMARK                                        VARCHAR(80) NULL, --备注
CONSTRAINT DBM_SORT_COLUMN_PK PRIMARY KEY(DSC_ID)   );

--对象采集数据处理类型对应表
DROP TABLE IF EXISTS OBJECT_HANDLE_TYPE ;
CREATE TABLE OBJECT_HANDLE_TYPE(
OBJECT_HANDLE_ID                                  BIGINT default 0 NOT NULL, --处理编号
OCS_ID                                            BIGINT default 0 NOT NULL, --对象采集任务编号
HANDLE_TYPE                                       CHAR(1) NOT NULL, --处理类型
HANDLE_VALUE                                      VARCHAR(100) NOT NULL, --处理值
CONSTRAINT OBJECT_HANDLE_TYPE_PK PRIMARY KEY(OBJECT_HANDLE_ID,OCS_ID)   );

--对象采集结构信息
DROP TABLE IF EXISTS OBJECT_COLLECT_STRUCT ;
CREATE TABLE OBJECT_COLLECT_STRUCT(
STRUCT_ID                                         BIGINT default 0 NOT NULL, --结构信息id
OCS_ID                                            BIGINT default 0 NOT NULL, --对象采集任务编号
COLUMN_NAME                                       VARCHAR(512) NOT NULL, --字段英文名称
DATA_DESC                                         VARCHAR(200) NULL, --字段中文描述信息
IS_OPERATE                                        CHAR(1) NOT NULL, --是否操作标识字段
COLUMNPOSITION                                    VARCHAR(100) NOT NULL, --字段位置
COLUMN_TYPE                                       VARCHAR(100) NOT NULL, --字段类型
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT OBJECT_COLLECT_STRUCT_PK PRIMARY KEY(STRUCT_ID)   );

--接口信息表
DROP TABLE IF EXISTS INTERFACE_INFO ;
CREATE TABLE INTERFACE_INFO(
INTERFACE_ID                                      BIGINT default 0 NOT NULL, --接口ID
URL                                               VARCHAR(512) NOT NULL, --请求地址
INTERFACE_NAME                                    VARCHAR(512) NOT NULL, --接口名称
INTERFACE_TYPE                                    CHAR(1) NOT NULL, --接口类型
INTERFACE_STATE                                   CHAR(1) NOT NULL, --接口状态
INTERFACE_CODE                                    VARCHAR(100) NOT NULL, --接口代码
INTERFACE_NOTE                                    VARCHAR(512) NULL, --备注
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
CONSTRAINT INTERFACE_INFO_PK PRIMARY KEY(INTERFACE_ID)   );

--接口使用信息表
DROP TABLE IF EXISTS INTERFACE_USE ;
CREATE TABLE INTERFACE_USE(
INTERFACE_USE_ID                                  BIGINT default 0 NOT NULL, --接口使用ID
URL                                               VARCHAR(512) NOT NULL, --请求地址
INTERFACE_NAME                                    VARCHAR(512) NOT NULL, --接口名称
INTERFACE_CODE                                    VARCHAR(100) NOT NULL, --接口代码
THEIR_TYPE                                        CHAR(1) NOT NULL, --接口所属类型
USER_NAME                                         VARCHAR(512) NOT NULL, --用户名称
CLASSIFY_NAME                                     VARCHAR(512) NULL, --分类名称
CREATE_ID                                         BIGINT default 0 NOT NULL, --用户ID
USE_STATE                                         CHAR(1) NOT NULL, --使用状态
START_USE_DATE                                    CHAR(8) NOT NULL, --开始使用日期
USE_VALID_DATE                                    CHAR(8) NOT NULL, --使用有效日期
INTERFACE_NOTE                                    VARCHAR(512) NULL, --备注
INTERFACE_ID                                      BIGINT default 0 NOT NULL, --接口ID
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
CONSTRAINT INTERFACE_USE_PK PRIMARY KEY(INTERFACE_USE_ID)   );

--表使用信息表
DROP TABLE IF EXISTS TABLE_USE_INFO ;
CREATE TABLE TABLE_USE_INFO(
USE_ID                                            BIGINT default 0 NOT NULL, --表使用ID
SYSREG_NAME                                       VARCHAR(512) NOT NULL, --系统登记表名
ORIGINAL_NAME                                     VARCHAR(512) NOT NULL, --原始文件名称
TABLE_BLSYSTEM                                    CHAR(3) NOT NULL, --数据表所属系统
TABLE_NOTE                                        VARCHAR(512) NULL, --表说明
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
CONSTRAINT TABLE_USE_INFO_PK PRIMARY KEY(USE_ID)   );

--系统登记表参数信息
DROP TABLE IF EXISTS SYSREG_PARAMETER_INFO ;
CREATE TABLE SYSREG_PARAMETER_INFO(
PARAMETER_ID                                      BIGINT default 0 NOT NULL, --参数ID
TABLE_EN_COLUMN                                   VARCHAR(512) NOT NULL, --表列英文名称
TABLE_CH_COLUMN                                   VARCHAR(256) NOT NULL, --表列中文名称
IS_FLAG                                           CHAR(1) NOT NULL, --是否可用
REMARK                                            VARCHAR(512) NULL, --备注
USE_ID                                            BIGINT default 0 NOT NULL, --表使用ID
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
CONSTRAINT SYSREG_PARAMETER_INFO_PK PRIMARY KEY(PARAMETER_ID)   );

--接口文件生成信息表
DROP TABLE IF EXISTS INTERFACE_FILE_INFO ;
CREATE TABLE INTERFACE_FILE_INFO(
FILE_ID                                           VARCHAR(40) NOT NULL, --文件ID
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
FILE_PATH                                         VARCHAR(512) NOT NULL, --文件路径
DATA_CLASS                                        VARCHAR(10) NOT NULL, --输出数据类型
DATA_OUTPUT                                       VARCHAR(20) NOT NULL, --数据数据形式
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT INTERFACE_FILE_INFO_PK PRIMARY KEY(FILE_ID)   );

--接口使用信息日志表
DROP TABLE IF EXISTS INTERFACE_USE_LOG ;
CREATE TABLE INTERFACE_USE_LOG(
LOG_ID                                            BIGINT default 0 NOT NULL, --日志ID
INTERFACE_NAME                                    VARCHAR(512) NOT NULL, --接口名称
REQUEST_STATE                                     VARCHAR(200) NOT NULL, --请求状态
RESPONSE_TIME                                     DECIMAL(10) NOT NULL, --响应时间
BROWSER_TYPE                                      VARCHAR(512) NULL, --浏览器类型
BROWSER_VERSION                                   VARCHAR(512) NULL, --浏览器版本
SYSTEM_TYPE                                       VARCHAR(512) NULL, --系统类型
REQUEST_MODE                                      VARCHAR(512) NULL, --请求方式
REMOTEADDR                                        VARCHAR(512) NULL, --客户端的IP
PROTOCOL                                          VARCHAR(512) NULL, --超文本传输协议版本
REQUEST_INFO                                      VARCHAR(6000) NULL, --请求信息
REQUEST_STIME                                     VARCHAR(512) NULL, --请求起始时间
REQUEST_ETIME                                     VARCHAR(512) NULL, --请求结束时间
REQUEST_TYPE                                      VARCHAR(512) NULL, --请求类型
INTERFACE_USE_ID                                  BIGINT default 0 NOT NULL, --接口使用ID
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
USER_NAME                                         VARCHAR(512) NULL, --用户名称
CONSTRAINT INTERFACE_USE_LOG_PK PRIMARY KEY(LOG_ID)   );

--变量配置表
DROP TABLE IF EXISTS DQ_SYS_CFG ;
CREATE TABLE DQ_SYS_CFG(
SYS_VAR_ID                                        BIGINT default 0 NOT NULL, --系统变量编号
VAR_NAME                                          VARCHAR(64) NOT NULL, --变量名
VAR_VALUE                                         VARCHAR(80) NULL, --变量值
APP_UPDT_DT                                       CHAR(8) NOT NULL, --更新日期
APP_UPDT_TI                                       CHAR(6) NOT NULL, --更新时间
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
CONSTRAINT DQ_SYS_CFG_PK PRIMARY KEY(SYS_VAR_ID,VAR_NAME)   );

--数据质量规则配置清单表
DROP TABLE IF EXISTS DQ_DEFINITION ;
CREATE TABLE DQ_DEFINITION(
REG_NUM                                           BIGINT default 0 NOT NULL, --规则编号
REG_NAME                                          VARCHAR(100) NULL, --规则名称
LOAD_STRATEGY                                     VARCHAR(100) NULL, --加载策略
GROUP_SEQ                                         VARCHAR(100) NULL, --分组序号
TARGET_TAB                                        VARCHAR(100) NULL, --目标表名
TARGET_KEY_FIELDS                                 VARCHAR(2048) NULL, --目标表关键字段
OPPOSITE_TAB                                      VARCHAR(100) NULL, --比对表名
OPPOSITE_KEY_FIELDS                               VARCHAR(2048) NULL, --比对表关键字段
RANGE_MIN_VAL                                     VARCHAR(64) NULL, --范围区间的最小值
RANGE_MAX_VAL                                     VARCHAR(64) NULL, --范围区间的最大值
LIST_VALS                                         VARCHAR(1024) NULL, --清单值域
CHECK_LIMIT_CONDITION                             VARCHAR(1024) NULL, --检查范围限定条件
SPECIFY_SQL                                       VARCHAR(4000) NULL, --指定SQL
ERR_DATA_SQL                                      VARCHAR(4000) NULL, --异常数据SQL
INDEX_DESC1                                       VARCHAR(500) NULL, --检测指标1含义
INDEX_DESC2                                       VARCHAR(500) NULL, --检测指标2含义
INDEX_DESC3                                       VARCHAR(500) NULL, --检测指标3含义
FLAGS                                             VARCHAR(32) NULL, --标志域
REMARK                                            VARCHAR(4000) NULL, --描述
APP_UPDT_DT                                       CHAR(8) NOT NULL, --更新日期
APP_UPDT_TI                                       CHAR(6) NOT NULL, --更新时间
RULE_TAG                                          VARCHAR(20) NULL, --规则标签
MAIL_RECEIVE                                      VARCHAR(1200) NULL, --接收邮箱
RULE_SRC                                          VARCHAR(50) NULL, --规则来源
IS_SAVEINDEX1                                     CHAR(1) NOT NULL, --是否保存指标1数据
IS_SAVEINDEX2                                     CHAR(1) NOT NULL, --是否保存指标2数据
IS_SAVEINDEX3                                     CHAR(1) NOT NULL, --是否保存指标3数据
CASE_TYPE                                         VARCHAR(80) NOT NULL, --规则类型
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
CONSTRAINT DQ_DEFINITION_PK PRIMARY KEY(REG_NUM)   );

--数据质量规则类型定义表
DROP TABLE IF EXISTS DQ_RULE_DEF ;
CREATE TABLE DQ_RULE_DEF(
CASE_TYPE                                         VARCHAR(80) NOT NULL, --规则类型
CASE_TYPE_DESC                                    VARCHAR(512) NULL, --规则类型描述
INDEX_DESC1                                       VARCHAR(512) NULL, --检测指标1含义
INDEX_DESC2                                       VARCHAR(512) NULL, --检测指标2含义
INDEX_DESC3                                       VARCHAR(512) NULL, --检测指标3含义
REMARK                                            VARCHAR(512) NULL, --说明
CONSTRAINT DQ_RULE_DEF_PK PRIMARY KEY(CASE_TYPE)   );

--数据质量校验结果表
DROP TABLE IF EXISTS DQ_RESULT ;
CREATE TABLE DQ_RESULT(
TASK_ID                                           BIGINT default 0 NOT NULL, --任务编号
VERIFY_DATE                                       CHAR(8) NULL, --校验会计日期
TARGET_TAB                                        VARCHAR(100) NULL, --目标表名
TARGET_KEY_FIELDS                                 VARCHAR(1024) NULL, --目标表关键字段
START_DATE                                        CHAR(8) NULL, --执行开始日期
START_TIME                                        CHAR(6) NULL, --执行开始时间
END_DATE                                          CHAR(8) NULL, --执行结束日期
END_TIME                                          CHAR(6) NULL, --执行结束时间
ELAPSED_MS                                        INTEGER default 0 NULL, --执行耗时
VERIFY_RESULT                                     CHAR(1) NULL, --校验结果
CHECK_INDEX1                                      INTEGER default 0 NULL, --检查指标1结果
CHECK_INDEX2                                      INTEGER default 0 NULL, --检查指标2结果
CHECK_INDEX3                                      INTEGER default 0 NULL, --检查指标3结果
INDEX_DESC1                                       VARCHAR(500) NULL, --检查指标1含义
INDEX_DESC2                                       VARCHAR(500) NULL, --检查指标2含义
INDEX_DESC3                                       VARCHAR(500) NULL, --检查指标3含义
ERRNO                                             VARCHAR(1024) NULL, --校验错误码
VERIFY_SQL                                        VARCHAR(4000) NULL, --校验SQL
ERR_DTL_SQL                                       VARCHAR(4000) NULL, --异常明细SQL
REMARK                                            VARCHAR(512) NULL, --备注
DL_STAT                                           VARCHAR(5) NULL, --处理状态
EXEC_MODE                                         VARCHAR(10) NULL, --执行方式
ERR_DTL_FILE_NAME                                 VARCHAR(100) NULL, --异常数据文件名
IS_SAVEINDEX1                                     CHAR(1) NOT NULL, --是否保存指标1数据
IS_SAVEINDEX2                                     CHAR(1) NOT NULL, --是否保存指标2数据
IS_SAVEINDEX3                                     CHAR(1) NOT NULL, --是否保存指标3数据
CASE_TYPE                                         VARCHAR(80) NOT NULL, --规则类型
REG_NUM                                           BIGINT default 0 NOT NULL, --规则编号
CONSTRAINT DQ_RESULT_PK PRIMARY KEY(TASK_ID)   );

--数据质量指标3数据记录表
DROP TABLE IF EXISTS DQ_INDEX3RECORD ;
CREATE TABLE DQ_INDEX3RECORD(
RECORD_ID                                         BIGINT default 0 NOT NULL, --记录编号
TABLE_NAME                                        VARCHAR(64) NOT NULL, --数据表名
TABLE_COL                                         VARCHAR(10000) NULL, --数据表字段
TABLE_SIZE                                        DECIMAL(16,2) default 0 NULL, --数据表大小
DQC_TS                                            VARCHAR(8) NULL, --表空间名
FILE_TYPE                                         CHAR(1) NULL, --数据物理文件类型
FILE_PATH                                         VARCHAR(512) NULL, --数据物理文件路径
RECORD_DATE                                       CHAR(8) NOT NULL, --记录日期
RECORD_TIME                                       CHAR(6) NOT NULL, --记录时间
TASK_ID                                           BIGINT default 0 NOT NULL, --任务编号
DSL_ID                                            BIGINT default 0 NOT NULL, --存储层配置ID
CONSTRAINT DQ_INDEX3RECORD_PK PRIMARY KEY(RECORD_ID)   );

--系统帮助提示信息表
DROP TABLE IF EXISTS DQ_HELP_INFO ;
CREATE TABLE DQ_HELP_INFO(
HELP_INFO_ID                                      VARCHAR(80) NOT NULL, --帮助提示编号
HELP_INFO_DESC                                    VARCHAR(512) NULL, --帮助提示描述
HELP_INFO_DTL                                     VARCHAR(2048) NULL, --帮助提示详细信息
CONSTRAINT DQ_HELP_INFO_PK PRIMARY KEY(HELP_INFO_ID)   );

--校验结果处理日志
DROP TABLE IF EXISTS DQ_REQ_LOG ;
CREATE TABLE DQ_REQ_LOG(
TASK_ID                                           BIGINT default 0 NOT NULL, --任务编号
DL_TIME                                           VARCHAR(32) NOT NULL, --处理时间
PRCS_STT                                          VARCHAR(100) NULL, --流程状态
DL_ACTN                                           VARCHAR(100) NULL, --动作
DL_DSCR                                           VARCHAR(100) NULL, --处理描述
DL_ATTC                                           VARCHAR(3072) NULL, --附件
FL_NM                                             VARCHAR(100) NULL, --文件名
IS_TOP                                            CHAR(1) NOT NULL, --是否置顶
REG_NUM                                           BIGINT default 0 NOT NULL, --规则编号
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
CONSTRAINT DQ_REQ_LOG_PK PRIMARY KEY(TASK_ID,DL_TIME)   );

--外部检查申请执行日志
DROP TABLE IF EXISTS DQ_EXE_LOG ;
CREATE TABLE DQ_EXE_LOG(
REQ_ID                                            BIGINT default 0 NOT NULL, --申请编号
TASK_ID                                           BIGINT default 0 NOT NULL, --任务编号
DL_TIME                                           VARCHAR(32) NOT NULL, --处理时间
CONSTRAINT DQ_EXE_LOG_PK PRIMARY KEY(REQ_ID)   );

--外部检查申请日志
DROP TABLE IF EXISTS DQ_EXT_LOG ;
CREATE TABLE DQ_EXT_LOG(
REQ_ID                                            BIGINT default 0 NOT NULL, --申请编号
ASS_REQ_ID                                        VARCHAR(50) NULL, --关联申请号
REQ_TYP                                           CHAR(1) NULL, --申请类型
CHK_DT                                            CHAR(8) NOT NULL, --检查日期
CHK_TIME                                          CHAR(6) NOT NULL, --检查时间
REQ_RE                                            VARCHAR(1) NULL, --受理返回状态
FIN_STS                                           VARCHAR(1) NULL, --完成状态
REQ_TM                                            VARCHAR(8) NULL, --受理时间
FIN_TM                                            VARCHAR(8) NULL, --结束时间
EXT_JOB_ID                                        BIGINT default 0 NOT NULL, --外部作业编号
TASK_ID                                           BIGINT default 0 NOT NULL, --任务编号
CONSTRAINT DQ_EXT_LOG_PK PRIMARY KEY(REQ_ID)   );

--外部检查作业与规则关系
DROP TABLE IF EXISTS DQ_EXT_RELA ;
CREATE TABLE DQ_EXT_RELA(
EXT_JOB_ID                                        BIGINT default 0 NOT NULL, --外部作业编号
TASK_ID                                           BIGINT default 0 NOT NULL, --任务编号
DL_TIME                                           VARCHAR(32) NOT NULL, --处理时间
CONSTRAINT DQ_EXT_RELA_PK PRIMARY KEY(EXT_JOB_ID,TASK_ID)   );

--集市分类信息
DROP TABLE IF EXISTS DM_CATEGORY ;
CREATE TABLE DM_CATEGORY(
CATEGORY_ID                                       BIGINT default 0 NOT NULL, --集市分类id
CATEGORY_NAME                                     VARCHAR(512) NOT NULL, --分类名称
CATEGORY_DESC                                     VARCHAR(200) NULL, --分类描述
CREATE_DATE                                       CHAR(8) NOT NULL, --创建日期
CREATE_TIME                                       CHAR(6) NOT NULL, --创建时间
CATEGORY_SEQ                                      VARCHAR(512) NULL, --分类序号
CATEGORY_NUM                                      VARCHAR(512) NOT NULL, --分类编号
CREATE_ID                                         DECIMAL(10) NOT NULL, --创建用户
PARENT_CATEGORY_ID                                BIGINT default 0 NOT NULL, --集市分类id
DATA_MART_ID                                      BIGINT default 0 NOT NULL, --数据集市id
CONSTRAINT DM_CATEGORY_PK PRIMARY KEY(CATEGORY_ID)   );

--数据集市信息表
DROP TABLE IF EXISTS DM_INFO ;
CREATE TABLE DM_INFO(
DATA_MART_ID                                      BIGINT default 0 NOT NULL, --数据集市id
MART_NAME                                         VARCHAR(512) NOT NULL, --数据集市名称
MART_NUMBER                                       VARCHAR(512) NOT NULL, --数据库编号
MART_DESC                                         VARCHAR(512) NULL, --数据集市描述
MART_STORAGE_PATH                                 VARCHAR(512) NOT NULL, --数据集市存储路径
CREATE_DATE                                       CHAR(8) NOT NULL, --创建日期
CREATE_TIME                                       CHAR(6) NOT NULL, --创建时间
CREATE_ID                                         BIGINT default 0 NOT NULL, --用户ID
DM_REMARK                                         VARCHAR(512) NULL, --备注
CONSTRAINT DM_INFO_PK PRIMARY KEY(DATA_MART_ID)   );

--数据表信息
DROP TABLE IF EXISTS DM_DATATABLE ;
CREATE TABLE DM_DATATABLE(
DATATABLE_ID                                      BIGINT default 0 NOT NULL, --数据表id
DATA_MART_ID                                      BIGINT default 0 NULL, --数据集市id
DATATABLE_CN_NAME                                 VARCHAR(512) NOT NULL, --数据表中文名称
DATATABLE_EN_NAME                                 VARCHAR(512) NOT NULL, --数据表英文名称
DATATABLE_DESC                                    VARCHAR(512) NULL, --数据表描述
DATATABLE_CREATE_DATE                             CHAR(8) NOT NULL, --数据表创建日期
DATATABLE_CREATE_TIME                             CHAR(6) NOT NULL, --数据表创建时间
DATATABLE_DUE_DATE                                CHAR(8) NOT NULL, --数据表到期日期
DDLC_DATE                                         CHAR(8) NOT NULL, --DDL最后变更日期
DDLC_TIME                                         CHAR(6) NOT NULL, --DDL最后变更时间
DATAC_DATE                                        CHAR(8) NOT NULL, --数据最后变更日期
DATAC_TIME                                        CHAR(6) NOT NULL, --数据最后变更时间
DATATABLE_LIFECYCLE                               CHAR(1) NOT NULL, --数据表的生命周期
SORUCE_SIZE                                       DECIMAL(16,2) default 0 NOT NULL, --资源大小
ETL_DATE                                          CHAR(8) NOT NULL, --跑批日期
SQL_ENGINE                                        CHAR(1) NULL, --sql执行引擎
STORAGE_TYPE                                      CHAR(1) NOT NULL, --进数方式
TABLE_STORAGE                                     CHAR(1) NOT NULL, --数据表存储方式
REMARK                                            VARCHAR(6000) NULL, --备注
REPEAT_FLAG                                       CHAR(1) NOT NULL, --集市表是否可以重复使用
CATEGORY_ID                                       BIGINT default 0 NOT NULL, --集市分类id
CONSTRAINT DM_DATATABLE_PK PRIMARY KEY(DATATABLE_ID)   );

--数据表已选数据源信息
DROP TABLE IF EXISTS DM_DATATABLE_SOURCE ;
CREATE TABLE DM_DATATABLE_SOURCE(
OWN_DOURCE_TABLE_ID                               BIGINT default 0 NOT NULL, --已选数据源表id
DATATABLE_ID                                      BIGINT default 0 NOT NULL, --数据表id
OWN_SOURCE_TABLE_NAME                             VARCHAR(512) NOT NULL, --已选数据源表名
SOURCE_TYPE                                       CHAR(3) NOT NULL, --数据来源类型
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT DM_DATATABLE_SOURCE_PK PRIMARY KEY(OWN_DOURCE_TABLE_ID)   );

--结果映射信息表
DROP TABLE IF EXISTS DM_ETLMAP_INFO ;
CREATE TABLE DM_ETLMAP_INFO(
ETL_ID                                            BIGINT default 0 NOT NULL, --表id
DATATABLE_ID                                      BIGINT default 0 NOT NULL, --数据表id
OWN_DOURCE_TABLE_ID                               BIGINT default 0 NOT NULL, --已选数据源表id
TARGETFIELD_NAME                                  VARCHAR(512) NULL, --目标字段名称
SOURCEFIELDS_NAME                                 VARCHAR(512) NOT NULL, --来源字段名称
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT DM_ETLMAP_INFO_PK PRIMARY KEY(ETL_ID)   );

--数据源表字段
DROP TABLE IF EXISTS OWN_SOURCE_FIELD ;
CREATE TABLE OWN_SOURCE_FIELD(
OWN_FIELD_ID                                      BIGINT default 0 NOT NULL, --字段id
OWN_DOURCE_TABLE_ID                               BIGINT default 0 NOT NULL, --已选数据源表id
FIELD_NAME                                        VARCHAR(512) NOT NULL, --字段名称
FIELD_TYPE                                        VARCHAR(512) NOT NULL, --字段类型
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT OWN_SOURCE_FIELD_PK PRIMARY KEY(OWN_FIELD_ID)   );

--数据操作信息表
DROP TABLE IF EXISTS DM_OPERATION_INFO ;
CREATE TABLE DM_OPERATION_INFO(
ID                                                BIGINT default 0 NOT NULL, --信息表id
DATATABLE_ID                                      BIGINT default 0 NOT NULL, --数据表id
VIEW_SQL                                          VARCHAR(6000) NOT NULL, --预览sql语句
EXECUTE_SQL                                       VARCHAR(6000) NULL, --执行sql语句
SEARCH_NAME                                       VARCHAR(512) NULL, --join类型
REMARK                                            VARCHAR(512) NULL, --备注
START_DATE                                        CHAR(8) NOT NULL, --开始日期
END_DATE                                          CHAR(8) NOT NULL, --结束日期
CONSTRAINT DM_OPERATION_INFO_PK PRIMARY KEY(ID)   );

--数据表字段信息
DROP TABLE IF EXISTS DATATABLE_FIELD_INFO ;
CREATE TABLE DATATABLE_FIELD_INFO(
DATATABLE_FIELD_ID                                BIGINT default 0 NOT NULL, --数据表字段id
DATATABLE_ID                                      BIGINT default 0 NOT NULL, --数据表id
FIELD_CN_NAME                                     VARCHAR(512) NOT NULL, --字段中文名称
FIELD_EN_NAME                                     VARCHAR(512) NOT NULL, --字段英文名称
FIELD_TYPE                                        VARCHAR(30) NOT NULL, --字段类型
FIELD_DESC                                        VARCHAR(200) NULL, --字段描述
FIELD_PROCESS                                     CHAR(1) NOT NULL, --处理方式
PROCESS_MAPPING                                   VARCHAR(512) NULL, --映射规则mapping
GROUP_MAPPING                                     VARCHAR(200) NULL, --分组映射对应规则
FIELD_LENGTH                                      VARCHAR(200) NULL, --字段长度
FIELD_SEQ                                         BIGINT default 0 NOT NULL, --字段序号
REMARK                                            VARCHAR(6000) NULL, --备注
START_DATE                                        CHAR(8) NOT NULL, --开始日期
END_DATE                                          CHAR(8) NOT NULL, --结束日期
CONSTRAINT DATATABLE_FIELD_INFO_PK PRIMARY KEY(DATATABLE_FIELD_ID)   );

--抽数作业关系表
DROP TABLE IF EXISTS TAKE_RELATION_ETL ;
CREATE TABLE TAKE_RELATION_ETL(
DED_ID                                            BIGINT default 0 NOT NULL, --数据抽取定义主键
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
SUB_SYS_CD                                        VARCHAR(100) NOT NULL, --子系统代码
ETL_JOB                                           VARCHAR(512) NOT NULL, --作业名
DATABASE_ID                                       BIGINT default 0 NOT NULL, --数据库设置id
CONSTRAINT TAKE_RELATION_ETL_PK PRIMARY KEY(DED_ID)   );

--无效表信息
DROP TABLE IF EXISTS DQ_FAILURE_TABLE ;
CREATE TABLE DQ_FAILURE_TABLE(
FAILURE_TABLE_ID                                  BIGINT default 0 NOT NULL, --表id
FILE_ID                                           BIGINT default 0 NOT NULL, --数据表ID
TABLE_CN_NAME                                     VARCHAR(512) NULL, --表中文名
TABLE_EN_NAME                                     VARCHAR(512) NOT NULL, --表英文名
TABLE_SOURCE                                      CHAR(3) NOT NULL, --表来源
TABLE_META_INFO                                   VARCHAR(2000) NOT NULL, --表元信息
DSL_ID                                            BIGINT default 0 NOT NULL, --存储层配置ID
DATA_SOURCE                                       CHAR(1) NULL, --存储层-数据来源
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT DQ_FAILURE_TABLE_PK PRIMARY KEY(FAILURE_TABLE_ID)   );

--无效表列信息
DROP TABLE IF EXISTS DQ_FAILURE_COLUMN ;
CREATE TABLE DQ_FAILURE_COLUMN(
FAILURE_COLUMN_ID                                 BIGINT default 0 NOT NULL, --列id
COLUMN_SOURCE                                     CHAR(3) NOT NULL, --字段来源
COLUMN_META_INFO                                  VARCHAR(5000) NOT NULL, --字段元信息
REMARK                                            VARCHAR(512) NULL, --备注
FAILURE_TABLE_ID                                  BIGINT default 0 NOT NULL, --表id
CONSTRAINT DQ_FAILURE_COLUMN_PK PRIMARY KEY(FAILURE_COLUMN_ID)   );

--数据存储登记
DROP TABLE IF EXISTS DATA_STORE_REG ;
CREATE TABLE DATA_STORE_REG(
FILE_ID                                           VARCHAR(40) NOT NULL, --表文件ID
COLLECT_TYPE                                      CHAR(1) NOT NULL, --采集类型
ORIGINAL_UPDATE_DATE                              CHAR(8) NOT NULL, --原文件最后修改日期
ORIGINAL_UPDATE_TIME                              CHAR(6) NOT NULL, --原文件最后修改时间
ORIGINAL_NAME                                     VARCHAR(512) NOT NULL, --原始表中文名称
TABLE_NAME                                        VARCHAR(512) NULL, --采集的原始表名
HYREN_NAME                                        VARCHAR(512) NOT NULL, --系统内对应表名
META_INFO                                         VARCHAR(6000) NULL, --META元信息
STORAGE_DATE                                      CHAR(8) NOT NULL, --入库日期
STORAGE_TIME                                      CHAR(6) NOT NULL, --入库时间
FILE_SIZE                                         BIGINT default 0 NOT NULL, --文件大小
AGENT_ID                                          BIGINT default 0 NOT NULL, --Agent_id
SOURCE_ID                                         BIGINT default 0 NOT NULL, --数据源ID
DATABASE_ID                                       BIGINT default 0 NOT NULL, --数据库设置id
TABLE_ID                                          BIGINT default 0 NOT NULL, --表名ID
CONSTRAINT DATA_STORE_REG_PK PRIMARY KEY(FILE_ID)   );

--系统操作信息
DROP TABLE IF EXISTS LOGIN_OPERATION_INFO ;
CREATE TABLE LOGIN_OPERATION_INFO(
LOG_ID                                            BIGINT default 0 NOT NULL, --日志ID
BROWSER_TYPE                                      VARCHAR(512) NULL, --浏览器类型
BROWSER_VERSION                                   VARCHAR(512) NULL, --浏览器版本
SYSTEM_TYPE                                       VARCHAR(512) NULL, --系统类型
REQUEST_MODE                                      VARCHAR(512) NULL, --请求方式
REMOTEADDR                                        VARCHAR(512) NULL, --客户端的IP
PROTOCOL                                          VARCHAR(512) NULL, --超文本传输协议版本
REQUEST_DATE                                      CHAR(8) NOT NULL, --请求日期
REQUEST_TIME                                      CHAR(6) NOT NULL, --请求时间
REQUEST_TYPE                                      VARCHAR(512) NULL, --请求类型
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
USER_NAME                                         VARCHAR(512) NULL, --用户名称
OPERATION_TYPE                                    VARCHAR(512) NULL, --操作类型
CONSTRAINT LOGIN_OPERATION_INFO_PK PRIMARY KEY(LOG_ID)   );

--集市表前置后置作业
DROP TABLE IF EXISTS DM_RELEVANT_INFO ;
CREATE TABLE DM_RELEVANT_INFO(
REL_ID                                            BIGINT default 0 NOT NULL, --作业相关id
DATATABLE_ID                                      BIGINT default 0 NULL, --数据表id
PRE_WORK                                          VARCHAR(6500) NULL, --前置作业
POST_WORK                                         VARCHAR(6500) NULL, --后置作业
REL_REMARK                                        VARCHAR(512) NULL, --备注
CONSTRAINT DM_RELEVANT_INFO_PK PRIMARY KEY(REL_ID)   );

--数据字段存储关系表
DROP TABLE IF EXISTS DCOL_RELATION_STORE ;
CREATE TABLE DCOL_RELATION_STORE(
DSLAD_ID                                          BIGINT default 0 NOT NULL, --附加信息ID
COL_ID                                            BIGINT default 0 NOT NULL, --结构信息id
DATA_SOURCE                                       CHAR(1) NOT NULL, --存储层-数据来源
CSI_NUMBER                                        BIGINT default 0 NOT NULL, --序号位置
CONSTRAINT DCOL_RELATION_STORE_PK PRIMARY KEY(DSLAD_ID,COL_ID)   );

--数据表存储关系表
DROP TABLE IF EXISTS DTAB_RELATION_STORE ;
CREATE TABLE DTAB_RELATION_STORE(
DSL_ID                                            BIGINT default 0 NOT NULL, --存储层配置ID
TAB_ID                                            BIGINT default 0 NOT NULL, --对象采集任务编号
DATA_SOURCE                                       CHAR(1) NOT NULL, --存储层-数据来源
IS_SUCCESSFUL                                     CHAR(3) default '104' NULL, --是否入库成功
CONSTRAINT DTAB_RELATION_STORE_PK PRIMARY KEY(DSL_ID,TAB_ID)   );

--对象作业关系表
DROP TABLE IF EXISTS OBJ_RELATION_ETL ;
CREATE TABLE OBJ_RELATION_ETL(
OCS_ID                                            BIGINT default 0 NOT NULL, --对象采集任务编号
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
SUB_SYS_CD                                        VARCHAR(100) NOT NULL, --子系统代码
ETL_JOB                                           VARCHAR(512) NOT NULL, --作业名
ODC_ID                                            BIGINT default 0 NOT NULL, --对象采集id
CONSTRAINT OBJ_RELATION_ETL_PK PRIMARY KEY(OCS_ID)   );

--作业定义表
DROP TABLE IF EXISTS ETL_JOB_DEF ;
CREATE TABLE ETL_JOB_DEF(
ETL_JOB                                           VARCHAR(512) NOT NULL, --作业名
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
SUB_SYS_CD                                        VARCHAR(100) NOT NULL, --子系统代码
ETL_JOB_DESC                                      VARCHAR(200) NULL, --作业描述
PRO_TYPE                                          VARCHAR(50) NOT NULL, --作业程序类型
PRO_DIC                                           VARCHAR(512) NULL, --作业程序目录
PRO_NAME                                          VARCHAR(512) NULL, --作业程序名称
PRO_PARA                                          VARCHAR(1000) NULL, --作业程序参数
LOG_DIC                                           VARCHAR(512) NULL, --日志目录
DISP_FREQ                                         CHAR(1) NULL, --调度频率
DISP_OFFSET                                       INTEGER default 0 NULL, --调度时间位移
DISP_TYPE                                         CHAR(1) NULL, --调度触发方式
DISP_TIME                                         VARCHAR(30) NULL, --调度触发时间
JOB_EFF_FLAG                                      CHAR(1) NULL, --作业有效标志
JOB_PRIORITY                                      INTEGER default 0 NULL, --作业优先级
JOB_DISP_STATUS                                   CHAR(1) NULL, --作业调度状态
CURR_ST_TIME                                      VARCHAR(30) NULL, --开始时间
CURR_END_TIME                                     VARCHAR(30) NULL, --结束时间
OVERLENGTH_VAL                                    INTEGER default 0 NULL, --超长阀值
OVERTIME_VAL                                      INTEGER default 0 NULL, --超时阀值
CURR_BATH_DATE                                    VARCHAR(30) NULL, --当前批量日期
COMMENTS                                          VARCHAR(512) NULL, --备注信息
TODAY_DISP                                        CHAR(1) NULL, --当天是否调度
MAIN_SERV_SYNC                                    CHAR(1) NULL, --主服务器同步标志
JOB_PROCESS_ID                                    VARCHAR(100) NULL, --作业进程号
JOB_PRIORITY_CURR                                 INTEGER default 0 NULL, --作业当前优先级
JOB_RETURN_VAL                                    INTEGER default 0 NULL, --作业返回值
UPD_TIME                                          VARCHAR(50) NULL, --更新日期
EXE_FREQUENCY                                     INTEGER default 0 NOT NULL, --每隔(分钟)执行
EXE_NUM                                           INTEGER default 0 NULL, --执行次数
COM_EXE_NUM                                       INTEGER default 0 NULL, --已经执行次数
LAST_EXE_TIME                                     VARCHAR(20) NULL, --上次执行时间
STAR_TIME                                         VARCHAR(20) NULL, --开始执行时间
END_TIME                                          VARCHAR(20) NULL, --结束执行时间
CONSTRAINT ETL_JOB_DEF_PK PRIMARY KEY(ETL_JOB,ETL_SYS_CD)   );

--snowflake主键生成表
DROP TABLE IF EXISTS KEYTABLE_SNOWFLAKE ;
CREATE TABLE KEYTABLE_SNOWFLAKE(
PROJECT_ID                                        VARCHAR(80) NOT NULL, --project_id
DATACENTER_ID                                     INTEGER default 0 NULL, --datacenter_id
MACHINE_ID                                        INTEGER default 0 NULL, --machine_id
CONSTRAINT KEYTABLE_SNOWFLAKE_PK PRIMARY KEY(PROJECT_ID)   );

--作业调度表
DROP TABLE IF EXISTS ETL_JOB_CUR ;
CREATE TABLE ETL_JOB_CUR(
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
ETL_JOB                                           VARCHAR(512) NOT NULL, --作业名
SUB_SYS_CD                                        VARCHAR(100) NOT NULL, --子系统代码
ETL_JOB_DESC                                      VARCHAR(200) NULL, --作业描述
PRO_TYPE                                          VARCHAR(50) NULL, --作业程序类型
PRO_DIC                                           VARCHAR(512) NULL, --作业程序目录
PRO_NAME                                          VARCHAR(512) NULL, --作业程序名称
PRO_PARA                                          VARCHAR(1000) NULL, --作业程序参数
LOG_DIC                                           VARCHAR(512) NULL, --日志目录
DISP_FREQ                                         CHAR(1) NULL, --调度频率
DISP_OFFSET                                       INTEGER default 0 NULL, --调度时间位移
DISP_TYPE                                         CHAR(1) NULL, --调度触发方式
DISP_TIME                                         VARCHAR(30) NULL, --调度触发时间
JOB_EFF_FLAG                                      CHAR(1) NULL, --作业有效标志
JOB_PRIORITY                                      INTEGER default 0 NULL, --作业优先级
JOB_DISP_STATUS                                   CHAR(1) NULL, --作业调度状态
CURR_ST_TIME                                      VARCHAR(30) NULL, --开始时间
CURR_END_TIME                                     VARCHAR(30) NULL, --结束时间
OVERLENGTH_VAL                                    INTEGER default 0 NULL, --超长阀值
OVERTIME_VAL                                      INTEGER default 0 NULL, --超时阀值
CURR_BATH_DATE                                    VARCHAR(30) NULL, --当前批量日期
COMMENTS                                          VARCHAR(512) NULL, --备注信息
TODAY_DISP                                        CHAR(1) NULL, --当天是否调度
MAIN_SERV_SYNC                                    CHAR(1) NULL, --主服务器同步标志
JOB_PROCESS_ID                                    VARCHAR(100) NULL, --作业进程号
JOB_PRIORITY_CURR                                 INTEGER default 0 NULL, --作业当前优先级
JOB_RETURN_VAL                                    INTEGER default 0 NULL, --作业返回值
EXE_FREQUENCY                                     BIGINT default 0 NULL, --每隔(分钟)执行
EXE_NUM                                           INTEGER default 0 NULL, --执行次数
COM_EXE_NUM                                       INTEGER default 0 NULL, --已经执行次数
LAST_EXE_TIME                                     VARCHAR(20) NULL, --上次执行时间
STAR_TIME                                         VARCHAR(20) NULL, --开始执行时间
END_TIME                                          VARCHAR(20) NULL, --结束执行时间
CONSTRAINT ETL_JOB_CUR_PK PRIMARY KEY(ETL_SYS_CD,ETL_JOB)   );

--自定义表信息
DROP TABLE IF EXISTS DQ_TABLE_INFO ;
CREATE TABLE DQ_TABLE_INFO(
TABLE_ID                                          BIGINT default 0 NOT NULL, --自定义表ID
TABLE_SPACE                                       VARCHAR(512) NOT NULL, --表空间名称
TABLE_NAME                                        VARCHAR(512) NOT NULL, --表名
CH_NAME                                           VARCHAR(512) NULL, --表中文名称
CREATE_DATE                                       CHAR(8) NOT NULL, --开始日期
END_DATE                                          CHAR(8) NOT NULL, --结束日期
IS_TRACE                                          CHAR(1) NOT NULL, --是否数据溯源
DQ_REMARK                                         VARCHAR(512) NULL, --备注
CREATE_ID                                         BIGINT default 0 NOT NULL, --用户ID
CONSTRAINT DQ_TABLE_INFO_PK PRIMARY KEY(TABLE_ID)   );

--用户信息表
DROP TABLE IF EXISTS SYS_USER ;
CREATE TABLE SYS_USER(
USER_ID                                           BIGINT default 0 NOT NULL, --用户ID
CREATE_ID                                         BIGINT default 0 NOT NULL, --建立用户ID
DEP_ID                                            BIGINT default 0 NOT NULL, --部门ID
ROLE_ID                                           BIGINT default 0 NOT NULL, --角色ID
USER_NAME                                         VARCHAR(512) NOT NULL, --用户名称
USER_PASSWORD                                     VARCHAR(100) NOT NULL, --用户密码
USER_EMAIL                                        VARCHAR(100) NULL, --邮箱
USER_MOBILE                                       VARCHAR(20) NULL, --移动电话
USERIS_ADMIN                                      CHAR(1) default '1' NOT NULL, --是否为管理员
USER_TYPE                                         CHAR(2) NULL, --用户类型
USERTYPE_GROUP                                    VARCHAR(512) NULL, --用户类型组
LOGIN_IP                                          VARCHAR(50) NULL, --登录IP
LOGIN_DATE                                        CHAR(8) NULL, --最后登录时间
USER_STATE                                        CHAR(1) NOT NULL, --用户状态
CREATE_DATE                                       CHAR(8) NOT NULL, --创建日期
CREATE_TIME                                       CHAR(6) NULL, --创建时间
UPDATE_DATE                                       CHAR(8) NULL, --更新日期
UPDATE_TIME                                       CHAR(6) NULL, --更新时间
USER_REMARK                                       VARCHAR(512) NULL, --备注
TOKEN                                             VARCHAR(40) default '0' NOT NULL, --token
VALID_TIME                                        VARCHAR(40) default '0' NOT NULL, --token有效时间
CONSTRAINT SYS_USER_PK PRIMARY KEY(USER_ID)   );

--自定义表字段信息
DROP TABLE IF EXISTS DQ_TABLE_COLUMN ;
CREATE TABLE DQ_TABLE_COLUMN(
FIELD_ID                                          BIGINT default 0 NOT NULL, --自定义表字段ID
FIELD_CH_NAME                                     VARCHAR(512) NULL, --字段中文名称
COLUMN_NAME                                       VARCHAR(512) NOT NULL, --字段名称
COLUMN_TYPE                                       VARCHAR(512) NOT NULL, --字段类型
COLUMN_LENGTH                                     VARCHAR(200) NULL, --字段长度
IS_NULL                                           CHAR(1) NOT NULL, --是否可为空
COLSOURCETAB                                      VARCHAR(512) NULL, --字段来源表名称
COLSOURCECOL                                      VARCHAR(512) NULL, --来源字段
DQ_REMARK                                         VARCHAR(512) NULL, --备注
TABLE_ID                                          BIGINT default 0 NOT NULL, --自定义表ID
CONSTRAINT DQ_TABLE_COLUMN_PK PRIMARY KEY(FIELD_ID)   );

--作业历史表
DROP TABLE IF EXISTS ETL_JOB_DISP_HIS ;
CREATE TABLE ETL_JOB_DISP_HIS(
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
ETL_JOB                                           VARCHAR(512) NOT NULL, --作业名
CURR_BATH_DATE                                    VARCHAR(30) NOT NULL, --当前批量日期
SUB_SYS_CD                                        VARCHAR(100) NOT NULL, --子系统代码
ETL_JOB_DESC                                      VARCHAR(200) NULL, --作业描述
PRO_TYPE                                          VARCHAR(50) NULL, --作业程序类型
PRO_DIC                                           VARCHAR(512) NULL, --作业程序目录
PRO_NAME                                          VARCHAR(512) NULL, --作业程序名称
PRO_PARA                                          VARCHAR(1000) NULL, --作业程序参数
LOG_DIC                                           VARCHAR(512) NULL, --日志目录
DISP_FREQ                                         CHAR(1) NULL, --调度频率
DISP_OFFSET                                       INTEGER default 0 NULL, --调度时间位移
DISP_TYPE                                         CHAR(1) NULL, --调度触发方式
DISP_TIME                                         VARCHAR(30) NULL, --调度触发时间
JOB_EFF_FLAG                                      CHAR(1) NULL, --作业有效标志
JOB_PRIORITY                                      INTEGER default 0 NULL, --作业优先级
JOB_DISP_STATUS                                   CHAR(1) NULL, --作业调度状态
CURR_ST_TIME                                      VARCHAR(30) NULL, --开始时间
CURR_END_TIME                                     VARCHAR(30) NULL, --结束时间
OVERLENGTH_VAL                                    INTEGER default 0 NULL, --超长阀值
OVERTIME_VAL                                      INTEGER default 0 NULL, --超时阀值
COMMENTS                                          VARCHAR(512) NULL, --备注信息
TODAY_DISP                                        CHAR(1) NULL, --当天是否调度
MAIN_SERV_SYNC                                    CHAR(1) NULL, --主服务器同步标志
JOB_PROCESS_ID                                    VARCHAR(100) NULL, --作业进程号
JOB_PRIORITY_CURR                                 INTEGER default 0 NULL, --作业当前优先级
JOB_RETURN_VAL                                    INTEGER default 0 NULL, --作业返回值
EXE_FREQUENCY                                     BIGINT default 0 NULL, --每隔(分钟)执行	exe_frequency
EXE_NUM                                           INTEGER default 0 NULL, --执行次数
COM_EXE_NUM                                       INTEGER default 0 NULL, --已经执行次数
LAST_EXE_TIME                                     VARCHAR(20) NULL, --上次执行时间
STAR_TIME                                         VARCHAR(20) NULL, --开始执行时间
END_TIME                                          VARCHAR(20) NULL, --结束执行时间
CONSTRAINT ETL_JOB_DISP_HIS_PK PRIMARY KEY(ETL_SYS_CD,ETL_JOB,CURR_BATH_DATE)   );

--数据加工spark语法提示
DROP TABLE IF EXISTS EDW_SPARKSQL_GRAM ;
CREATE TABLE EDW_SPARKSQL_GRAM(
ESG_ID                                            BIGINT default 0 NOT NULL, --序号
FUNCTION_NAME                                     VARCHAR(512) NOT NULL, --函数名称
FUNCTION_EXAMPLE                                  VARCHAR(512) NOT NULL, --函数例子
FUNCTION_DESC                                     VARCHAR(512) NOT NULL, --函数描述
IS_AVAILABLE                                      CHAR(1) NOT NULL, --是否可用
IS_UDF                                            CHAR(1) NOT NULL, --是否udf
CLASS_URL                                         VARCHAR(512) NULL, --函数类路径
JAR_URL                                           VARCHAR(512) NULL, --jar路径
HIVEDB_NAME                                       VARCHAR(100) NULL, --hive库名
IS_SPARKSQL                                       CHAR(1) NOT NULL, --是否同时使用sparksql
REMARK                                            VARCHAR(512) NULL, --备注
CONSTRAINT EDW_SPARKSQL_GRAM_PK PRIMARY KEY(ESG_ID)   );

--作业依赖关系表
DROP TABLE IF EXISTS ETL_DEPENDENCY ;
CREATE TABLE ETL_DEPENDENCY(
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
ETL_JOB                                           VARCHAR(512) NOT NULL, --作业名
PRE_ETL_SYS_CD                                    VARCHAR(100) NOT NULL, --上游系统代码
PRE_ETL_JOB                                       VARCHAR(512) NOT NULL, --上游作业名
STATUS                                            CHAR(1) NULL, --状态
MAIN_SERV_SYNC                                    CHAR(1) NULL, --主服务器同步标志
CONSTRAINT ETL_DEPENDENCY_PK PRIMARY KEY(ETL_SYS_CD,ETL_JOB,PRE_ETL_SYS_CD,PRE_ETL_JOB)   );

--作业资源关系表
DROP TABLE IF EXISTS ETL_JOB_RESOURCE_RELA ;
CREATE TABLE ETL_JOB_RESOURCE_RELA(
ETL_SYS_CD                                        VARCHAR(100) NOT NULL, --工程代码
ETL_JOB                                           VARCHAR(512) NOT NULL, --作业名
RESOURCE_TYPE                                     VARCHAR(100) NULL, --资源使用类型
RESOURCE_REQ                                      INTEGER default 0 NULL, --资源需求数
CONSTRAINT ETL_JOB_RESOURCE_RELA_PK PRIMARY KEY(ETL_SYS_CD,ETL_JOB)   );

