package common.utils.error_code;


public enum BizCodeEnum {
    UNKNOWN_EXCEPTION(10000, "未知错误"),

    VALID_EXCEPTION(10001, "参数校验失败");

    private Integer code;
    private String message;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    BizCodeEnum(int code, String message) {
        this.code=code;
        this.message=message;
    }
}
