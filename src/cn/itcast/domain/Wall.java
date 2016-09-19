package cn.itcast.domain;

public class Wall {
	private Integer wall_id;
	private Integer wall_user;
	private String wall_content;
	
	public Integer getWall_id() {
		return wall_id;
	}
	public void setWall_id(Integer wall_id) {
		this.wall_id = wall_id;
	}
	public Integer getWall_user() {
		return wall_user;
	}
	public void setWall_user(Integer wall_user) {
		this.wall_user = wall_user;
	}
	public String getWall_content() {
		return wall_content;
	}
	public void setWall_content(String wall_content) {
		this.wall_content = wall_content;
	}
}
