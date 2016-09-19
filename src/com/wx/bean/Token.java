package com.wx.bean;

public class Token {
	private String AccessToken;
	private Integer ExpiresIn;
	public String getAccessToken() {
		return AccessToken;
	}
	public void setAccessToken(String accessToken) {
		AccessToken = accessToken;
	}
	public Integer getExpiresIn() {
		return ExpiresIn;
	}
	public void setExpiresIn(Integer expiresIn) {
		ExpiresIn = expiresIn;
	}
}
