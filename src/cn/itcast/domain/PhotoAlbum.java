package cn.itcast.domain;

public class PhotoAlbum {
	private Integer pa_id;
	private String pa_name;

	private String pa_instructions;
	private String pa_url;
	private String pa_problem;
	private String pa_answer;
	private Family pa_family;
	private PhotoAlbumClass pa_pac;
	private String pa_time;
	private Integer state;//1为默认状态2为回收站状态

	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getPa_time() {
		return pa_time;
	}
	public void setPa_time(String pa_time) {
		this.pa_time = pa_time;
	}
	public String getPa_url() {
		return pa_url;
	}
	public void setPa_url(String pa_url) {
		this.pa_url = pa_url;
	}
	public Family getPa_family() {
		return pa_family;
	}
	public void setPa_family(Family pa_family) {
		this.pa_family = pa_family;
	}
	public PhotoAlbumClass getPa_pac() {
		return pa_pac;
	}
	public void setPa_pac(PhotoAlbumClass pa_pac) {
		this.pa_pac = pa_pac;
	}
	
	public Integer getPa_id() {
		return pa_id;
	}
	public void setPa_id(Integer pa_id) {
		this.pa_id = pa_id;
	}
	
	public String getPa_name() {
		return pa_name;
	}
	public void setPa_name(String pa_name) {
		this.pa_name = pa_name;
	}
	
	public String getPa_instructions() {
		return pa_instructions;
	}
	public void setPa_instructions(String pa_instructions) {
		this.pa_instructions = pa_instructions;
	}
	
	public String getPa_problem() {
		return pa_problem;
	}
	public void setPa_problem(String pa_problem) {
		this.pa_problem = pa_problem;
	}
	public String getPa_answer() {
		return pa_answer;
	}
	public void setPa_answer(String pa_answer) {
		this.pa_answer = pa_answer;
	}
	
	

}
