package site.mingsha.test;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author mingsha
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class TestMingshaApplication {

    public static void main(String[] args) {

    }

}
