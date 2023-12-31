package com.sh.petking.camp.model.entity;

public class CampTag {
    private Long id;
    private String name;

    public CampTag() {
    }

    public CampTag(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CampTag{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
