package hrds.b.biz.agent.dbagentconf.dbconf;

import fd.ng.core.annotation.DocClass;
import fd.ng.db.jdbc.DatabaseWrapper;
import fd.ng.db.jdbc.SqlOperator;
import hrds.b.biz.agent.dbagentconf.BaseInitData;
import hrds.commons.entity.*;

import java.util.List;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;

@DocClass(desc = "为DBConfStepAction单元测试类初始化和销毁数据", author = "WangZhengcheng")
public class InitAndDestDataForDBConf {
	//测试数据用户ID
	private static final long TEST_USER_ID = -9997L;
	private static final long TEST_DEPT_ID = -9987L;
	private static final long FIRST_DB_AGENT_ID = 7001L;
	private static final long SECOND_DB_AGENT_ID = 7002L;
	private static final long THIRD_CLASSIFY_ID = 12306L;

	public static void before(){
		//构造sys_user表测试数据
		Sys_user user = BaseInitData.buildSysUserData();

		//构造department_info表测试数据
		Department_info departmentInfo = BaseInitData.buildDeptInfoData();

		//1、构建data_source表测试数据
		Data_source dataSource = BaseInitData.buildDataSourceData();

		//2、构建agent_info表测试数据
		List<Agent_info> agents = BaseInitData.buildAgentInfosData();

		//3、构建database_set表测试数据
		List<Database_set> databases = BaseInitData.buildDbSetData();

		//4、构建collect_job_classify表测试数据
		List<Collect_job_classify> classifies = BaseInitData.buildClassifyData();
		Collect_job_classify thridClassify = new Collect_job_classify();
		thridClassify.setClassify_id(THIRD_CLASSIFY_ID);
		thridClassify.setAgent_id(FIRST_DB_AGENT_ID);
		thridClassify.setClassify_num("wzc_test_classify_num3");
		thridClassify.setClassify_name("wzc_test_classify_name3");
		thridClassify.setUser_id(TEST_USER_ID);
		classifies.add(thridClassify);

		//插入数据
		try (DatabaseWrapper db = new DatabaseWrapper()) {
			//插入用户表(sys_user)测试数据
			int userCount = user.add(db);
			assertThat("用户表测试数据初始化", userCount, is(1));

			//插入部门表(department_info)测试数据
			int deptCount = departmentInfo.add(db);
			assertThat("部门表测试数据初始化", deptCount, is(1));

			//插入数据源表(data_source)测试数据
			int dataSourceCount = dataSource.add(db);
			assertThat("数据源测试数据初始化", dataSourceCount, is(1));

			//插入Agent信息表(agent_info)测试数据
			for(Agent_info agentInfo : agents){
				agentInfo.add(db);
			}
			assertThat("Agent测试数据初始化", agents.size(), is(2));

			//插入database_set表测试数据
			for(Database_set databaseSet : databases){
				databaseSet.add(db);
			}
			assertThat("数据库设置测试数据初始化", databases.size(), is(2));

			//插入collect_job_classify表测试数据
			for(Collect_job_classify classify : classifies){
				classify.add(db);
			}
			assertThat("采集任务分类表测试数据初始化", classifies.size(), is(3));

			SqlOperator.commitTransaction(db);
		}

	}

	public static void after(){
		try (DatabaseWrapper db = new DatabaseWrapper()) {
			//删除用户表(sys_user)测试数据
			SqlOperator.execute(db, "delete from " + Sys_user.TableName + " WHERE user_id = ?", TEST_USER_ID);
			//删除部门表(department_info)测试数据
			SqlOperator.execute(db, "delete from " + Department_info.TableName + " WHERE dep_id = ?", TEST_DEPT_ID);
			//1、删除数据源表(data_source)测试数据
			SqlOperator.execute(db, "delete from " + Data_source.TableName + " WHERE create_user_id = ?", TEST_USER_ID);
			//2、删除Agent信息表(agent_info)测试数据
			SqlOperator.execute(db, "delete from " + Agent_info.TableName + " WHERE user_id = ?", TEST_USER_ID);
			//3、删除database_set表测试数据
			SqlOperator.execute(db, "delete from " + Database_set.TableName + " WHERE agent_id = ?", FIRST_DB_AGENT_ID);
			SqlOperator.execute(db, "delete from " + Database_set.TableName + " WHERE agent_id = ?", SECOND_DB_AGENT_ID);
			//4、删除collect_job_classify表测试数据
			SqlOperator.execute(db, "delete from " + Collect_job_classify.TableName + " WHERE user_id = ?", TEST_USER_ID);

			SqlOperator.commitTransaction(db);
		}
	}
}
