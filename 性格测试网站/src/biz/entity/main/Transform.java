package biz.entity.main;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_transform")
public class Transform {
	private int id;
	private Personality personality1;
	private Personality personality2;

	private String note;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "p1_id")
	public Personality getPersonality1() {
		return personality1;
	}

	public void setPersonality1(Personality personality1) {
		this.personality1 = personality1;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "p2_id")
	public Personality getPersonality2() {
		return personality2;
	}

	public void setPersonality2(Personality personality2) {
		this.personality2 = personality2;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
