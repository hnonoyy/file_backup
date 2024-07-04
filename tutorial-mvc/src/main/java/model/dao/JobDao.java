package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import oracle.jdbc.datasource.impl.OracleDataSource;
import model.vo.Job;

public class JobDao {
	
	public List<Job> findByJobs() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("hr");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM JOBS");

			ResultSet rs = stmt.executeQuery();
			List<Job> jobs = new ArrayList<>();
			while (rs.next()) {
				Job one = new Job(rs.getString("job_id"), rs.getString("job_title"), rs.getInt("min_salary"),rs.getInt("max_salary"));
				jobs.add(one);
			} 
			
			return jobs;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	
	public Job findByJobId(String jobId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("hr");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM JOBS WHERE JOB_ID = ?");
			stmt.setString(1, jobId);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				// rs.getString("writer_id");
				return new Job(rs.getString("job_id"), rs.getString("job_title"), rs.getInt("max_salary"),
						rs.getInt("min_salary"));
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
