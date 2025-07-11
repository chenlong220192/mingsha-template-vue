package site.mingsha.common.exception.user;

import site.mingsha.common.exception.base.BaseException;

/**
 * 用户信息异常类
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public class UserException extends BaseException {
    private static final long serialVersionUID = 1L;

    public UserException(String code, Object[] args) {
        super("user", code, args, null);
    }
}
