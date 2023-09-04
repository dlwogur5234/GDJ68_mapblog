<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- Kakao Map -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b5744597ccc65933ecad3607daed47e&libraries=services"></script>

	<c:import url="../temp/bootStrap.jsp"></c:import>

	<style type="text/css">
		.write-reply {
			width:100px;
			height:40px;
		}
		
		.reply-list {
			position:relative;
			width:100%;
		}
		
		.reply-list .replies {
			position:relative;
			width:100%;
			height:35px;
			margin-bottom:5px;
		}
		
		.reply-list .replies:after {
			clear:both;
		}
		
		.reply-list .replies span {
			position:relative;
			float:left;
		}
		
		.reply-list .replies a {
			position:relative;
			float:left;
		}
		
		.reply-list .replies span.writer {
			width:10%;
		}
		.reply-list .replies span.date {
			width:15%;
		}
		
		.reply-list .replies span.btns {
			width:20%;
		}
		
		.reply-list .replies span.contents {
			width:40%;
			text-align:left;
		}
		
		.reply-write {
			position:relative;
			width:100%;
			clear:both;
		}
		
		.write_reply_profileImage, .reply_list_profileImage {
			width:35px;
		}
		
		.cl {clear:both}
		</style>
	
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<p class="mb-5"></p>
	<section class="container-sm">

		<form action="" id="frm">
			<!-- feedNum hidden처리 -->
			<input type="hidden" id="feedNum" name="feedNum" value="${dto.feedNum}">
		</form>
		
		<!-- publics hidden처리 -->
		<input type="hidden" name="publics" value="${dto.publics}">

		<input type="hidden" name="id" id="id" value="${dto.id}">

		<!-- 위도/경도 (숨김) -->
		<input type="hidden" name="lat" id="lat" value="${dto.lat}">
		<input type="hidden" name="lng" id="lng" value="${dto.lng}">


		<p class="col-sm-8 text-start">여행날짜 ${dto.tripDate}</p>
		<p class="display-4">${requestScope.dto.title}</p>
		
		<dl class="row mt-1">
			<dd class="col-sm-2 text-start align-text-bottom mt-1">${dto.id}</dd>
			<dd class="col-sm-8 text-end text-body-tertiary">작성일 ${dto.createDate}</dd>
			<dd class="col-sm-2 text-end">조회수 ${dto.hit}</dd>
		</dl>

		<hr class="hr" />

		
	<div>
		<div class="card border-white mb-3">
			<pre class="card-body contents text-start" style="font-size:15px; height:300px;">${dto.contents}</pre>
		</div>

		<div>
			<c:forEach items="${dto.dtos}" var="f">
				<img alt="${f.originalName}" src="/resources/upload/feed/${f.fileName}">
			</c:forEach>
		</div>
	</div>

	<div class="row mt-1">
		<p class="col-sm-11 text-end"></p>
		<button class="btn btn-primary col-sm-1 text-start" id="likes"> 좋아요 ${dto.likes}</button>
	</div>

	<hr class="hr" />


		<!-- 댓글  -->
		<div class="collapse" style="display:block; margin-top:10px;">
			<div class="card card-body">
				<!-- 댓글 목록 -->
				<div class="reply-list">
					<!-- 댓글이 목록이 들어가는 곳 -->
					<c:forEach var="comment" items="${commentList }">
						<div class="replies">
							<a href="#">
								<img class="reply_list_profileImage" src="/resources/img/images.jpeg" />
							</a>
							<span class="writer">
								<b>${comment.nickName }</b>
							</span>
							<span class="date">
								${comment.commentDate }
							</span>
							<span class="contents">
								${comment.contents }
							</span>
							<span class="btns">
							<c:if test="${comment.id eq sessionScope.member.id }">
								<!-- <button type="button" class="update" data-url="update">수정</button> -->
								<button type="button" class="commentDelete" data-cnum="${comment.commentNum }">삭제</button>
							</c:if>
							</span>
						</div>
						<div class="cl"></div>
					</c:forEach>
				</div>
				<!-- 댓글 작성 => 로그인한 상태여야만 댓글작성 칸이 나온다. -->
				<div class="row reply-write">
					<div class="col-1">
						<a href="#">
							<img class="write_reply_profileImage" src="/resources/img/images.jpeg" />
						</a>
					</div>
					<div class="col-8" class="input_reply_div">
						<input type="text" id="contents" class="w-100 form-control" placeholder="댓글입력..." />
					</div>
					<div class="col-3 ">
						<button type="button" id="write-reply" class="btn btn-success mb-1 write-reply">댓글&nbsp;달기</button>
					</div>
				</div>
			</div>
		</div>
	</section>



	<c:if test="${sessionScope.member.id == dto.id}">
		<button class="btn btn-primary c1" type="button" id="update" data-url="update">수정</button>
		<button class="btn btn-danger c1" type="button" id="delete" data-url="delete">삭제</button>
    </c:if>
		<button class="btn btn-primary" id="list">목록</button>

	
	</section>


	
	<script type="text/javascript">

		// 좋아요 관련 script
		$(document).on("click", "#likes", function() {
			if ("${sessionScope.member}") {
				$.ajax({
					async:false,
					url:"/feed/addLikes",
					type:"post",
					data:{"feedNum":$("#feedNum").val()},
					dataType:"json",
					success:function(data) {
						$("#likes").text("좋아요 " + data.count);
					},
					error:function(xhr, status, res) {
						console.log("오류 발생", xhr.responseText, status, res);
					}
				});
			} else {
				alert("로그인이 필요한 서비스입니다.");
			}
		});
	


		// 댓글 관련 script
		$(document).on("click", "#write-reply", function() {
			let contents = $.trim($("#contents").val());
			if ("${sessionScope.member}") {
				console.log("콘텐츠 : ", contents);
				if (contents) {
					$.ajax({
						async:false,
						url:"/feed/addComment",
						type:"post",
						data:{"feedNum":$("#feedNum").val(), "contents":$("#contents").val()},
						dataType:"json",
						success:function(data) {
						},
						error:function(xhr, status, res) {
							console.log("오류 발생", xhr.responseText, status, res);
						}
					});
				} else {
					alert("댓글 내용을 넣어주세요");
				}
	
				$("#contents").val("");
	
				refreshComment();
			} else {
				alert("로그인이 필요한 서비스입니다.");
			}
	
		});
		
		$(document).on("click", ".commentDelete", function() {
			let commentNum = $(this).data("cnum");
			$.ajax({
				async:false,
				url:"/feed/deleteComment",
				type:"post",
				data:{"commentNum":commentNum, "feedNum":$("#feedNum").val()},
				dataType:"json",
				success:function(data) {
				},
				error:function(xhr, status, res) {
					console.log("오류 발생", xhr.responseText, status, res);
				}
			});
	
			refreshComment();
		});
	
		function refreshComment() {
			$.ajax({
				async:false,
				url:"/feed/commentList",
				type:"get",
				data:{"feedNum":$("#feedNum").val()},
				dataType:"json",
				success:function(data) {
					$(".reply-list").children().remove();
					$(data).each(function(i, elem) {
						let replies = $("<div>").addClass("replies");
						replies
							.append($("<a>", {href:"#"}).append($("<img>", {src:"/resources/img/images.jpeg"}).addClass("reply_list_profileImage")))
							.append($("<span>").addClass("writer").text(elem.nickName))
							.append($("<span>").addClass("date").text(elem.commentDate))
							.append($("<span>").addClass("contents").text(elem.contents));
						if ("${sessionScope.member.id}" == elem.id) {
							replies.append($("<span>").addClass("btns").append($("<button>", {type:"button", text:"삭제"}).addClass("commentDelete")));
						}
						
						$(".reply-list").append(replies).append($("<div>").addClass("cl"));
					});
				},
				error:function(xhr, status, res) {
					console.log("오류 발생", xhr.responseText, status, res);
				}
			});
		}
		</script>

	<script src="/resources/js/feed/feedDelete.js"></script>
	<!-- <script src="/resources/js/feed/feedComment.js"></script> -->

</body>
</html>