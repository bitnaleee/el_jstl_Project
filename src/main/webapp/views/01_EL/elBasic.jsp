<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.br.model.vo.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>1. 기존에 했던대로 스크립틀릿과 표현식을 이용해서 각 Scope에 담겨있는 값 뽑아서 화면에 출력</h3>
	
	<%
		String cRoom = (String)request.getAttribute("classRoom");
		Person stu = (Person)request.getAttribute("student");
		
		String aca = (String)session.getAttribute("academy");
		Person tea = (Person)session.getAttribute("teacher");
	%>

	<p>
		학원명 : <%= aca %> <br>
		강의장 : <%= cRoom %> <br>
		강사 : <%= tea.getName() %>, <%= tea.getAge() %>, <%= tea.getGender() %>
		<br><br>
		
		수강생 정보
		<ul>
			<li>이름 : <%=stu.getName() %></li>
			<li>나이 : <%=stu.getAge() %></li>
			<li>성별 : <%=stu.getGender() %></li>
		</ul>
	</p>
	
	<h3>2. EL을 이용해서 보다 쉽게 해당 Scope에 저장된 값들 출력하기</h3>
	<p>
		EL구문내에 attribute의 키값만 제시하면 어떤 scope영역이든 attribute값에 접근 가능 <br>
		기본적으로 JSP내장객체를 구분하지 않고 자동으로 모든 내장객체에 탐색해서 값을 가져옴
	</p>
	
	<p>
		학원명 : ${ academy } <br>
		강의장 : ${ classRoom } <br>
		강사 : ${ teacher.name }, ${ teacher.age }, ${ teacher.gender }  <!-- teacher라는 키값 Person객체에 접근.필드명(name) -->
		<br><br>
		
		수강생 정보
		<ul>
			<li>이름 : ${ student.name }</li>
			<li>나이 : ${ student.age }</li>
			<li>성별 : ${ student.gender }</li>
		</ul>
		
		<!-- 
			EL로 attribute접근했을 때 vo객체일 경우 필드에 담긴 값이 필요하다면 .필드명 으로 접근하면 됨.
			=> 내부적으로 해당 필드의 getter메소드 찾아서 실행됨 즉, getter메소드 항상 필수적으로 만들어두셔야됨!
		 -->
		
	</p>
	
	<h3>3. 각 Scope영역에 동일한 키값으로 저장된게 있을 경우</h3>
			scope값 : ${ scope } <br> <!-- request -->
			<!--  
				EL은 공유범위가 제일 작은 Scope에서부터 해당 키값을 탐색함
				page => request => session => application
			 -->
			test값 : ${ test } <br> 
			<!-- 없는 키값을 적었을 때 오류X 아무것도 출력X-->
		
		  <h3>4. 직접 Scope를 지정해서 접근하기</h3>
			<% pageContext.setAttribute("scope", "page"); %>
			<!-- 지금 모든 영역에 scope 키값이 담겨있음 -->
			
			pageScope에 담긴 값 : ${ scope } 또는 ${ pageScope.scope } <br> <!-- page -->
			requestScope에 담긴 값 : ${ requestScope.scope } <br> <!-- request -->
			sessionScope에 담긴 값 : ${ sessionScope.scope } <br> <!-- session -->
			applicationScope에 담긴 값 : ${ applicationScope.scope } <br> <!-- application -->
		
		    잘못된 접근 예시(session에 classRoom) : ${sessionScope.classRoom } <!-- 출력X -->
			<!-- 오류X 아무것도 출력X -->
	
	
</body>
</html>