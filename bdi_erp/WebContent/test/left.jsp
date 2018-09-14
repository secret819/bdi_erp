<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String p = request.getParameter("page");
if(p==null){
	p="";
}
%>
<select id="changeMenu" onchange="chMenu(this)">
	<option value="">선택</option>
	<option value="r1.jsp" <%=p.equals("r1.jsp")?"selected":""%>>r1</option>
	<option value="r2.jsp" <%=p.equals("r2.jsp")?"selected":""%>>r2</option>
	<option value="r3.jsp" <%=p.equals("r3.jsp")?"selected":""%>>r3</option>
</select>
<script>
	function chMenu(obj){
		if(obj.value!=""){
			location.href="/test/select.jsp?page=" + obj.value;	
		}
	}
</script>