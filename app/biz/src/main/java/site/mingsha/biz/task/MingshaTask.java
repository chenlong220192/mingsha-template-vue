package site.mingsha.biz.task;

import org.springframework.stereotype.Component;
import site.mingsha.common.utils.StringUtils;

/**
 * 定时任务调度测试
 *
 * @author mingsha
 * @date 2025-07-11
 */
@Component("mingshaTask")
public class MingshaTask {

    public void ryMultipleParams(String s, Boolean b, Long l, Double d, Integer i) {
        System.out.println(StringUtils.format("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i));
    }

    public void ryParams(String params) {
        System.out.println("执行有参方法：" + params);
    }

    public void ryNoParams() {
        System.out.println("执行无参方法");
    }
}
