package site.mingsha.common.exception.user;

/**
 * 验证码错误异常类
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public class CaptchaException extends UserException {
    private static final long serialVersionUID = 1L;

    public CaptchaException() {
        super("user.jcaptcha.error", null);
    }
}
