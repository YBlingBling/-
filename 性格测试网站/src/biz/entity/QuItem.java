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
@Table(name = "t_qu_item")
public class QuItem {
	private int		id;
	@FD("测试")
	private Qu		qu;
	@FD("问题")
	private String	title;
	@FD("答案1")
	private String	option1;
	@FD("答案1分值")
	private int		score1;
	@FD("答案2")
	private String	option2;
	@FD("答案2分值")
	private int		score2;
	@FD("答案3")
	private String	option3;
	@FD("答案3分值")
	private int		score3;
	@FD("答案4")
	private String	option4;
	@FD("答案4分值")
	private int		score4;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "qu_id")
	public Qu getQu() {
		return qu;
	}

	public String getTitle() {
		return title;
	}

	public String getOption1() {
		return option1;
	}

	public int getScore1() {
		return score1;
	}

	public String getOption2() {
		return option2;
	}

	public int getScore2() {
		return score2;
	}

	public String getOption3() {
		return option3;
	}

	public int getScore3() {
		return score3;
	}

	public String getOption4() {
		return option4;
	}

	public int getScore4() {
		return score4;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setQu(Qu qu) {
		this.qu = qu;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public void setScore1(int score1) {
		this.score1 = score1;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public void setScore2(int score2) {
		this.score2 = score2;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public void setScore3(int score3) {
		this.score3 = score3;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public void setScore4(int score4) {
		this.score4 = score4;
	}

}
