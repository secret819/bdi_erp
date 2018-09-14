<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.erp.common.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<style>
	tr,th{text-align:center}
</style>
<body>
<div class="container">
	<h4>유저리스트</h4>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)"></th>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>사원설명</th>
				<th>나이</th>
				<th>부서번호</th>
			</tr>
		</thead>
		<tbody>
<%
Connection con = DBConnection.getCon();
String sql = "select uiNo, uiName, uiId, uiDesc, uiAge, diNo";
sql += " from user_info";

PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>	
			<tr>
				<td>
					<input type="checkbox" name="delChk" value="<%=rs.getInt("uiNo")%>">
				</td>
				<td>
					<a href="<%=rPath%>/views/userinfo/userView.jsp?uiNo=<%=rs.getInt("uiNo")%>">
					<%=rs.getInt("uiNo")%>
					</a>
				</td>
				<td><%=rs.getString("uiName")%></td>
				<td><%=rs.getString("uiId")%></td>
				<td><%=rs.getString("uiDesc")%></td>
				<td><%=rs.getInt("uiAge")%></td>
				<td><%=rs.getInt("diNo")%></td>
			</tr>
<%
}
rs.close();
ps.close();
DBConnection.close();
%>		
		</tbody>
	</table>
	<div class="cust-button-div">
		<button type="button">사원등록</button>
		<button type="button">사원삭제</button>
	</div>
</div>
<script>
	function checkAll(obj){
		var objs = document.querySelectorAll('input[name=delChk]');
		for(var i=0;i<objs.length;i++){
			objs[i].checked = obj.checked;
		}
	}
</script>
