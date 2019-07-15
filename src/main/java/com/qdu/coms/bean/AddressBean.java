package com.qdu.coms.bean;

public class AddressBean {
    private Integer id;

    private String account;

    private String recipients;

    private String tel;

    private String province;

    private String city;

    private String district;

    private String detailAddr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getRecipients() {
        return recipients;
    }

    public void setRecipients(String recipients) {
        this.recipients = recipients == null ? null : recipients.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district == null ? null : district.trim();
    }

    public String getDetailAddr() {
        return detailAddr;
    }

    public void setDetailAddr(String detailAddr) {
        this.detailAddr = detailAddr == null ? null : detailAddr.trim();
    }
}