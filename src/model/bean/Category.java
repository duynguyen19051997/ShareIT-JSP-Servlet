package model.bean;

public class Category {
	private int id;
	private int parent_id;
	private int sort;
	private String name;
	private String create_by;

	public String getCreate_by() {
		return create_by;
	}

	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getParent_id() {
		return parent_id;
	}

	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Category(int id, int parent_id, String name) {
		super();
		this.id = id;
		this.parent_id = parent_id;
		this.name = name;
	}

	public Category(int id, int parent_id, int sort, String name) {
		super();
		this.id = id;
		this.parent_id = parent_id;
		this.sort = sort;
		this.name = name;
	}

	public Category() {
		super();
	}

	public Category(int id, int parent_id, int sort, String name, String create_by) {
		super();
		this.id = id;
		this.parent_id = parent_id;
		this.sort = sort;
		this.name = name;
		this.create_by = create_by;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", parent_id=" + parent_id + ", sort=" + sort + ", name=" + name + "]";
	}

}
