package model.vo;

import java.sql.Date;

public class Employees {
	int employeeId;
	String firstName;
	String lastName;
	String email;
	String phoneNumber;
	Date hireDate;
	String jobId;
	int salary;
	int managerId;
	int departmentId;
	
	public Employees() {
		super();
	}
	
	public Employees(int employeeId, String firstName, String lastName, String email, String phoneNumber, Date hireDate,
			String jobId, int salary, int managerId, int departmentId) {
	
		this.employeeId = employeeId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.hireDate = hireDate;
		this.jobId = jobId;
		this.salary = salary;
		this.managerId = managerId;
		this.departmentId = departmentId;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmail() {
		return email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public String getJobId() {
		return jobId;
	}

	public int getSalary() {
		return salary;
	}

	public int getManagerId() {
		return managerId;
	}

	public int getDepartmentId() {
		return departmentId;
	}
	
	
	
}
