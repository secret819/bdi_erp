<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.erp.conection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
String uiNo = request.getParameter("uiNo");

Connection con = DBConnection.getCon();
String sql = "delete from user_info where uiNo=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,uiNo);
ps.executeUpdate();
DBConnection.close();
%>

<script>
	alert("유저삭제가 정상적으로 이루어졌습니다.");
	location.href="<%=rPath%>/views/userinfo/userList.jsp";
</script>