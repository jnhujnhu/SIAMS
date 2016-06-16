package SEPJ.Helper;

public class Course {
	String cid;
	String course_name;
	String course_time;
	String teachers;
	String class_room;
	String type;
	String introduction;
	Course(int uid){}
	public void set_cid(String new_cid){
		cid=new_cid;
	}
	public String get_cid(){
		return cid;
	}
	public void set_course_name(String new_course_name){
		course_name=new_course_name;
	}
	public String get_course_name(){
		return course_name;
	}
	public void set_course_time(String new_course_time){
		course_time=new_course_time;
	}
	public String get_course_time(){
		return course_time;
	}
	public void set_teachers(String new_teachers){
		teachers=new_teachers;
	}
	public String get_teachers(){
		return teachers;
	}
	public void set_class_room(String new_class_room){
		class_room=new_class_room;
	}
	public String get_class_room(){
		return class_room;
	}
	public void set_type(String new_type){
		type=new_type;
	}
	public String get_type(){
		return type;
	}
	public void set_introduction(String new_introduction){
		introduction=new_introduction;
	}
	public String get_introduction(){
		return introduction;
	}
	
}
