<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
String uiName = request.getParameter("uiName");
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");
String uiDesc = request.getParameter("uiDesc");
String uiAge = request.getParameter("uiAge");
String diNo = request.getParameter("diNo");

String driver = "org.mariadb.jdbc.Driver";
String url = "jdbc:mariadb://localhost:3306/bdi";
String id = "bdi";
String pwd = "bditest";

Class.forName(driver);
Connection con = DriverManager.getConnection(url,id,pwd);
String sql = "insert into user_info(uiName, uiId, uiPwd, uiDesc, uiAge, diNo) values(?,?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,uiName);
ps.setString(2,uiId);
ps.setString(3,uiPwd);
ps.setString(4,uiDesc);
ps.setString(5,uiAge);
ps.setString(6,diNo);
int cnt = ps.executeUpdate();
if(cnt==1){
%>
<script>
	alert("유저등록이 정상적으로 이루어졌습니다.");
	location.href="<%=rPath%>/views/userinfo/userList.jsp";
</script>
<%
}
%>