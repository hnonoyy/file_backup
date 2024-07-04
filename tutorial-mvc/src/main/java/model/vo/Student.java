package model.vo;

public class Student {
	String bn;
	String name;
	String major;
	int age;

	public Student() {
		super();
	}

	public Student(String bn, String name, String major, int age) {
		super();
		this.bn = bn;
		this.name = name;
		this.major = major;
		this.age = age;
	}

	public String getBn() {
		return bn;
	}

	public void setBn(String bn) {
		this.bn = bn;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}
