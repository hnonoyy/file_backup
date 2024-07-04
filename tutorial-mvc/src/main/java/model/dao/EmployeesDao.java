package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.vo.Employees;
import oracle.jdbc.datasource.impl.OracleDataSource;

public class EmployeesDao {

	public List<Employees> findAll() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("hr");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM EMPLOYEES");
			ResultSet rs = stmt.executeQuery();
			
			List<Employees> employees = new ArrayList<>();
			
			while(rs.next()){
				Employees one = new Employees(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7),rs.getInt(8),rs.getInt(9),rs.getInt(10));
				employees.add(one);
			}
			return employees;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public List<Employees> findByJobId(String jobId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("hr");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM EMPLOYEES WHERE JOB_ID=?");
			stmt.setString(1, jobId);
			ResultSet rs = stmt.executeQuery();
			
			List<Employees> employees = new ArrayList<>();
			while(rs.next()){
				Employees one = new Employees(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7),rs.getInt(8),rs.getInt(9),rs.getInt(10));
				employees.add(one);
			}
			return employees;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
