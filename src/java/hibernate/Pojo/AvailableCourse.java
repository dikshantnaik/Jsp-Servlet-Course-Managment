package hibernate.Pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AvailableCourse {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cid;

	private String course_name;
	private int course_price;
	private String course_discription;
	private String offerdBy;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public int getCourse_price() {
		return course_price;
	}
	public void setCourse_price(int course_price) {
		this.course_price = course_price;
	}
	public String getCourse_discription() {
		return course_discription;
	}
	public void setCourse_discription(String course_discription) {
		this.course_discription = course_discription;
	}
	public String getOfferdBy() {
		return offerdBy;
	}
	public void setOfferdBy(String offerdBy) {
		this.offerdBy = offerdBy;
	}
	

}
