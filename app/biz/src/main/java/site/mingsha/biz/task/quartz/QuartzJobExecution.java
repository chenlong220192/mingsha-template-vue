package site.mingsha.biz.task.quartz;

import org.quartz.JobExecutionContext;
import site.mingsha.dal.quartz.model.SysJobDO;

/**
 * 定时任务处理（允许并发执行）
 * 
 * @author mingsha
 * @date 2025-07-11
 *
 */
public class QuartzJobExecution extends AbstractQuartzJob {
    @Override
    protected void doExecute(JobExecutionContext context, SysJobDO sysJobDO) throws Exception {
        JobInvokeUtil.invokeMethod(sysJobDO);
    }
}
