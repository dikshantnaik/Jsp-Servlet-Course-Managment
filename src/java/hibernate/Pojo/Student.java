package hibernate.Pojo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



@Entity
public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int studentid;
	
	@Column(unique = true,length = 50)
	private String username;
	@Column(length = 50)
	private String student_name;
	@Column(length = 50)
	private String college_course;
	@Column(length = 300)
	private String password;
	
	public int getStudentid() {
	    return studentid;
	}
	public void setStudentid(int studentid) {
	    this.studentid = studentid;
	}
	public String getUsername() {
	    return username;
	}
	public void setUsername(String username) {
	    this.username = username;
	}
	public String getStudent_name() {
	    return student_name;
	}
	public void setStudent_name(String student_name) {
	    this.student_name = student_name;
	}
	public String getCollege_course() {
	    return college_course;
	}
	public void setCollege_course(String college_course) {
	    this.college_course = college_course;
	}
	public String getPassword() {
	    return password;
	}
	public void setPassword(String password) {
	    this.password = password;
	}


	
	
}