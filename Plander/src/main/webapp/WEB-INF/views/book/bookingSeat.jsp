<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좌석 선택</title>
<!-- 부트스트랩 ================================================================================ -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!-- ========================================================================================= -->

<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">

<script>
	//DB에서 예약된 좌석이랑 비교해서 체크박스 disabled
	$().ready(function(){
		var size = document.getElementsByName('s_col').length;
		alert("size : " + size);
		
		for (var i=0; i< size; i++) {
			if (document.getElementsByName('s_col')[i].checked) {
				alert("선택한 값 : " + document.getElementsByName('s_col')[i].value);
				var chknum = document.getElementsByName('s_col')[i].value;
				
				$.ajax({
					data : {s_col : chknum},
					url : '/TMS/book/seatchk',
					success: function(data){
						alert("여기까지옴");
						$(':checkbox:not(:checked)').attr('disabled', 'disabled');
						$(getElementsByName('s_col')).click(function(){
							$('#seatinfo').html("<span>A-" + document.getElementsByName('s_col')[i].value + "</span>");
						})
					},
					error:function(){
						$('#seatinfo').html("<span>에러언러어어너엉 .</span>");
					}
					
				})
				
				//$('#seatinfo').html("<span>A-" + document.getElementsByName('s_col')[i].value + "</span>");
				break;
			}
		}
		
	});
		
	//선택한 좌석 정보
	function seatchk() {
		var size = document.getElementsByName('s_col').length;
		//alert("size : " + size);
		
		for (var i=0; i< size; i++) {
			if (document.getElementsByName('s_col')[i].checked) {
				alert("선택한 값 : " + document.getElementsByName('s_col')[i].value);
				$('#seatinfo').html("<span>A-" + document.getElementsByName('s_col')[i].value + "</span>");
				break;
			}
		}
	}
	

</script>


<style>
	body, html { width: 90%; margin: auto; }
	* { font-family: 'Noto Sans KR', sans-serif; text-decoration: none; }
	#home { font-family: 'East Sea Dokdo', cursive; font-size: 2em; }
	.center { text-align: center; }
	
	/* #container { width: 75%; margin: auto; } */
	.boxoutside {
		width: 100%;
		height: auto;
	}
	
	.box { float: left; }
	.boxoutside::after, #allseat::after {
		content: "";
		clear: both;
		display: table;
	}
	#row { padding: 10px; }
	#allseat, #myselect { width: 93%; margin-left: auto; margin-right: auto; }
	
</style>

