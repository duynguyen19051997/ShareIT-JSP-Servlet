package model.bean;

import java.sql.Timestamp;

public class Comment {

	private String email;
	private String message;
	private String active;
	private int id;
	private int new_id;
	private Timestamp date_creat;

	public Timestamp getDate_creat() {
		return date_creat;
	}

	public void setDate_creat(Timestamp date_creat) {
		this.date_creat = date_creat;
	}

	public int getNew_id() {
		return new_id;
	}

	public void setNew_id(int new_id) {
		this.new_id = new_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Comment(String email, String message, String active, int id) {
		super();
		this.email = email;
		this.message = message;
		this.active = active;
		this.id = id;
	}

	public Comment(String email, String message, String active, int id, int new_id) {
		super();
		this.email = email;
		this.message = message;
		this.active = active;
		this.id = id;
		this.new_id = new_id;
	}

	public Comment(String email, String message, String active, int id, int new_id, Timestamp date_creat) {
		super();
		this.email = email;
		this.message = message;
		this.active = active;
		this.id = id;
		this.new_id = new_id;
		this.date_creat = date_creat;
	}

	public Comment() {
		super();
	}

}
