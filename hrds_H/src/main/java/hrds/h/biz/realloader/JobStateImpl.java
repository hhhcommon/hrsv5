package hrds.h.biz.realloader;

import fd.ng.core.utils.DateUtil;
import fd.ng.db.jdbc.DatabaseWrapper;
import hrds.commons.codes.JobExecuteState;
import hrds.commons.entity.Dm_datatable;
import hrds.commons.entity.Dm_relation_datatable;
import hrds.commons.exception.AppSystemException;
import hrds.h.biz.config.MarketConf;

/**
 * @Author: Mick Yuan
 * @Date:
 * @Since jdk1.8
 */
public class JobStateImpl implements JobState {

    MarketConf conf;
    private final Dm_relation_datatable dmRelationDatatable;
    private final Dm_datatable dmDatatable;
    private long jobStartTime;
    /**
     * 程序运行过程中，JVM退出执行job错误退出
     */
    final Thread shutdownThread;

    public JobStateImpl(MarketConf conf) {
        this.conf = conf;
        this.dmRelationDatatable = conf.getDmRelationDatatable();
        this.dmDatatable = conf.getDmDatatable();
        shutdownThread = new Thread(() -> endJob(false));
    }

    @Override
    public void startJob() {

        //如果该作业的数据库状态是运行中的话，则异常退出
        String jobStateCode = dmRelationDatatable.getIs_successful();
        if (JobExecuteState.YunXing.getCode().equals(jobStateCode)) {
            throw new AppSystemException("作业正在运行中，请勿重复提交。");
        }

        //设置作业状态的运行中
        try (DatabaseWrapper db = new DatabaseWrapper()) {
            dmRelationDatatable.setIs_successful(JobExecuteState.YunXing.getCode());
            dmRelationDatatable.update(db);
            db.commit();
        }

        Runtime.getRuntime().addShutdownHook(shutdownThread);

        jobStartTime = System.currentTimeMillis();

        logger.info(String.format("[%s] 集市作业开始运行 [%s]: etlDate: %s, isFirstLoad: %s, reRun: %s.",
                DateUtil.getDateTime(DateUtil.DATETIME_ZHCN), conf.getDatatableId(),
                conf.getEtlDate(), conf.isFirstLoad(), conf.isRerun()));
    }

    @Override
    public void endJob(boolean isSuccessful) {

        //根据返回结果，将数据库中的运行状态改为相应状态 完成 or 失败
        String jobCode = isSuccessful ?
                JobExecuteState.WanCheng.getCode() : JobExecuteState.ShiBai.getCode();

        try (DatabaseWrapper db = new DatabaseWrapper()) {
            dmRelationDatatable.setIs_successful(jobCode);
            dmRelationDatatable.update(db);

            /*
             * 如果是首次执行铺底，且未成功的情况下，不更新跑批日期字段
             * 下次运行，依然算是首次执行
             */
            if (!(!isSuccessful && conf.isFirstLoad())) {
                dmDatatable.setDatac_date(DateUtil.getSysDate());
                dmDatatable.setDatac_time(DateUtil.getSysTime());
                dmDatatable.setEtl_date(conf.getEtlDate());
                dmDatatable.update(db);
            }

            db.commit();
        } finally {
            Runtime.getRuntime().removeShutdownHook(shutdownThread);
            logger.info(String.format("[%s] 集市作业运行结束 [%s]: successful: %s, lastTime: %s s.",
                    DateUtil.getDateTime(DateUtil.DATETIME_ZHCN), conf.getDatatableId(),
                    isSuccessful, (System.currentTimeMillis() - jobStartTime) / 1000F));

        }
    }
}