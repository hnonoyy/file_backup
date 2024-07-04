package model.vo;

public class Job {
	String jobId;
	String jobTitle;
	int minSalary;
	int maxSalary;
	
	public Job() {
		super();
	}

	public Job(String jobId, String jobTitle, int minSalary, int maxSalary) {
		super();
		this.jobId = jobId;
		this.jobTitle = jobTitle;
		this.minSalary = minSalary;
		this.maxSalary = maxSalary;
	}
	public String getJobId() {
		return jobId;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public int getMinSalary() {
		return minSalary;
	}
	public int getMaxSalary() {
		return maxSalary;
	}
	
	
}
