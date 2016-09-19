package cn.itcast.domain;

import java.util.Set;

public class Roles {
	private Integer role_id;
	private String role_name;
	private String role_instructions;
	private Set<Permissions> permissions;
	
	public Set<Permissions> getPermissions() {
		return permissions;
	}
	public void setPermissions(Set<Permissions> permissions) {
		this.permissions = permissions;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getRole_instructions() {
		return role_instructions;
	}
	public void setRole_instructions(String role_instructions) {
		this.role_instructions = role_instructions;
	}
}
