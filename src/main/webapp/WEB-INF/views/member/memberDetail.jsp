<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.mysquare.dto.Member"%>
<%@ page import="kr.co.mysquare.dto.Following"%>
<%@ page import="kr.co.mysquare.dto.Review"%>
<%@ page import="kr.co.mysquare.dto.Bookmark"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="import/LoginForm/js/jquery.validate.js"></script>
<img src = "image/header/menu0.png">

<!-- MENU ------------------->
<link rel="stylesheet" type="text/css" href="import/CSS3ContentTabs/css/demo.css" />
<link rel="stylesheet" type="text/css" href="import/CSS3ContentTabs/css/style4.css" />
<script type="text/javascript" src="import/CSS3ContentTabs/js/modernizr.custom.04022.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300,300italic' rel='stylesheet' type='text/css'>
<!-- --------------------- -->

<!-- add -->
 <!--     <link rel="stylesheet" type="text/css" href="import/AnimatedButtons/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="import/AnimatedButtons/css/style6.css" />
        <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
        <link href='http://fonts.googleapis.com/css?family=Arvo:400,700' rel='stylesheet' type='text/css' /> -->
 <!--  -->
	              <%--       		            	 <!-- 친구추가버튼 -->
				<c:if test="${(sessionScope.id != null && sessionScope.id != detailMember.id )}">
					<div class="button-wrapper" >
						<c:if test="${isFollowerId == 0}">
							<a href="follow.htm?followingId=${detailMember.id }" class="a-btn">
								<button class="follow">Follow</button>
							</a>
						</c:if>
						<c:if test="${isFollowerId == 1}">
							<a href="unfollow.htm?followingId=${detailMember.id }" class="a-btn">
								<button class="follow">UnFollow</button>
							</a>
						</c:if>
					</div>
				</c:if> <!-- id가 null이 아니고, detail페이지와 로그인사용자가 동일인물이 아닐 때 -->
						 --%>
<section class="tabs">
	            <input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked" />
		        <label for="tab-1" class="tab-label-1">개인정보</label>
		
	            <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
		        <label for="tab-2" class="tab-label-2">즐겨찾기</label>
		
	            <input id="tab-3" type="radio" name="radio-set" class="tab-selector-3" />
		        <label for="tab-3" class="tab-label-3">팔로워목록</label>
			
	            <input id="tab-4" type="radio" name="radio-set" class="tab-selector-4" />
		        <label for="tab-4" class="tab-label-4">작성한 글</label>
            	
			    <div class="clear-shadow"></div>
				
		        <div class="content">
			        <div class="content-1">
						<h2>${detailMember.name}님의 회원정보</h2>
						<p>
							아이디 : ${detailMember.id }
						</p> <br>
						<p>
							이메일 : ${detailMember.email}
						</p> <br>
						<p>	
							성별 : ${detailMember.sex }
						</p> <br>
						<p>
							지역 : ${detailMember.place }
						</p> <br>
						<p>
							<c:if test="${sessionScope.id == detailMember.id}">
                           		<a href="memberEdit.htm?id=${sessionScope.id}">
                           			<button class="follow">정보 수정</button>
                           		</a>&nbsp &nbsp 
                           </c:if>
                        </p>
                        <p>
							<c:if test="${sessionScope.id == detailMember.id}">
                           		<a href="memberDelete.htm?id=${sessionScope.id}">
                           			<button class="follow">탈퇴</button>
                           		</a>
                           </c:if>
                        <p>
                        	<c:if test="${(sessionScope.id != null && sessionScope.id != detailMember.id )}">
									<c:if test="${isFollowerId == 0}">
										<a href="follow.htm?followingId=${detailMember.id }" class="a-btn">
											<button class="follow">Follow</button>
										</a>
									</c:if>
									<c:if test="${isFollowerId == 1}">
										<a href="unfollow.htm?followingId=${detailMember.id }" class="a-btn">
											<button class="follow">UnFollow</button>
										</a>
									</c:if>
							</c:if> <!-- id가 null이 아니고, detail페이지와 로그인사용자가 동일인물이 아닐 때 -->
                        </p>
                    </div>
			        <div class="content-2">
						<h2>즐겨찾기</h2>
                        <h4>지역이름</h4>
                        
                        <!-- el -->
                        
                        <c:forEach items="${detailBookmarkList}"  var="location">
							<p class="locName">
								<a href="locDetail.htm?locName=${location.locName}">${location.locName}</a>
							</p>
							<br>
					    </c:forEach>
                        
                        <!-- el -->

					  </div>
			        <div class="content-3">
						<h2>팔로워목록</h2>
					
					    <c:forEach items="${detailFollowingList}"  var="following">
							<p class="followingId">
								<a href="memberDetail.htm?id=${following.followingId}">${following.followingId}</a>
							</p>
							<br>		
					    </c:forEach>

				     </div>
				    <div class="content-4">
						<h2>내가 쓴 글</h2>
                      <!-- el -->
                      	<c:forEach items="${detailRevList}"  var="rev">
							<p class="locName">
								<a href="locDetail.htm?locName=${rev.locName}">[${rev.locName}]</a> 에 대한 글 : 
								<a href="reviewDetail.htm?revCode=${rev.revCode}">[${rev.revName}]</a>
							</p>
							<br>		
					    </c:forEach>
				    <!-- el -->
				    </div>
				    
				    
		        </div>
		       
			</section>