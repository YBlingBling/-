package biz.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import util.FD;

@Entity
@Table(name = "t_qu")
public class Qu {
	private int		id;
	@FD("主题")
	private String	title;
	@FD("图片")
	private String	imgFile;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getImgFile() {
		return imgFile;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}

}
