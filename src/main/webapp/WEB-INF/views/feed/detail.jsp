<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<p class="mb-5"></p>
	<section class="container-sm">

		<form action="" id="frm">
			<!-- feedNum hidden처리 -->
			<input type="hidden" id="feedNum" name="feedNum" value="${dto.feedNum}">

			<!-- publics hidden처리 -->
			<input type="hidden" name="publics" value="${dto.publics}">
		</form>

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

	<c:forEach items="${dto.fileDTOs}" var="f">
		<img alt="" src="/resources/upload/board/${f.fileName}">
	</c:forEach>
	
	</div>

	<div class="row mt-1">
		<p class="col-sm-11 text-end"></p>
		<button class="btn btn-primary col-sm-1 text-start" id="likes"> 좋아요 ${dto.likes}</button>
	</div>

	<hr class="hr" />


	<!-- 댓글 -->
	<div>
		<div class="mb-3">
			<textarea name="accountPassword" class="form-control" id="comment"></textarea>
			<button id="commentAdd">댓글등록</button>
		</div>

		<div>
			<table id="commentList">

			</table>



			<div id="more">


			</div>

		</div>

	</div>



	<c:if test="${sessionScope.member.id == dto.id}">
		<button class="btn btn-primary c1" type="button" id="update" data-url="update">수정</button>
		<button class="btn btn-danger c1" type="button" id="delete" data-url="delete">삭제</button>
    </c:if>
		<button class="btn btn-primary" id="list">목록</button>

	
	</section>


	<!-- 댓글 관련 script -->
	<script type="text/javascript">

		let fn = document.getElementById("feedNum");
		let pageNum = 1;
		let tp=0;

		$("#commentAdd").click(function(){
			let contents = $("#comment").val();
			$.ajax({
				type : 'post',
				url : 'commentAdd',
				data : {
					// 앞의 이름은 파라미터 이름이기 때문에 
					// DTO의 변수명과 똑같이 해주기
					feedNum : fn,
					commentContents : contents
				},
				success : function(result){
					if(result.trim()>0){
						alert("댓글등록 완료");
						$("#commentList").empty();
						$("#comment").val("");
						pageNum=1;
						getCommentList(fn, 1);
					}
				}
			})
		})

		$("#more").on("click","#moreButton", function(){

			if(pageNum>=tp){
				alert('마지막 페이지');
				return;
			}

			pageNum++;
			getCommentList(fn, pageNum);
		})

		getCommentList(fn, pageNum);

		function getCommentList(feedNum, page){
			$.ajax({
				type : "get",
				url : "./commentList",
				data : {
					feedNum:feedNum,
					page:page
				},
				success : function(result){
					console.log(result)
					$("#commentList").append(result);
					tp = $("#totalPage").attr("data-totalPage");
					let button = '<button id="moreButton">더보기('+ pageNum +'/' + tp +')</button>'
					$("#more").html(button);
				},
				error : function(){
					alert("관리자에게 문의해주세요.");
				}
			})
		}
	</script>


	<!-- 좋아요 관련 script -->
	<script type="text/javascript">
	$(document).on("click", "#likes", function() {
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
	});
	</script>

	<script src="/resources/js/feed/feedDelete.js"></script>

</body>
</html>