package com.h2cg.accommodation.dto;

import java.util.Date;

public class BookDTO {
    private Integer id;

    private Integer userId;
    
    private UsersDTO user;

    private Integer roomId;
    
    private RoomDTO room;

    private Integer status;

    private Date stayBegin;

    private Date stayEnd;
    
    private String stayBeginStr;

    private String stayEndStr;


    private Date booktime;

    private String habit;

    private String expectation;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getStayBegin() {
        return stayBegin;
    }

    public void setStayBegin(Date stayBegin) {
        this.stayBegin = stayBegin;
    }

    public Date getStayEnd() {
        return stayEnd;
    }

    public void setStayEnd(Date stayEnd) {
        this.stayEnd = stayEnd;
    }

    public Date getBooktime() {
        return booktime;
    }

    public void setBooktime(Date booktime) {
        this.booktime = booktime;
    }

    public String getHabit() {
        return habit;
    }

    public void setHabit(String habit) {
        this.habit = habit == null ? null : habit.trim();
    }

    public String getExpectation() {
        return expectation;
    }

    public void setExpectation(String expectation) {
        this.expectation = expectation == null ? null : expectation.trim();
    }

	public UsersDTO getUser() {
		return user;
	}

	public void setUser(UsersDTO user) {
		this.user = user;
	}

	public RoomDTO getRoom() {
		return room;
	}

	public void setRoom(RoomDTO room) {
		this.room = room;
	}

	public String getStayEndStr() {
		return stayEndStr;
	}

	public void setStayEndStr(String stayEndStr) {
		this.stayEndStr = stayEndStr;
	}

	public String getStayBeginStr() {
		return stayBeginStr;
	}

	public void setStayBeginStr(String stayBeginStr) {
		this.stayBeginStr = stayBeginStr;
	}
}