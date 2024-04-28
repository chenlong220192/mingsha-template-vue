package site.mingsha.biz.task.quartz;

import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import site.mingsha.dal.quartz.model.SysJobDO;

/**
 * 定时任务处理（禁止并发执行）
 * 
 * @author mingsha
 *
 */
@DisallowConcurrentExecution
public class QuartzDisallowConcurrentExecution extends AbstractQuartzJob {
    @Override
    protected void doExecute(JobExecutionContext context, SysJobDO sysJobDO) throws Exception {
        JobInvokeUtil.invokeMethod(sysJobDO);
    }
}
