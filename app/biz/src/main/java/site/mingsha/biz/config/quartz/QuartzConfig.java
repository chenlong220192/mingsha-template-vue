package site.mingsha.biz.config.quartz;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import jakarta.annotation.Resource;

/**
 * Quartz 定时任务配置
 *
 * @author mingsha
 * @date 2026-04-08
 */
@Configuration
public class QuartzConfig {

    @Resource
    private PlatformTransactionManager transactionManager;

    /**
     * 配置 SchedulerFactoryBean
     * 让 Spring Boot 自动配置处理数据源
     */
    @Bean
    public SchedulerFactoryBean schedulerFactoryBean() {
        SchedulerFactoryBean factory = new SchedulerFactoryBean();

        // 设置事务管理器
        factory.setTransactionManager(transactionManager);

        // 基本配置
        factory.setOverwriteExistingJobs(true);
        factory.setAutoStartup(true);
        factory.setStartupDelay(1);

        return factory;
    }
}
