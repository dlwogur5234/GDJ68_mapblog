	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<h1>detail</h1>

	<!-- Getter, Setter 의 이름 : 메서드에서 get을 제외하고 첫번째글자를 소문자로 바꾼것 -->
	
	<table class="table table-dark table-hover">
		<thead>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			
			
		</thead>
		<tbody>
				<tr>
					<td data-add-num="${dto.qnaNum}" id="up">${dto.qnaNum}</td>
					<td>${dto.qnaTitle}</td>
					<td>${dto.memberId}</td>
					<td>${dto.qnaDate}</td>
				</tr>
				</tbody>
			</table>
				<table class="table table-dark table-hover">
				  <tr>
				   		<th>내용</th>
				  </tr>
				  <tr>
				    <td>${dto.qnaContents}</td>
				    <td>${memberId}</td>
				  </tr>
				</table>
				
				 	<c:forEach items="${dto.fileDTOs}" var="f">	
						<img src="../resources/upload/qna/${f.fileName}">
					</c:forEach> 
		
	
	<c:choose>
    <c:when test="${dto.memberId eq member.id || not empty adminMember}">
        <a href="./update?qnaNum=${dto.qnaNum}" >수정</a>
    

        <form action="./delete?qnaNum=${dto.qnaNum}" method="post">
            <button type="submit">삭제</button>
        </form>
 
    </c:when>
</c:choose>
	
	
	
	
	
	<%-- <button id="update" data-url="update" class="c1">수정</button>
	<button id="del" data-url="delete" data-delete-name="num" data-delete-num="${dto.num}" class="c1">삭제</button> --%>


	<div>
		<c:if test="${not empty member}">
			<div class="mb-3">		
				<textarea  name="contents" class="form-control" id="comment"></textarea>
				<button id="commentAdd">댓글등록</button>
			</div>
		</c:if>
		<div>
			<table id="commentList" class="table table-success table-striped">
				
			</table>
			<div id="more">

			</div>

		</div>
	</div>
	
	<script>
		let qn = $('#up').attr('data-add-num');
		let tp = 0;
		let pageNum = 1;
		getCommentList(qn,pageNum);
		//add
		$('#commentAdd').click(function(){
			let contents=$('#comment').val();
			$.ajax({
				type:'post',
				url:"commentAdd",
				data:{
					qnaNum:qn,
					contents:contents
				},
				success:function(result){
					if(result.trim()>0){
						alert('댓글등록완료');
						$('#commentList').html('');
						$('#comment').val('');
						pageNum=1;
						getCommentList(qn,1);
					}
				}
			})
		})

		//last Page
		$('#more').on('click','#moreButton',function(){
			if(pageNum==tp){
				alert('마지막 페이지')
				return
			}
			pageNum++;
			getCommentList(qn,pageNum);
		})

		//list
	function getCommentList(qnaNum,page){
		$.ajax({
			type:'get',
			url:"./commentList",/* "./commentList?qnaNum="+qnaNum+"&page"+page, */
			data:{
				qnaNum:qnaNum,
				page:page
			},
			success:function(result){
				$('#commentList').append(result);
				tp = ($('#totalPage').attr('data-totalPage'))

				let button = '<button id="moreButton">더보기('+pageNum+'/'+tp+')</button>'

				$('#more').html(button);
			},
			error:function(){
				console.log("error")
			}
		})
	}

	$(document).ready(function() {
    $('#commentList').on('click', 'tr td:last-child', function() {
        var tr = $(this).closest('tr');
		var commentNum = $("#del").attr('data-num-del');

		$.ajax({
			type:'post',
			url:'deleteComment',
			data:{
				commentNum:commentNum
			},
			success:function(result){
				tr.remove();
			},
			error:function(){
				console.log('error')
			}
		})
    });
});
	</script>
</body>
</html>