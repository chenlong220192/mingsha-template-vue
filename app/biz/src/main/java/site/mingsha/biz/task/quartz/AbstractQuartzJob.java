package site.mingsha.biz.task.quartz;

import java.util.Date;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import site.mingsha.common.constant.Constants;
import site.mingsha.common.constant.ScheduleConstants;
import site.mingsha.common.utils.ExceptionUtil;
import site.mingsha.common.utils.StringUtils;
import site.mingsha.common.utils.bean.BeanUtils;
import site.mingsha.common.utils.spring.SpringUtils;
import site.mingsha.dal.quartz.model.SysJobDO;
import site.mingsha.dal.quartz.model.SysJobLogDO;
import site.mingsha.biz.service.ISysJobLogService;

/**
 * 抽象quartz调用
 *
 * @author mingsha
 * @date 2025-07-11
 */
public abstract class AbstractQuartzJob implements Job {

    private static final Logger      log         = LoggerFactory.getLogger(AbstractQuartzJob.class);

    /**
     * 线程本地变量
     */
    private static ThreadLocal<Date> threadLocal = new ThreadLocal<>();

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        SysJobDO sysJobDO = new SysJobDO();
        BeanUtils.copyBeanProp(sysJobDO, context.getMergedJobDataMap().get(ScheduleConstants.TASK_PROPERTIES));
        try {
            before(context, sysJobDO);
            if (sysJobDO != null) {
                doExecute(context, sysJobDO);
            }
            after(context, sysJobDO, null);
        } catch (Exception e) {
            log.error("任务执行异常  - ：", e);
            after(context, sysJobDO, e);
        }
    }

    /**
     * 执行前
     *
     * @param context 工作执行上下文对象
     * @param sysJobDO 系统计划任务
     */
    protected void before(JobExecutionContext context, SysJobDO sysJobDO) {
        threadLocal.set(new Date());
    }

    /**
     * 执行后
     *
     * @param context 工作执行上下文对象
     * @param sysJobDO 系统计划任务
     */
    protected void after(JobExecutionContext context, SysJobDO sysJobDO, Exception e) {
        Date startTime = threadLocal.get();
        threadLocal.remove();

        final SysJobLogDO sysJobLogDO = new SysJobLogDO();
        sysJobLogDO.setJobName(sysJobDO.getJobName());
        sysJobLogDO.setJobGroup(sysJobDO.getJobGroup());
        sysJobLogDO.setInvokeTarget(sysJobDO.getInvokeTarget());
        sysJobLogDO.setStartTime(startTime);
        sysJobLogDO.setStopTime(new Date());
        long runMs = sysJobLogDO.getStopTime().getTime() - sysJobLogDO.getStartTime().getTime();
        sysJobLogDO.setJobMessage(sysJobLogDO.getJobName() + " 总共耗时：" + runMs + "毫秒");
        if (e != null) {
            sysJobLogDO.setStatus(Constants.FAIL);
            String errorMsg = StringUtils.substring(ExceptionUtil.getExceptionMessage(e), 0, 2000);
            sysJobLogDO.setExceptionInfo(errorMsg);
        } else {
            sysJobLogDO.setStatus(Constants.SUCCESS);
        }

        // 写入数据库当中
        SpringUtils.getBean(ISysJobLogService.class).addJobLog(sysJobLogDO);
    }

    /**
     * 执行方法，由子类重载
     *
     * @param context 工作执行上下文对象
     * @param sysJobDO 系统计划任务
     * @throws Exception 执行过程中的异常
     */
    protected abstract void doExecute(JobExecutionContext context, SysJobDO sysJobDO) throws Exception;
}
