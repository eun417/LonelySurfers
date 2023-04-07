<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>${house.houseTitle} - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>

<link rel="stylesheet" type="text/css" href="css/daterangepicker.css">

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />



		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>숙박 상품</h2>
						<p class="lead">
						<c:if test="${house.houseStatus == 0}">판매 중지된 상품입니다.
						</c:if>
						</p>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->




		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<div>대표 사진 영역</div>
						<div>다중 사진 선택 칸</div>
					</div>
					<!-- end col -->



					<div class="col-md-7">
						<div>
							<p>${house.roomTitle }</p>
							<div class="row">
								<h1>${house.houseTitle }</h1>
								<h3>${house.housePrice }원/1박</h3>
								<div class="col-md-9">
									<p>비성수기, 평일 기준</p>
								</div>
								<div class="col-md-3">
									<p style="text-align: left;">${house.roomCapa }인실</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									판매량 ()숫자
								</div>
								<div class="col-md-5">
									별평점넣을자리
								</div>
							</div>
							<p>주소지 <span>${house.houseAddress }</span></p>
						</div>
						<div>
							<button>관심상품</button>
							<button type="button" data-toggle="modal" data-target="#myModal" id="goBooking">예약하기</button>
						</div>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->




<!-- Modal -->
  <div class="modal fade bd-example-modal-lg" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div id="bookingArea" class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">예약하기</h4>
        </div>
        <div class="modal-body">
        	<div class="row">
        		<div class="col-md-4">
					<input type="text" id="bookStart">
				</div>
        		<div class="col-md-2"></div>
        		<div class="col-md-4">
					<input type="text" id="bookEnd" placeholder="시작일을 먼저 선택">
				</div>
        	</div>
        </div>
        <div class="modal-footer">
          <button type="button" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>




<!-- 상품 정보 표시 시작 -->
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div class="row">
							<ul class="nav navbar-nav navbar-left">
								<li>상품설명</li>
								<li>상품평</li>
								<li>상품문의</li>
							</ul>
						</div>
						<div class="row">상품 설명 div</div>
						<div class="row">상품 평 div</div>
						<div class="row">상품 문의 div</div>
					</div>
					<div class="col-md-3">
					광고 등 배너 영역 column
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
<!-- 상품 정보 표시 끝 -->





		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="js/moment.min.js"></script>
	<script src="js/daterangepicker.js"></script>



	<script type="text/javascript">
		$("#goBooking").on("click", function() {

// 이미 결제완료된 날짜들은 invalidDateRanges 변수에 넣음 
			var invalidDateRanges = [
				{ 'start': moment('2023-04-10'), 'end': moment('2023-04-14') },
				{ 'start': moment('2023-04-23'), 'end': moment('2023-04-27') },
				{ 'start': moment('2023-05-03'), 'end': moment('2023-05-07') },
				{ 'start': moment('2023-05-17'), 'end': moment('2023-05-20') }
			];


// 새 예약이 시작하는 날짜를 선택하는 date range picker 생성
			$('#bookStart').daterangepicker({
			    parentEl: "#bookingArea .modal-body",
				locale: {
					format: "YYYY-MM-DD",
					fromLabel: "시작",
					toLabel: "종료"
			    },
			    alwaysShowCalendars: true,
				autoApply: true,
				singleDatePicker: true,
				showDropdowns: true,
				minDate: moment().add(1, 'days'),	// 오늘까지는 예약 불가. 내일부터 예약 가능
				maxDate: moment().add(3, 'months'),	// 시작일은 3개월 이내에서 지정 가능
				isInvalidDate: function(date) {
					return invalidDateRanges.reduce(function(bool, range) {
						return bool || (date >= range.start && date <= range.end);
					}, false);
				}
			});
			$("#bookStart").val("");	// value 없는 상태로 생성 필요


// 시작일 input의 value가 바뀌면, 적절하게 minDate와 maxDate를 구성해서 종료일 date range picker를 생성  
			$("#bookStart").on("change", function(){
				const bookStartDate = $("#bookStart").val();	// 시작일을 minDate로 사용
				$('#bookEnd').val(bookStartDate);
	// maxDate는 시작일+3개월로 초기화 
				var maxLimit = moment(bookStartDate).add(3, 'months').format("YYYY-MM-DD");
	// bookStartDate로부터 가장 가까운 미래의 invalidDateRanges로 maxDate를 좁혀줌
				for(let i=invalidDateRanges.length-1; i>=0; i--){
					if(bookStartDate < invalidDateRanges[i].start.format("YYYY-MM-DD")){
						maxLimit = invalidDateRanges[i].start.format("YYYY-MM-DD");
					}
				}

				$('#bookEnd').daterangepicker({
				    parentEl: "#bookingArea .modal-body",
					locale: {
						format: "YYYY-MM-DD",
						fromLabel: "시작",
						toLabel: "종료"
				    },
				    alwaysShowCalendars: true,
					autoApply: true,
					singleDatePicker: true,
					showDropdowns: true,
					minDate: bookStartDate,
					maxDate: maxLimit
				});

				$('#bookEnd').focus();
			});
		});
	</script>

</body>
</html>