package site.mingsha.common.exception.user;

/**
 * 验证码失效异常类
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public class CaptchaExpireException extends UserException {
    private static final long serialVersionUID = 1L;

    public CaptchaExpireException() {
        super("user.jcaptcha.expire", null);
    }
}
