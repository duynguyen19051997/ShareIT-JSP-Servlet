package model.bean;

public class aboutMe {
	private String me;
	private String email;
	private String facebook;
	private int phone;

	public String getMe() {
		return me;
	}

	public void setMe(String me) {
		this.me = me;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public aboutMe(String me, String email, String facebook, int phone) {
		super();
		this.me = me;
		this.email = email;
		this.facebook = facebook;
		this.phone = phone;
	}

	public aboutMe() {
		super();
	}

}
