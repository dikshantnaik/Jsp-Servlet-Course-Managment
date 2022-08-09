package hibernate.Pojo;

import javax.persistence.*;

@Entity
public class Reviews {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private AvailableCourse course;

    @Column(name = "student_revive")
    private String studentReview;

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
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

    public String getStudentReview() {
	return studentReview;
    }

    public void setStudentReview(String studentReview) {
	this.studentReview = studentReview;
    }

}
