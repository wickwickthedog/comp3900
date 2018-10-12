package com.h2cg.accommodation.dto;

import java.util.ArrayList;

public class RoomDTO {
    private Integer id;

    private Integer advId;
    
    private AdvertiseDTO adv;

    private String name;

    private Double rental;

    private Integer maxPeople;

    private String description;
    
    private ArrayList<String> picList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAdvId() {
        return advId;
    }

    public void setAdvId(Integer advId) {
        this.advId = advId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Double getRental() {
        return rental;
    }

    public void setRental(Double rental) {
        this.rental = rental;
    }

    public Integer getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(Integer maxPeople) {
        this.maxPeople = maxPeople;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

	public AdvertiseDTO getAdv() {
		return adv;
	}

	public void setAdv(AdvertiseDTO adv) {
		this.adv = adv;
	}

	public ArrayList<String> getPicList() {
		return picList;
	}

	public void setPicList(ArrayList<String> picList) {
		this.picList = picList;
	}
}