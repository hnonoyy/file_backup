<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job</title>
</head>
<body>
	<h3>JOBS</h3>
	<table style=" text-align: center; padding: 10px">
		<thead>
			<tr>
				<th>직업명</th>
				<th>직업아이디</th>
				<th>최소연봉</th>
				<th>최대연봉</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="one" items="${jobs }">
				<c:url var="link" value="/hr/employees">
					<c:param name="jobId" value="${one.jobId }" />
				</c:url>
				
			<tr>
				<td style="padding: 10px"><a href="${link }" style="text-decoration: none;">${one.jobTitle }</a></td>
				<td style="padding: 10px">${one.jobId }</td>
				<td style="padding: 10px 20px 10px 10px;">${one.minSalary }</td>
				<td style="padding: 10px">${one.maxSalary }</td>
			</tr>
			</c:forEach>
		</tbody>			
	</table>
</body>
</html>