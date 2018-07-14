package ga.beauty.reset.dao.entity;

import java.sql.Date;

public class Event_Vo {
	private int eve_no;
	String img;
	String title;
	String con;
	String tags;
	Date nalja;
	int pop;
	int view;
	
	public Event_Vo() {
	}

	public Event_Vo(int eve_no, String img, String title, String con, String tags, Date nalja, int pop, int view) {
		super();
		this.eve_no = eve_no;
		this.img = img;
		this.title = title;
		this.con = con;
		this.tags = tags;
		this.nalja = nalja;
		this.pop = pop;
		this.view = view;
	}

	public int getEve_no() {
		return eve_no;
	}

	public void setEve_no(int eve_no) {
		this.eve_no = eve_no;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCon() {
		return con;
	}

	public void setCon(String con) {
		this.con = con;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public Date getNalja() {
		return nalja;
	}

	public void setNalja(Date nalja) {
		this.nalja = nalja;
	}

	public int getPop() {
		return pop;
	}

	public void setPop(int pop) {
		this.pop = pop;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	@Override
	public String toString() {
		return "EventVo [eve_no=" + eve_no + ", img=" + img + ", title=" + title + ", con=" + con + ", tags=" + tags
				+ ", nalja=" + nalja + ", pop=" + pop + ", view=" + view + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((con == null) ? 0 : con.hashCode());
		result = prime * result + eve_no;
		result = prime * result + ((img == null) ? 0 : img.hashCode());
		result = prime * result + pop;
		result = prime * result + ((tags == null) ? 0 : tags.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + view;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Event_Vo other = (Event_Vo) obj;
		if (con == null) {
			if (other.con != null)
				return false;
		} else if (!con.equals(other.con))
			return false;
		if (eve_no != other.eve_no)
			return false;
		if (img == null) {
			if (other.img != null)
				return false;
		} else if (!img.equals(other.img))
			return false;
		if (pop != other.pop)
			return false;
		if (tags == null) {
			if (other.tags != null)
				return false;
		} else if (!tags.equals(other.tags))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (view != other.view)
			return false;
		return true;
	}
	
	
	
	
}
