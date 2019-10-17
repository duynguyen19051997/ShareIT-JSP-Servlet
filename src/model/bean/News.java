package model.bean;

import java.sql.Timestamp;

public class News {
	private String name;
	private String preview;
	private String detail;
	private String creat_by;
	private String picture;
	private Timestamp date_create;
	private String active;
	private int id;
	private int view;
	private Category objCat;

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getCreat_by() {
		return creat_by;
	}

	public void setCreat_by(String creat_by) {
		this.creat_by = creat_by;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Timestamp getDate_create() {
		return date_create;
	}

	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public Category getObjCat() {
		return objCat;
	}

	public void setObjCat(Category objCat) {
		this.objCat = objCat;
	}

	public News(String name, String preview, String detail, String creat_by, String picture, String active,
			Category objCat) {
		super();
		this.name = name;
		this.preview = preview;
		this.detail = detail;
		this.creat_by = creat_by;
		this.picture = picture;
		this.active = active;
		this.objCat = objCat;
	}

	public News(String name, String preview, String detail, String creat_by, String picture, String active, int id,
			Category objCat) {
		super();
		this.name = name;
		this.preview = preview;
		this.detail = detail;
		this.creat_by = creat_by;
		this.picture = picture;
		this.active = active;
		this.id = id;
		this.objCat = objCat;
	}

	public News(String name, String preview, String detail, String creat_by, String picture, Timestamp date_create,
			String active, int id, Category objCat) {
		super();
		this.name = name;
		this.preview = preview;
		this.detail = detail;
		this.creat_by = creat_by;
		this.picture = picture;
		this.date_create = date_create;
		this.active = active;
		this.id = id;
		this.objCat = objCat;
	}

	public News(String name, String preview, String detail, String creat_by, String picture, Timestamp date_create,
			String active, int id, int view, Category objCat) {
		super();
		this.name = name;
		this.preview = preview;
		this.detail = detail;
		this.creat_by = creat_by;
		this.picture = picture;
		this.date_create = date_create;
		this.active = active;
		this.id = id;
		this.view = view;
		this.objCat = objCat;
	}

	public News() {
		super();
	}

	@Override
	public String toString() {
		return "News [name=" + name + ", preview=" + preview + ", detail=" + detail + ", creat_by=" + creat_by
				+ ", picture=" + picture + ", date_create=" + date_create + ", active=" + active + ", objCat=" + objCat
				+ "]";
	}

}
