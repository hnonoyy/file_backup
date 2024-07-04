<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees</title>
</head>
<body>
	<h3>Employees</h3>
	<table style="text-align: center; padding: 10px">
		<thead>
			<tr>
				<td>직원번호</td>
				<td>이름</td>
				<td>성</td>
				<td>e-mail</td>
				<td>핸드폰번호</td>
				<td>입사날짜</td>
				<td>직업아이디</td>
				<td>연봉</td>
				<td>관리자 아이디</td>
				<td>부서아이디</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="one" items="${employees }">
			<tr>
				<td style="padding: 10px">${one.employeeId }</td>
				<td style="padding: 10px">${one.firstName }</td>
				<td style="padding: 10px">${one.lastName }</td>
				<td style="padding: 10px">${one.email }</td>
				<td style="padding: 10px">${one.phoneNumber }</td>
				<td style="padding: 10px">${one.hireDate }</td>
				<td style="padding: 10px">${one.jobId }</td>
				<td style="padding: 10px">${one.salary }</td>
				<td style="padding: 10px">${one.managerId } </td>
				<td style="padding: 10px">${one.departmentId }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>