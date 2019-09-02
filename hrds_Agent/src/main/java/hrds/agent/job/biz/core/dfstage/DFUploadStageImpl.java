package hrds.agent.job.biz.core.dfstage;

import hrds.agent.job.biz.bean.StageStatusInfo;
import hrds.agent.job.biz.constant.RunStatusConstant;
import hrds.agent.job.biz.constant.StageConstant;
import hrds.agent.job.biz.core.AbstractJobStage;
import hrds.agent.job.biz.utils.DateUtil;
import hrds.agent.job.biz.utils.ScriptExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * ClassName: DFCalIncrementStageImpl <br/>
 * Function: 数据文件采集，数据上传阶段实现. <br/>
 * Date: 2019/8/1 15:24 <br/>
 * <p>
 * Author 13616
 * Version 1.0
 * Since JDK 1.8
 **/
public class DFUploadStageImpl extends AbstractJobStage {
    private final static Logger LOGGER = LoggerFactory.getLogger(DFUploadStageImpl.class);

    private final String jobId;
    private final String localFile;
    private final String remoteDir;

    /**
     * 数据文件采集，数据上传阶段实现
     * @author   13616
     * @date     2019/8/7 11:48
     *
     * @param jobId 作业编号
     * @param localFile 本地文件路径
     * @param remoteDir hdfs文件路径
     */
    public DFUploadStageImpl(String jobId, String localFile, String remoteDir) {
        this.jobId = jobId;
        this.localFile = localFile;
        this.remoteDir = remoteDir;
    }

    @Override
    public StageStatusInfo handleStage() {

        StageStatusInfo statusInfo = new StageStatusInfo();
        statusInfo.setStageNameCode(StageConstant.UPLOAD.getCode());
        statusInfo.setJobId(jobId);
        statusInfo.setStartDate(DateUtil.getLocalDateByChar8());
        statusInfo.setStartTime(DateUtil.getLocalTimeByChar6());
        RunStatusConstant status = RunStatusConstant.SUCCEED;
        ScriptExecutor executor = new ScriptExecutor();
        try {
            executor.executeUpload2Hdfs(localFile, remoteDir);
        }catch (IllegalStateException | InterruptedException e){
            status = RunStatusConstant.FAILED;
            statusInfo.setMessage(FAILD_MSG+ "：" + e.getMessage());
            LOGGER.error(FAILD_MSG+ "：{}", e.getMessage());
        }

        statusInfo.setStatusCode(status.getCode());
        statusInfo.setEndDate(DateUtil.getLocalDateByChar8());
        statusInfo.setEndTime(DateUtil.getLocalTimeByChar6());
        return statusInfo;
    }
}