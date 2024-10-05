package com.InfinityArcade.models;

public class ReviewModel {
	
    private String user;
    private String gameId;
    private long date;
    private int rating;
    private String review;

    //setters
    public void setUser(String user) {
		this.user = user;
	}

	public void setGameId(String gameId) {
		this.gameId = gameId;
	}

	public void setDate(long date) {
		this.date = date;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public void setReview(String review) {
		this.review = review;
	}

	// Getters
    public String getUser() {
        return user;
    }

    public String getGameId() {
        return gameId;
    }

    public long getDate() {
        return date;
    }

    public int getRating() {
        return rating;
    }

    public String getReview() {
        return review;
    }

}
