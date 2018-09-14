<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<style>
	.left{
		background-color:rgba(255,0,0,0.3);
		width:45%;
		float:left;
	}
	.right{
		background-color:rgba(0,0,255,0.3);
		width:45%;
		float:right;
	}
</style>
<body>
<%
String url = request.getParameter("page");
if(url==null){
	url = "r1.jsp";
}
url = "/test/" +url;
%>
	<div class="container">
		<div class="left">
			<jsp:include page="/test/left.jsp"/>
		</div>
		<div class="right">
			<jsp:include page="<%=url%>"/>
		</div>
	</div>
</body>
</html>