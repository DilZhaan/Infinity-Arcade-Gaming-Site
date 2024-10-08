package com.InfinityArcade.models;

public class Review {

    private String reviewID;
    private String user;
    private String gameId;
    private String postedDate;
    private String updatedDate;
    private String rating;
    private String review;

    //setters
    public void setUser(String user) {
		this.user = user;
	}

	public void setGameId(String gameId) {
		this.gameId = gameId;
	}

	public void setPostedDate(String postedDate) {
		this.postedDate = postedDate;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

	public void setReviewID(String reviewID) {
		this.reviewID = reviewID;
	}

	// Getters
    public String getUser() {
        return user;
    }

    public String getGameId() {
        return gameId;
    }

    public String getPostedDate() {
        return postedDate;
    }

    public String getRating() {
        return rating;
    }

    public String getReview() {
        return review;
    }

	public String getUpdatedDate() {
		return updatedDate;
	}

	public String getReviewID() {
		return reviewID;
	}


}
