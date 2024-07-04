<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상호작용</title>
</head>
<body>
	<h2>사용자와 웹 앱간의 상호작용</h2>
	<p>
		사용자로부터 요청이 발생했을 때, 같이 전달된 데이터들은 request 객체를 이용해서 얻을 수 있고 
		이걸 토대로 요청을 분석해서 적절한 응답을 보내줄 수 있는 페이지 구축이 가능하다.
	</p>
	<p>
		웹 앱 개발을 할 떄는 데이터 처리 페이지만 만들어두면 사용자가 이 웹앱을 쓰는데 잇어 불편함을 느낄 수 밖에 없다.
	</p>
	<p>
		사용자 서버측에서 제공하는 웹과 상호작용을 편하게 하려면 사용자용 화면도 구현을 해야한다.
		이 화면을 구현하는데 사용되는 태그가 a 태그와 form 태그다.
	</p>
	<h4> a(anchor) 태그</h4>
	<p>
		링크를 만들어내는 태그로 사용자가 우리측의 웹 페이지를 쉽게 이동할 수 있게 해줌으로써 
		사용자 경험을 향상시켜주는 중요한 태그이다.
	</p>
	<p>
		추천 검색어 <a href="./search-result.jsp?subject=page">페이지</a>
		<a href="./search-result.jsp?subject=include">인클르드</a>
		<a href="./search-result.jsp?subject=taglib">태그립</a> 
	</p>
	<h4>form(form) 태그</h4>
	<p>
		form 태그는 사용자가 입력한 데이터를 서버로 전송하는 기능을 갖고 있는 아주 중요한 기능이다.
	</p>
	<form action="./search-result.jsp" >
		<p>
			입력 : <input type="text" name="subject" required="required"/> 
			<input type="password" name="mode"/>	
			<select name="os">
				<option>window</option>
				<option>mac</option>
				<option>linux</option>
			</select>
		</p>
			<button type="submit">submit</button>
			<button type="reset">reset</button>
			<button type="button" onclick="window.confirm('오키도키?')">button</button>
	</form>
	<p>
		form 태그에는 action 설정이 들어가야 한다. action으로 설정한 곳으로 데이터가 전송된다.
		form 태그 자체는 전송기능만 있기 때문에 입력용 태그를 form 태그 소속으로 작성해두어야 한다.
		입력용 태그는 종류가 꽤 많음(w3shool 참조)
		입력용 태그에는 name이 설정되어야한다.(네임에 설정한 이름으로 데이터를 넘겨줌)
	</p>
</body>
</html>