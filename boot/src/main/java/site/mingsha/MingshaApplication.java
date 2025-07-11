package site.mingsha;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author mingsha
 * @date 2025-07-11
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class MingshaApplication {
    public static void main(String[] args) {
        SpringApplication.run(MingshaApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  启动成功   ლ(´ڡ`ლ)ﾞ  \n");
    }
}
