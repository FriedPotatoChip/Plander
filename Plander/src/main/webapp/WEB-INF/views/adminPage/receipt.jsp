<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>​

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>관리자</title>

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min2.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/dashboard.css" rel="stylesheet">

<!-- 버튼 아이콘 링크 -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/receipt.css">
<link href="https://fonts.googleapis.com/css?family=Poppins"
	rel="stylesheet" />
<link href="/resources/css/searchbar.css" rel="stylesheet" />
<!-- ======================================================================================== -->
<style>
#cntPerpage {
	float: right;
}

#pagingList {
	list-style: none;
	float: right;
	position: relative;
	left: -45%;
}

#pagingList li {
	float: left;
}

a {
	text-decoration: none;
}

#search {
	width: 50%;
}

#select {
	width: 10%;
}

.container-1 {
	width: 300px;
	vertical-align: middle;
	white-space: nowrap;
	position: relative;
}

.container-1 input#search {
	width: 20rem;
	height: 3rem;
	background: #fff;
	border: 1px solid #e9ecef;
	font-size: 10pt;
	float: left;
	color: #63717f;
	padding-left: 45px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.container-1 input#search::-webkit-input-placeholder {
	color: #65737e;
}

.container-1 input#search:-moz-placeholder { /* Firefox 18- */
	color: #65737e;
}

.container-1 input#search::-moz-placeholder { /* Firefox 19+ */
	color: #65737e;
}

.container-1 input#search:-ms-input-placeholder {
	color: #65737e;
}

.container-1 .icon {
	position: absolute;
	top: 50%;
	margin-left: 17px;
	margin-top: 17px;
	z-index: 1;
	color: #4f5b66;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 10px;
	margin: 5px 0 0 5px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}
.active-cyan-2

 

input


[
type
=
text
]


:focus


:not

 

(
[
readonly
]

 

)
{
border-bottom


:

 

1
px

 

solid

 

#4dd0e1


;
box-shadow


:

 

0
1
px

 

0
0
#4dd0e1


;
}
</style>
</head>

<body>
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Admin page</a>


		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="/TMS">logout</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">

						<li class="nav-item"><a class="nav-link active"
							href="/TMS/admin"> <span data-feather="users"></span>
								Customers <span class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin/Cabinet?br_idx=1"> <span data-feather="file"></span>
								Cabinet
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin/Chart"> <span data-feather="home"></span>
								Reservation
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin/Seats"> <span data-feather="bar-chart-2"></span>
								Seats
						</a></li>

						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span> Receipt
						</a></li>
					</ul>
				</div>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<div class="limiter">
				<div class="container-table100">
					<div class="wrap-table100">
						<div class="table100">
							<div class="s003">
								<form>
									<div class="inner-form">
										<div class="input-field first-wrap">
											<div class="input-select">
												<select data-trigger="" name="choices-single-defaul">
													<option placeholder="">Category</option>
													<option>New Arrivals</option>
													<option>Sale</option>
													<option>Ladies</option>
													<option>Men</option>
													<option>Clothing</option>
													<option>Footwear</option>
													<option>Accessories</option>
												</select>
											</div>
										</div>
										<div class="input-field second-wrap">
											<input id="search" type="text" placeholder="Enter Keywords?" />
										</div>
										<div class="input-field third-wrap">
											<button class="btn-search" type="button">
												<svg class="svg-inline--fa fa-search fa-w-16"
													aria-hidden="true" data-prefix="fas" data-icon="search"
													role="img" xmlns="http://www.w3.org/2000/svg"
													viewBox="0 0 512 512">
               									 <path fill="currentColor"
														d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
             									 </svg>
											</button>
										</div>
									</div>
								</form>
							</div>

							<table>
								<thead>
									<tr class="table100-head">
										<th class="column1">Date</th>
										<th class="column2">Order ID</th>
										<th class="column3">Name</th>
										<th class="column4">Price</th>
										<th class="column5">Quantity</th>
										<th class="column6">Total</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="column1">2017-09-29 01:22</td>
										<td class="column2">200398</td>
										<td class="column3">iPhone X 64Gb Grey</td>
										<td class="column4">$999.00</td>
										<td class="column5">1</td>
										<td class="column6">$999.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-28 05:57</td>
										<td class="column2">200397</td>
										<td class="column3">Samsung S8 Black</td>
										<td class="column4">$756.00</td>
										<td class="column5">1</td>
										<td class="column6">$756.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-26 05:57</td>
										<td class="column2">200396</td>
										<td class="column3">Game Console Controller</td>
										<td class="column4">$22.00</td>
										<td class="column5">2</td>
										<td class="column6">$44.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-25 23:06</td>
										<td class="column2">200392</td>
										<td class="column3">USB 3.0 Cable</td>
										<td class="column4">$10.00</td>
										<td class="column5">3</td>
										<td class="column6">$30.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-24 05:57</td>
										<td class="column2">200391</td>
										<td class="column3">Smartwatch 4.0 LTE Wifi</td>
										<td class="column4">$199.00</td>
										<td class="column5">6</td>
										<td class="column6">$1494.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-23 05:57</td>
										<td class="column2">200390</td>
										<td class="column3">Camera C430W 4k</td>
										<td class="column4">$699.00</td>
										<td class="column5">1</td>
										<td class="column6">$699.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-22 05:57</td>
										<td class="column2">200389</td>
										<td class="column3">Macbook Pro Retina 2017</td>
										<td class="column4">$2199.00</td>
										<td class="column5">1</td>
										<td class="column6">$2199.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-21 05:57</td>
										<td class="column2">200388</td>
										<td class="column3">Game Console Controller</td>
										<td class="column4">$999.00</td>
										<td class="column5">1</td>
										<td class="column6">$999.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-19 05:57</td>
										<td class="column2">200387</td>
										<td class="column3">iPhone X 64Gb Grey</td>
										<td class="column4">$999.00</td>
										<td class="column5">1</td>
										<td class="column6">$999.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-18 05:57</td>
										<td class="column2">200386</td>
										<td class="column3">iPhone X 64Gb Grey</td>
										<td class="column4">$999.00</td>
										<td class="column5">1</td>
										<td class="column6">$999.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-22 05:57</td>
										<td class="column2">200389</td>
										<td class="column3">Macbook Pro Retina 2017</td>
										<td class="column4">$2199.00</td>
										<td class="column5">1</td>
										<td class="column6">$2199.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-21 05:57</td>
										<td class="column2">200388</td>
										<td class="column3">Game Console Controller</td>
										<td class="column4">$999.00</td>
										<td class="column5">1</td>
										<td class="column6">$999.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-19 05:57</td>
										<td class="column2">200387</td>
										<td class="column3">iPhone X 64Gb Grey</td>
										<td class="column4">$999.00</td>
										<td class="column5">1</td>
										<td class="column6">$999.00</td>
									</tr>
									<tr>
										<td class="column1">2017-09-18 05:57</td>
										<td class="column2">200386</td>
										<td class="column3">iPhone X 64Gb Grey</td>
										<td class="column4">$999.00</td>
										<td class="column5">1</td>
										<td class="column6">$999.00</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>

	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min2.js"></script>
	Icons
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace()
	</script>

	<script src="/resources/js/choices.js"></script>
	<script>
		const choices = new Choices('[data-trigger]', {
			searchEnabled : false,
			itemSelectText : '',
		});
	</script>

</body>

</html>