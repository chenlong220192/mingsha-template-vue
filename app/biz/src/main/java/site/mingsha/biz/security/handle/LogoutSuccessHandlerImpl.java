package site.mingsha.biz.security.handle;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import com.alibaba.fastjson2.JSON;
import site.mingsha.common.constant.Constants;
import site.mingsha.common.model.response.AjaxResponseDTO;
import site.mingsha.biz.model.dto.LoginUser;
import site.mingsha.common.utils.MessageUtils;
import site.mingsha.common.utils.ServletUtils;
import site.mingsha.common.utils.StringUtils;
import site.mingsha.biz.manager.AsyncManager;
import site.mingsha.biz.manager.factory.AsyncFactory;
import site.mingsha.biz.service.impl.TokenService;

/**
 * 自定义退出处理类 返回成功
 * 
 * @author mingsha
 * @date 2025-07-11
 */
@Configuration
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler {
    @Autowired
    private TokenService tokenService;

    /**
     * 退出处理
     * 
     * @return
     */
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        LoginUser loginUser = tokenService.getLoginUser(request);
        if (StringUtils.isNotNull(loginUser)) {
            String userName = loginUser.getUsername();
            // 删除用户缓存记录
            tokenService.delLoginUser(loginUser.getToken());
            // 记录用户退出日志
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(userName, Constants.LOGOUT, MessageUtils.message("user.logout.success")));
        }
        ServletUtils.renderString(response, JSON.toJSONString(AjaxResponseDTO.success(MessageUtils.message("user.logout.success"))));
    }
}
