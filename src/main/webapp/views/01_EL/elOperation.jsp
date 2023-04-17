<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>EL에서의 연산자</h1>
	
	<h3>1. 산술연산자</h3>
	기존방식(el안쓰는경우) : <%=(int)request.getAttribute("big") + (int)request.getAttribute("small") %>
	<br><br>
	
	el방식 : <br>
	10 + 3 = ${ big + small } <br> <!-- 13 -->
    10 - 3 = ${ big - small } <br> <!-- 7 -->
	10 x 3 = ${ big * small } <br> <!-- 30 -->
	10 / 3 = ${ big / small } 또는 ${ big div small } <br> <!-- 3.333... -->
    10 % 3 = ${ big % small } 또는 ${ big mod small } <br><br> <!-- 1 -->
    
	<b>* 단 유의사항 : 문자열을 연이어주고자 할 때 + 연산 사용불가</b>
	<%-- ${ sOne + sTwo } --%> <br>
	<!-- 500에러 (NumberFormatException(주로Parsing할때))-->
	>> 산술연산시 무조건 숫자로 파싱한 후 연산을 하기 때문에 문자열간의 덧셈연산 불가
       문자열을 연이어서 출력하고자 할 경우 : ${ sOne }${ sTwo }
    
    <h3>2. 대소비교 연산자</h3>
	10이 3보다 크냐 : ${ big > small } 또는 ${ big gt small } <br> <!-- true -->
	10이 3보다 작냐 : ${ big < small } 또는 ${ big lt small } <br> <!-- false -->
	10이 3보다 크거나같냐 : ${ big >= small } 또는 ${ big ge small } <br> <!-- true -->
	10이 3보다 작거나같냐 : ${ big <= small } 또는 ${ big le small } <br> <!-- false -->
	
	<h3>3. 동등비교 연산자</h3>
	<!-- EL에서의 == 비교는 자바에서의 equals()와 같은 동작을 함 -->
	sOne과 sTwo가 일치합니까 : ${ sOne == sTwo } 또는 ${ sOne eq sTwo } <br> <!-- false -->
	sOne과 sTwo가 일치하지 않습니까 : ${ sOne != sTwo } 또는 ${ sOne ne sTwo } <br> <!-- true -->

	big에 담긴 값이 10과 일치합니까 : ${ big == 10 } 또는 ${ big eq 10 } <br> <!-- true -->
	sOne에 담긴 값이 "안녕"과 일치합니까 : ${ sOne == "안녕" } 또는 ${ sOne eq '안녕' } <br><br> <!-- true -->
	<!-- EL안에서 문자열 리터럴 제시시 "",'' 둘 다 가능 -->
    
    <h4>4. 객체가 null인지 또는 리스트가 비어있는지 비교연산자</h4>
	pTwo가 null입니까 : ${ pTwo == null } 또는 ${ empty pTwo } <br> <!-- true -->
  	pOne이 null입니까 : ${ pOne == null } 또는 ${ empty pOne } <br> <!-- false -->
	pOne이 null이 아닙니까 : ${ pOne != null } 또는 ${ not empty pOne } <br> <!-- true -->

  	lOne이 텅비어있습니까 : ${ empty lOne } <br> <!-- true -->
	lTwo가 텅비어있습니까 : ${ empty lTwo } <br><br> <!-- false -->
	
	<h3>5. 논리연산자</h3>
	${ true && true } 또는 ${ true and true } <br> <!-- true -->
	${ true || true } 또는 ${ true or true } <br> <!-- true -->
	
	big이 small보다 크고 lOne이 텅 비어있습니까 : ${ big gt small and empty lOne }
	
	
</body>
</html>