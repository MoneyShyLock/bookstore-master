package com.bookstore.pojo.po;

public class Address {
    private Long id;
    private String addrname;
    private Long uid;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAddrname() {
        return addrname;
    }

    public void setAddrname(String addrname) {
        this.addrname = addrname == null ? null : addrname.trim();
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", addrname='" + addrname + '\'' +
                ", uid=" + uid +
                '}';
    }
}