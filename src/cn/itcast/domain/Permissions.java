package cn.itcast.domain;

import java.util.Set;

public class Permissions {
	private Integer permissions_id;
	private String permission_name;
	private String permission_describe;//È¨ÏŞÃèÊö
	private Set<Roles> roles;
	
	public Set<Roles> getRoles() {
		return roles;
	}
	public void setRoles(Set<Roles> roles) {
		this.roles = roles;
	}
	public Integer getPermissions_id() {
		return permissions_id;
	}
	public void setPermissions_id(Integer permissions_id) {
		this.permissions_id = permissions_id;
	}
	public String getPermission_name() {
		return permission_name;
	}
	public void setPermission_name(String permission_name) {
		this.permission_name = permission_name;
	}
	public String getPermission_describe() {
		return permission_describe;
	}
	public void setPermission_describe(String permission_describe) {
		this.permission_describe = permission_describe;
	}
}
