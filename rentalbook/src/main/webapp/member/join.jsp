<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보입력 | 동네도서관</title>
<link rel="icon" href="/favicon.ico" type="image/x-icon"> 
<link rel="stylesheet" href="<%=application.getContextPath()%>/common/style.css"/>
</head>
<body>
   <%@ include file="/common/header.jsp" %>
   <div style="width : 840px; margin: auto;">
      <h3>회원정보입력</h3>
      <div style="text-align: right; margin-bottom: 10px; font-size:0.8rem;"  >
         <span style="color: red;">*</span> 표시가 된 항목은 필수항목입니다.      
      </div>
      <form action="<%=application.getContextPath()%>/member/join-handle.jsp">
         <table style="border-collapse: collapse; width:100%; color: #444;" >
            <tr>
               <td class="tb1" style="border-top-color: gray;"><span style="color: red">*</span>
               아이디</td>
               <td class="tb2" style="border-top-color: gray;">
                  <input type="text" style="padding: 6px 10px; border: inactiveborder;" name="user_id"/>
               </td>
            </tr>
            <tr>
               <td class="tb1"><span style="color: red">*</span>
               비밀번호</td>
               <td class="tb2">
                  <input type="password" style="padding: 6px 10px; border: inactiveborder;" name="password" />
               </td>
            </tr>
            <tr>
               <td class="tb1"><span style="color: red">*</span>
               비밀번호확인</td>
               <td class="tb2">
                  <input type="password" style="padding: 6px 10px ; border: inactiveborder;" name="password_check"/>
               </td>
            </tr>
            <tr>
               <td class="tb1"><span style="color: red">*</span>
               닉네임</td>
               <td class="tb2">
                  <input type="text" style="padding: 6px 10px; border: inactiveborder;" name="nickname"/>
               </td>
            </tr>
            <tr>
               <td class="tb1" style="border-bottom-color: gray;"><span style="color: red">*</span>
               성별</td>
               <td class="tb2" style="border-bottom-color: gray;">
                  <input type="radio" style="padding: 6px 10px" id="radio-m" name="gender" value="남" checked="checked"/>
                     <label for="radio-m">남</label>
                  <input type="radio" style="padding: 6px 10px" id="radio-f" name="gender" value="여"/>
                     <label for="radio-f">여</label>
               </td>
            </tr>
         </table>
         <div style="text-align: center; margin-top: 10px" class="no-deco-link">
            <button type="submit" class="bt bt2">회원가입</button>
            <button type="reset" class="bt bt2">취소</button>
         </div>
      </form>
   </div>
</body>
</html>