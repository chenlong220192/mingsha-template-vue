package site.mingsha.common.exception.user;

/**
 * 黑名单IP异常类
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public class BlackListException extends UserException {
    private static final long serialVersionUID = 1L;

    public BlackListException() {
        super("login.blocked", null);
    }
}
