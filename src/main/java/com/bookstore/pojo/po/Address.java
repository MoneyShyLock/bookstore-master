package com.bookstore.pojo.po;

public class Address {
    private Long id;

    private String addrname;

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
}