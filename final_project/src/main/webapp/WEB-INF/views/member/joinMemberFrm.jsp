<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/css/joinMember.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>이 페이지의 제목을 적어주세요 - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">


</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />





<!-- section은 container의 바탕(배경색)을 담당합니다. -->
<!-- section은 위아래로 margin이 크게 잡혀 있습니다. -->
<!-- class를 section 이 아니라 section nopad 로 하시면, 좌우 여백 없이 화면 너비 크기 전체에다가 section의 background-color를 부여할 수 있습니다. -->
		<section class="section">
<!--  container는 구현 내용물들을 담는 div입니다. -->
			<div class="container">
				<div class="row">
<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="content">
						<form action="/joinMember.do" autocomplete="off" method="post" >
							<label for="memberId">아이디</label><button type="button" name="idChk">중복체크</button><br>
							<input type="text" name="memberId" id="memberId" class="longinput" required placeholder="아이디"><br>
							<span id="idChkSpan"></span><br>
							<label for="memberPw">비밀번호</label><br>
							<input type="password" name="memberPw" id="memberPw" class="longinput" required placeholder="비밀번호"><br><br>
							<label for="memberPwRe">비밀번호 확인</label><br>
							<input type="password" name="memberPwRe" id="memberPwRe" class="longinput" required placeholder="비밀번호 확인"><br>
							<span id="pwChkSpan"></span><br>
							<label for="memberName">이름</label><br>
							<input type="text" name="memberName" id="memberName" class="longinput" required placeholder="이름"><br><br>
							<label for="memberName">전화번호</label><br>
							<input type="text" name="memberPhone" id="memberPhone" class="longinput" required placeholder="010-0000-0000"><br><br>
							<label for="memberName">이메일</label><br>
							<input type="text" name="email1" class="email1" id="email1"><span>@</span><input type="text" class="email2" name="email2" id="email2"><select class="emailSelect">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
							<button type="button" name="emailChk" id="myBtn">이메일인증</button>
							<input type="hidden" class="emailChk" value="0">
							<input type="hidden" name="memberEmail">
							<br><br>
							<label>성별</label><br>
							<label for="m" class="memberGender">남성</label><label for="f" class="memberGender">여성</label>
							<input type="radio" name="memberGender" id="m" value = 1>
							<input type="radio" name="memberGender" id="f" value = 2><br><br>
							<button type="submit" onclick="return notsubmit();">가입</button> 
							
							
	
						</form>
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>Lonely Suffers</h4><br>
          <span>이메일인증</span>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group">
              <label for="emailCode">인증코드</label>
              <input type="text" class="form-control" id="emailCode" placeholder="인증번호">
              <input type="text" class="form-control" name="emailCode">
            </div>
              <button type="button" class="btn btn-success btn-block" name="emailCodeChk"><span class="glyphicon glyphicon-off"></span> 인증</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
       </div>
        </div>
        
       <!-- Modal -->
  <div class="modal fade" id="idChkModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>Lonely Suffers</h4><br>
          <span>아이디 중복체크</span>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
        	<div class="notUseId">
        	<div class="form-group">
              <label for="notUseIdInput">아이디</label>
              <input type="text" class="form-control" id="notUseIdInput" readonly >
              <span>사용 가능한 아이디 입니다</span>
              <button type="button" class="btn btn-success btn-block successId"><span class="glyphicon glyphicon-off"></span> 사용하기</button>
            </div>
            </div>
            <div class="useId">
	          <form role="form">
	            <div class="form-group">
	              <label for="userIdInput">아이디</label>
	              <input type="text" class="form-control" name="userIdInput" id="userIdInput" placeholder="아이디">
	              <span>이미 사용중인 아이디 입니다</span>
	            </div>
	              <button type="button" class="btn btn-success btn-block idChkBtn"><span class="glyphicon glyphicon-off"></span> 중복체크</button>
	          </form>
        	</div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
      




		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/joinMember.js" ></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>