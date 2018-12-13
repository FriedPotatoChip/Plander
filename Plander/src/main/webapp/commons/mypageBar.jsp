<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인시 보여주는 마이페이지 -->
<div id="mypage">
	<div>
		<table style="width: 100%;" class="center">
			<tr>
				<td rowspan="3" width="10%">
					<img height="100" width="100" alt="힘이없을때는 경수를 보자" src="/resources/images/do.png">
				</td>
				<td colspan="3" width="18%"><b>${user.name }</b></td>
				<td rowspan="3" width="60%"><b style="font-size: 28px;">[오늘의 일정] 메인 페이지 만들기 !</b></td>
				<td rowspan="3" width="6%">일정<br>만들기</td>
				<td rowspan="3" width="6%"><a href="mypage?u_idx=${user.u_idx }&name=" + encodeURI(${user.name})>mypage</a></td>
			</tr>
			<tr>
				<td width="6%">전체일정</td>
				<td width="6%">북마크</td>
				<td width="6%">댓글</td>
			</tr>
			<tr>
				<td>${getPlannerCnt}</td>
				<td>${getBookmarkCnt}</td>
				<td>${getCommentCnt}</td> 
			</tr>
		</table>
	</div>
</div>
<br><br><br>
