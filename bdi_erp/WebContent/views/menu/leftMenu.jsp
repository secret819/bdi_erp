<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
String rPath = request.getContextPath();
String hPath = rPath + "/views/index.jsp?menu=";
%>
<!-- Sidebar -->
		<nav id="sidebar"> 
            <div class="sidebar-header">
                <h3>빅데이터<br>사내 인트라넷</h3>
            </div> 

            <ul class="list-unstyled components">
                <p>메뉴 리스트</p>
                <li id="home">
                    <a href="<%=hPath%>home">홈</a>
                </li>
                <li id="intro">
                    <a href="#">시스템 소개</a>
                </li>
                <li id="list">
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">리스트</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li id="userList">
                            <a href="<%=hPath%>list&smenu=userList">사원 리스트</a>
                        </li>
                        <li>
                            <a href="#">테스트 리스트</a>
                        </li>
                        <li>
                            <a href="#">부서 리스트</a>
                        </li>
                    </ul>
                </li>
                <li id="resume">
                    <a href="#">이력서</a>
                </li>
                <li id="connect">
                    <a href="#">연락처</a>
                </li>
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                    <a href="#" class="download">깃 소스 다운</a>
                </li>
                <li>
                    <a href="#" class="article">깃 리파지토리 이동</a>
                </li>
            </ul>
        </nav>
