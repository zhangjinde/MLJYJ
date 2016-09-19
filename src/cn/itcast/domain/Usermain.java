package cn.itcast.domain;


public class Usermain {
	private Integer um_id;
	private String username;
	private String user_password;
	private String user_nickname;
	private String regtime;
	private String lastlogtime;
	private Roles role;
	private String prompt_problem;//��ʾ����
	private String answer;
	private Integer log_num;
	private String IP;//����¼IP
	private Integer integral;//���
	private Uservice uservice;
	private Integer jf;//积分
	
	public Integer getJf() {
		return jf;
	}
	public void setJf(Integer jf) {
		this.jf = jf;
	}
	public Uservice getUservice() {
		return uservice;
	}
	public void setUservice(Uservice uservice) {
		this.uservice = uservice;
	}
	public Integer getUm_id() {
		return um_id;
	}
	public void setUm_id(Integer um_id) {
		this.um_id = um_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
	
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	public String getLastlogtime() {
		return lastlogtime;
	}
	public void setLastlogtime(String lastlogtime) {
		this.lastlogtime = lastlogtime;
	}
	public Roles getRole() {
		return role;
	}
	public void setRole(Roles role) {
		this.role = role;
	}
	public String getPrompt_problem() {
		return prompt_problem;
	}
	public void setPrompt_problem(String prompt_problem) {
		this.prompt_problem = prompt_problem;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	public Integer getLog_num() {
		return log_num;
	}
	public void setLog_num(Integer log_num) {
		this.log_num = log_num;
	}
	public String getIP() {
		return IP;
	}
	public void setIP(String iP) {
		IP = iP;
	}
	public Integer getIntegral() {
		return integral;
	}
	public void setIntegral(Integer integral) {
		this.integral = integral;
	}



	
}