</head>
<body>
<div id="container" style="box-sizing: border-box;">
	<h4><a href="">날짜 선택</a>&nbsp;&nbsp;&nbsp;
	<a href="">좌석 선택</a></h4>
	<hr>
	
	<div id="ticket">
		<div class="boxoutside" style="border: 1px solid;">
		<form method="post" action="/TMS/book/pay" onsubmit="seatchk()">
			
			<div>
				<h4><a href="">1층</a>&nbsp;&nbsp;&nbsp;
				<a href="">2층</a></h4>
			</div>
			<hr>
			
		<div id="allseat">	
			<div id="row" class="box">
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<td><label><input type="checkbox" name="s_col" value="1">A-1</label></td>
							<td><label><input type="checkbox" name="s_col" value="2">A-2</label></td>
							<td><label><input type="checkbox" name="s_col" value="3">A-3</label></td>
							<td><label><input type="checkbox" name="s_col" value="4">A-4</label></td>
							<td><label><input type="checkbox" name="s_col" value="5">A-5</label></td>
						</tr>
						<tr>
							<td><label><input type="checkbox" name="s_col" value="6">A-6</label></td>
							<td><label><input type="checkbox" name="s_col" value="7">A-7</label></td>
							<td><label><input type="checkbox" name="s_col" value="8">A-8</label></td>
							<td><label><input type="checkbox" name="s_col" value="9">A-9</label></td>
							<td><label><input type="checkbox" name="s_col" value="10">A-10</label></td>
						</tr>
					</table>
				</div><br>
				
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<td><label><input type="checkbox" name="s_col" value="11">A-11</label></td>
							<td><label><input type="checkbox" name="s_col" value="12">A-12</label></td>
							<td><label><input type="checkbox" name="s_col" value="13">A-13</label></td>
							<td><label><input type="checkbox" name="s_col" value="14">A-14</label></td>
							<td><label><input type="checkbox" name="s_col" value="15">A-15</label></td>
						</tr>
						<tr>
							<td><label><input type="checkbox" name="s_col" value="16">A-16</label></td>
							<td><label><input type="checkbox" name="s_col" value="17">A-17</label></td>
							<td><label><input type="checkbox" name="s_col" value="18">A-18</label></td>
							<td><label><input type="checkbox" name="s_col" value="19">A-19</label></td>
							<td><label><input type="checkbox" name="s_col" value="20">A-20</label></td>
						</tr>
					</table>
				</div><br>
				
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<td><label><input type="checkbox" name="s_col" value="21">A-21</label></td>
							<td><label><input type="checkbox" name="s_col" value="22">A-22</label></td>
							<td><label><input type="checkbox" name="s_col" value="23">A-23</label></td>
							<td><label><input type="checkbox" name="s_col" value="24">A-24</label></td>
							<td><label><input type="checkbox" name="s_col" value="25">A-25</label></td>
						</tr>
						<tr>
							<td><label><input type="checkbox" name="s_col" value="26">A-26</label></td>
							<td><label><input type="checkbox" name="s_col" value="27">A-27</label></td>
							<td><label><input type="checkbox" name="s_col" value="28">A-28</label></td>
							<td><label><input type="checkbox" name="s_col" value="29">A-29</label></td>
							<td><label><input type="checkbox" name="s_col" value="30">A-30</label></td>
						</tr>
					</table>
				</div>
			</div> <!-- 1번 열 끝 -->
			
			<div id="row" class="box">
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<td><label><input type="checkbox" name="s_col" value="31">A-31</label></td>
							<td><label><input type="checkbox" name="s_col" value="32">A-32</label></td>
							<td><label><input type="checkbox" name="s_col" value="33">A-33</label></td>
						</tr>
						<tr>
							<td><label><input type="checkbox" name="s_col" value="34">A-34</label></td>
							<td><label><input type="checkbox" name="s_col" value="35">A-35</label></td>
							<td><label><input type="checkbox" name="s_col" value="36">A-36</label></td>
						</tr>
					</table>
				</div><br>
				
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<td><label><input type="checkbox" name="s_col" value="49">A-49</label></td>
							<td><label><input type="checkbox" name="s_col" value="50">A-50</label></td>
							<td><label><input type="checkbox" name="s_col" value="51">A-51</label></td>
						</tr>
						<tr>
							<td><label><input type="checkbox" name="s_col" value="52">A-52</label></td>
							<td><label><input type="checkbox" name="s_col" value="53">A-53</label></td>
							<td><label><input type="checkbox" name="s_col" value="54">A-54</label></td>
						</tr>
					</table>
				</div>
				
			</div> <!-- 2번 열 끝 -->
			
			<div id="row" class="box">
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<td><label><input type="checkbox" name="s_col" value="37">A-37</label></td>
							<td><label><input type="checkbox" name="s_col" value="38">A-38</label></td>
							<td><label><input type="checkbox" name="s_col" value="39">A-39</label></td>
						</tr>
						<tr>
							<td><label><input type="checkbox" name="s_col" value="40">A-40</label></td>
							<td><label><input type="checkbox" name="s_col" value="41">A-41</label></td>
							<td><label><input type="checkbox" name="s_col" value="42">A-42</label></td>
						</tr>
					</table>
				</div><br>
				
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<td><label><input type="checkbox" name="s_col" value="55">A-55</label></td>
							<td><label><input type="checkbox" name="s_col" value="56">A-56</label></td>
							<td><label><input type="checkbox" name="s_col" value="57">A-57</label></td>
						</tr>
						<tr>
							<td><label><input type="checkbox" name="s_col" value="58">A-58</label></td>
							<td><label><input type="checkbox" name="s_col" value="59">A-59</label></td>
							<td><label><input type="checkbox" name="s_col" value="60">A-60</label></td>
						</tr>
					</table>
				</div>
			</div> <!-- 3번 열 끝 -->
			
			<div id="row" class="box">
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<td><label><input type="checkbox" name="s_col" value="43">A-43</label></td>
							<td><label><input type="checkbox" name="s_col" value="44">A-44</label></td>
							<td><label><input type="checkbox" name="s_col" value="45">A-45</label></td>
						</tr>
						<tr>
							<td><label><input type="checkbox" name="s_col" value="46">A-46</label></td>
							<td><label><input type="checkbox" name="s_col" value="47">A-47</label></td>
							<td><label><input type="checkbox" name="s_col" value="48">A-48</label></td>
						</tr>
					</table>
				</div>
			</div> <!-- 4번 열 끝 -->
			
		</div>
		
			<!-- 선택 정보 -->
			<div id="myselect" style="border: 1px solid;">
				<h4>선택 정보</h4>
				<p id="seatinfo"></p>
				<p id="seatprice">2000원</p>
			</div>
			<br>
			<button type="submit" class="btn btn-default btn-lg"
				style="float: right; margin: 0 15px 15px 0;">다음단계</button>
			
		</form>
		
		</div> <!-- 박스 아웃사이드 끝 -->
	</div> <!-- 티켓 끝 -->


</div> <!-- 바디 콘테이너 끝 -->
</body>
</html>