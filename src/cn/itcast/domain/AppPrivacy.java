package cn.itcast.domain;

public class AppPrivacy {
	private Integer id;
	private Integer uid;
	private boolean searchmefromaccount;
	private boolean searchmefromtel;
	private boolean addmecheck;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public boolean isSearchmefromaccount() {
		return searchmefromaccount;
	}
	public void setSearchmefromaccount(boolean searchmefromaccount) {
		this.searchmefromaccount = searchmefromaccount;
	}
	public boolean isSearchmefromtel() {
		return searchmefromtel;
	}
	public void setSearchmefromtel(boolean searchmefromtel) {
		this.searchmefromtel = searchmefromtel;
	}
	public boolean isAddmecheck() {
		return addmecheck;
	}
	public void setAddmecheck(boolean addmecheck) {
		this.addmecheck = addmecheck;
	}
	
}
