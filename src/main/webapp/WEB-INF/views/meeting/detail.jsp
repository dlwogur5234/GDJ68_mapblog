<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
</head>
<body>
	<div class="wrap">
		<div class="info">
			<div class="title">
				${dto.title}<div id="close_overlay" class="close" title="닫기"></div>
			</div>
			<div class="body">
				<div class="desc">${dto.id}</div>
				<div class="desc">${dto.contents }</div>
				<div class="desc">${dto.meetingDate }</div>
				<div class="desc">${personnel}/${dto.personnel }</div>
			</div>
		</div>
	</div>
	<form action="./meetingJoin" method="post">
		<c:if test="${not empty sessionScope.member && sessionScope.member.id ne dto.id && result<1 && personnel<dto.personnel}">
			<input type="hidden" name="meetingNum" value="${dto.meetingNum}">
			<button type="submit" name="join" value="true" id="btn">참가신청</button>
		</c:if>
	</form>
	<form action="./meetingQuit" method="post">
		<c:if test="${result>=1 && member.id ne dto.id}">
			<input type="hidden" name="meetingNum" value="${dto.meetingNum}">
			<input type="hidden" name="id" value="${member.id}">
			<button type="submit" >모임나가기</button>
		</c:if>
	</form>
	</form>
		<form action="./update">
		<c:if test="${member.id eq dto.id }">
			<input type="hidden" name="meetingNum" value="${dto.meetingNum}">
			<input type="hidden" name="id" value="${member.id}">
			<button type="submit" >모임수정</button>
		</c:if>
	</form>
	<form action="./delete">
		<c:if test="${member.id eq dto.id }">
			<input type="hidden" name="meetingNum" value="${dto.meetingNum}">
			<input type="hidden" name="id" value="${member.id}">
			<button type="submit" >모임삭제</button>
		</c:if>

</body>
</html>