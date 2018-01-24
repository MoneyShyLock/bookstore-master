package com.bookstore.common.util;

//消息结果集  用来记录返回值的信息
public class MessageResult {
    //data 【记录数据 Object】
    private Object data;

    // data 【记录是否成功 boolean】
    private boolean success;

    // message 【携带消息  错误信息或者成功信息 String】
    private String message;

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
