<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<div class="container">
<form action="<%=rPath%>/views/userinfo/userInsertOK.jsp" onsubmit="return checkVal()">
	<fieldset>
		<legend>유저 등록</legend>
		<table class="table table-bordered">
			<tr>
				<th>이름</th>
				<td><input type="text" name="uiName"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="date" name="uiBirth" required></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="uiId"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="uiPwd"></td>
			</tr>
			<tr>
				<th>유저설명</th>
				<td><textarea name="uiDesc"></textarea></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" name="uiAge" min="1" max="120"></td>
			</tr>
			<tr>
				<th>부서번호</th>
				<td><input type="number" name="diNo" min="1" max="3"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button>유저등록</button>
				</td>
			</tr>
		</table>
	</fieldset>
</form>
</div>
<script>
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