package com.InfinityArcade.util;

public class ReviewHandler {
	
    private String user;
    private String gameId;
    private long date;
    private int rating;
    private String review;

    // Constructor
    public ReviewHandler(String user, String gameId, long date, int rating, String review) {
        this.user = user;
        this.gameId = gameId;
        this.date = date;
        this.rating = rating;
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
