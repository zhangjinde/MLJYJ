package cn.itcast.domain;




public class Pictures {
	private Integer pic_id;
	private String pic_uuid;
	private String pic_realname;//1.jpg
	private String pic_fullurl;//�����ַ������磺x:\\xx\1.jpg
	private String pic_url;//x:\\xx\
	private String pic_relurl;//��Ե�ַ
	private String upload_time;
	private String pic_instructions;
	private Integer upload_userid;//�ϴ��û�
	private PhotoAlbum pic_pa;
	private Integer pic_index;
	
	public Integer getPic_index() {
		return pic_index;
	}
	public void setPic_index(Integer pic_index) {
		this.pic_index = pic_index;
	}
	public String getPic_relurl() {
		return pic_relurl;
	}
	public void setPic_relurl(String pic_relurl) {
		this.pic_relurl = pic_relurl;
	}
	public String getPic_fullurl() {
		return pic_fullurl;
	}
	public void setPic_fullurl(String pic_fullurl) {
		this.pic_fullurl = pic_fullurl;
	}
	public Integer getPic_id() {
		return pic_id;
	}
	public void setPic_id(Integer pic_id) {
		this.pic_id = pic_id;
	}
	public String getPic_uuid() {
		return pic_uuid;
	}
	public void setPic_uuid(String pic_uuid) {
		this.pic_uuid = pic_uuid;
	}
	public String getPic_realname() {
		return pic_realname;
	}
	public void setPic_realname(String pic_realname) {
		this.pic_realname = pic_realname;
	}
	public String getPic_url() {
		return pic_url;
	}
	public void setPic_url(String pic_url) {
		this.pic_url = pic_url;
	}
	public String getUpload_time() {
		return upload_time;
	}
	public void setUpload_time(String upload_time) {
		this.upload_time = upload_time;
	}
	public String getPic_instructions() {
		return pic_instructions;
	}
	public void setPic_instructions(String pic_instructions) {
		this.pic_instructions = pic_instructions;
	}
	public Integer getUpload_userid() {
		return upload_userid;
	}
	public void setUpload_userid(Integer upload_userid) {
		this.upload_userid = upload_userid;
	}
	public PhotoAlbum getPic_pa() {
		return pic_pa;
	}
	public void setPic_pa(PhotoAlbum pic_pa) {
		this.pic_pa = pic_pa;
	}
	
	
	
}
