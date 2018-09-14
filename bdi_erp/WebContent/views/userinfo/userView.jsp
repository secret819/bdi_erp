<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.erp.common.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<div class="container">
<%
String uiName = "";
String uiId = "";
String uiDesc = "";
int uiNo = Integer.parseInt(request.getParameter("uiNo"));
int uiAge = 0;
int diNo = 0;

Connection con = DBConnection.getCon();
String sql = "select uiName, uiId, uiDesc, uiNo, uiAge,"; 
sql += " diNo from user_info";
sql += " where uiNo=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1,uiNo);
ResultSet rs = ps.executeQuery();
if(rs.next()){
	uiName = rs.getString("uiName");
	uiId = rs.getString("uiId");
	uiDesc = rs.getString("uiDesc");
	uiAge = rs.getInt("uiAge");
	diNo = rs.getInt("diNo");
}
%>
<form action="<%=rPath%>/views/userinfo/userUpdateOK.jsp" onsubmit="return checkVal()">
	<fieldset>
		<legend>유저 수정</legend>
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<td><%=uiNo%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="uiName" value="<%=uiName%>"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="uiId" value="<%=uiId%>"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="uiPwd"></td>
			</tr>
			<tr>
				<th>유저설명</th>
				<td><textarea name="uiDesc"><%=uiDesc%></textarea></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" name="uiAge" min="1" max="120" value="<%=uiAge%>"></td>
			</tr>
			<tr>
				<th>부서번호</th>
				<td><input type="number" name="diNo" min="1" max="3" value="<%=diNo%>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button>수정</button>
					<button type="button" onclick="deleteUser()">삭제</button>
				</td>
			</tr>
		</table>
	</fieldset>
	<input type="hidden" name="uiNo" value="<%=uiNo%>">
</form>
</div>
<script>
	function deleteUser(){
		if(confirm("삭제하시겠습니까?")){
			location.href="<%=rPath%>/views/userinfo/userDeleteOK.jsp?uiNo=<%=uiNo%>";
		}
	}
	function checkVal(){
		var objs = document.querySelectorAll('input');
		for(var i=0;i<objs.length;i++){
			if(objs[i].type!="number"){
				if(objs[i].value.length<1 || objs[i].value.length>=30){
					alert(objs[i].name + "의 값을 확인해주세요.")
					objs[i].focus();
					return false;
				}
			}else{
				if(objs[i].value<1){
					alert(objs[i].name + "의 값을 확인해주세요.")
					objs[i].focus();
					return false;
				}
			}
		}
		var obj = document.querySelector('textarea');
		if(obj.value.length>=2000){
			alert("유저설명은 2000자이상일 수 없습니다.");
			obj.focus();
			return false;
		}
		return true;
	}
</script>
</body>
</html>