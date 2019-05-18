package biz.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import util.FD;

@Entity
@Table(name = "t_qu_score")
public class QuScore {
	private int		id;
	@FD("测试")
	private Qu		qu;
	@FD("起始值")
	private int		minscore;
	@FD("最大值")
	private int		maxscore;
	@FD("结果")
	private String	note;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "qu_id")
	public Qu getQu() {
		return qu;
	}

	public void setQu(Qu qu) {
		this.qu = qu;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public int getMinscore() {
		return minscore;
	}

	public int getMaxscore() {
		return maxscore;
	}

	@Column(length = 5000)
	public String getNote() {
		return note;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setMinscore(int minscore) {
		this.minscore = minscore;
	}

	public void setMaxscore(int maxscore) {
		this.maxscore = maxscore;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
