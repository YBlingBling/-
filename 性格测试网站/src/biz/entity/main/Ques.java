package biz.entity.main;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "t_ques")
public class Ques {
	private int id;
	private QuesType quesType;
	private String title;
	private String checkType;//多选,单选

	@Transient
	public String getCheckTypeString(){
		if("多选".equals(checkType)){
			return "checkbox";
		}else{
			return "radio";
		}
	}
	
	public String getCheckType() {
		return checkType;
	}

	public void setCheckType(String checkType) {
		this.checkType = checkType;
	}

	private List<QuesItem> itemList = null;

	@Transient
	public List<QuesItem> getItemList() {
		return itemList;
	}

	public void setItemList(List<QuesItem> itemList) {
		this.itemList = itemList;
	}

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
	@JoinColumn(name = "type_id")
	public QuesType getQuesType() {
		return quesType;
	}

	public void setQuesType(QuesType quesType) {
		this.quesType = quesType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
