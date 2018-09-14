<%@page import="com.bdi.erp.common.DBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
String uiNo = request.getParameter("uiNo");

Connection con = DBConnection.getCon();
String sql = "delete from user_info where uiNo=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,uiNo);
int cnt = ps.executeUpdate();
DBConnection.close();
if(cnt==1){
%>
<script>
	alert("유저삭제가 정상적으로 이루어졌습니다.");
	location.href="<%=rPath%>/views/userinfo/userList.jsp";
</script>
<%
}
%>

