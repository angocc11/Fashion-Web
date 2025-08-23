package com.doan.Shop.Model;

import java.sql.Timestamp;


public class Review {
	private int id;
	private int product_id;
	private int user_id;
	private String userName;
	private int rating;
	private String review_text;
	private Timestamp review_date;
	public Review(int id, int product_id, int user_id, int rating, String review_text, Timestamp review_date) {
		super();
		this.id = id;
		this.product_id = product_id;
		this.user_id = user_id;
		this.rating = rating;
		this.review_text = review_text;
		this.review_date = review_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReview_text() {
		return review_text;
	}
	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	public String getUserName() {
	    return userName;
	}
	public void setUserName(String userName) {
	    this.userName = userName;
	}
	public Review() {
	    // Constructor mặc định
	}

}
