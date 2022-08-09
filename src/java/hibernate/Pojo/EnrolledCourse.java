package hibernate.Pojo;
import java.util.Date;

import javax.persistence.*;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table
public class EnrolledCourse {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "enrolled_id")
	private int eid;
	
	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
	
	@ManyToOne
	@JoinColumn(name="course_id")
	private AvailableCourse course;
	
	@CreationTimestamp
	@Column(name = "startTime", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
	
	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public AvailableCourse getCourse() {
		return course;
	}

	public void setCourse(AvailableCourse course) {
		this.course = course;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}


}
