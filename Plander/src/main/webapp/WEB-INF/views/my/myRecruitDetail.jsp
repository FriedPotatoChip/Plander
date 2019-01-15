<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
</head>
<body>
	<button type="button" class="btn m-3"
		style="background-color: #475C7A; color: white;"
		onclick="history.back(-1);">뒤로가기</button>
	${vo }
</body>
</html>