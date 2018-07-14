package ga.beauty.reset.dao.entity;

import java.sql.Date;

public class Magazine_Vo {
	private int mag_no;
	private String img;
	private String title;
	private String con;
	private int cate;
	private String tags;
	private String writer;
	private Date nalja;
	private int pop;
	private int view;
	
	public Magazine_Vo() {
	}

	public Magazine_Vo(int mag_no, String img, String title, String con, int cate, String tags, String writer,
			Date nalja, int pop, int view) {
		super();
		this.mag_no = mag_no;
		this.img = img;
		this.title = title;
		this.con = con;
		this.cate = cate;
		this.tags = tags;
		this.writer = writer;
		this.nalja = nalja;
		this.pop = pop;
		this.view = view;
	}

	public int getMag_no() {
		return mag_no;
	}

	public void setMag_no(int mag_no) {
		this.mag_no = mag_no;
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

	public int getCate() {
		return cate;
	}

	public void setCate(int cate) {
		this.cate = cate;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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
		return "MagazineVo [mag_no=" + mag_no + ", img=" + img + ", title=" + title + ", con=" + con + ", cate=" + cate
				+ ", tags=" + tags + ", writer=" + writer + ", nalja=" + nalja + ", pop=" + pop + ", view=" + view
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cate;
		result = prime * result + ((con == null) ? 0 : con.hashCode());
		result = prime * result + ((img == null) ? 0 : img.hashCode());
		result = prime * result + mag_no;
		result = prime * result + pop;
		result = prime * result + ((tags == null) ? 0 : tags.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + view;
		result = prime * result + ((writer == null) ? 0 : writer.hashCode());
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
		Magazine_Vo other = (Magazine_Vo) obj;
		if (cate != other.cate)
			return false;
		if (con == null) {
			if (other.con != null)
				return false;
		} else if (!con.equals(other.con))
			return false;
		if (img == null) {
			if (other.img != null)
				return false;
		} else if (!img.equals(other.img))
			return false;
		if (mag_no != other.mag_no)
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
		if (writer == null) {
			if (other.writer != null)
				return false;
		} else if (!writer.equals(other.writer))
			return false;
		return true;
	}
	
	
}
