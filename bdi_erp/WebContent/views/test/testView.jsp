<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.erp.conection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<div class="container">
<%
String tId = "";
String tBirth = "";
String tContent = "";
int tNo = Integer.parseInt(request.getParameter("tNo"));

Connection con = DBConnection.getCon();
String sql = "select tId, tBirth, tContent from Test where tNo=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1,tNo);
ResultSet rs = ps.executeQuery();
if(rs.next()){
	tId = rs.getString("tId");
	tBirth = rs.getString("tBirth");
	tContent = rs.getString("tContent");
}
%>
<form action="<%=rPath%>/views/test/testUpdateOK.jsp" onsubmit="return checkVal1()">
	<fieldset>
		<legend>유저 수정</legend>
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<td><%=tNo%></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="tId" value="<%=tId%>"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="tPwd"></td>
			</tr>
			<tr>
				<th>유저설명</th>
				<td><textarea name="tContent"><%=tContent%></textarea></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="tBirth" value="<%=tBirth%>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button>수정</button>
					<button type="button" onclick="deleteTest()">삭제</button>
			</tr>
		</table>
	</fieldset>
	<input type="hidden" name="uiNo" value="<%=tNo%>">
</form>
</div>
<script>
	function deleteTest(){
		if(confirm("삭제하시겠습니까?")){
			location.href="<%=rPath%>/views/test/testDeleteOK.jsp?uiNo=<%=tNo%>";
		}
	}
	function checkVal1(){
		var objs = document.querySelectorAll('input');
		for(var i=0;i<objs.length;i++){
			if(objs[i].type!="number"){
				if(objs[i].value.length<1 || objs[i].value.length>=30){
					alert(objs[i].name + "의 값을 확인해주세요.");
					objs[i].focus();
					return false;
				}
			}else{
				if(objs[i].value<1){
					alert(objs[i].name + "의 값을 확인해주세요.");
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