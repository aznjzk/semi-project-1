<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   table,td,th {border: 1px solid #000000; border-collapse: collapse;}
</style>
</head>
<body>
	<!-- 로그인 폼 -->
	<div>
		<form action="<%=request.getContextPath()%>/id/loginAction.jsp" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="lastPw"></td>
				</tr>
			</table>
			<button type="submit">로그인</button>
		</form>
	
	</div>

</body>
</html>