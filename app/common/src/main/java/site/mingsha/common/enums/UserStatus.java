package site.mingsha.common.enums;

/**
 * 用户状态
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public enum UserStatus {
                        OK("0", "正常"),
                        DISABLE("1", "停用"),
                        DELETED("2", "删除");

    private final String code;
    private final String info;

    UserStatus(String code, String info) {
        this.code = code;
        this.info = info;
    }

    public String getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }
}
