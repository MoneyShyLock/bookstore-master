package com.bookstore.pojo.vo;

public class CountBook {

    private Integer child=0;
    private Integer literature=0;
    private Integer novel=0;
    private Integer economicManagement=0;
    private Integer life=0;
    private Integer exam=0;

    public Integer getChild() {
        return child;
    }

    public void setChild(Integer child) {
        this.child = child;
    }

    public Integer getLiterature() {
        return literature;
    }

    public void setLiterature(Integer literature) {
        this.literature = literature;
    }

    public Integer getNovel() {
        return novel;
    }

    public void setNovel(Integer novel) {
        this.novel = novel;
    }

    public Integer getEconomicManagement() {
        return economicManagement;
    }

    public void setEconomicManagement(Integer economicManagement) {
        this.economicManagement = economicManagement;
    }

    public Integer getLife() {
        return life;
    }

    public void setLife(Integer life) {
        this.life = life;
    }

    public Integer getExam() {
        return exam;
    }

    public void setExam(Integer exam) {
        this.exam = exam;
    }

    @Override
    public String toString() {
        return "CountBook{" +
                "child=" + child +
                ", literature=" + literature +
                ", novel=" + novel +
                ", economicManagement=" + economicManagement +
                ", life=" + life +
                ", exam=" + exam +
                '}';
    }
}
