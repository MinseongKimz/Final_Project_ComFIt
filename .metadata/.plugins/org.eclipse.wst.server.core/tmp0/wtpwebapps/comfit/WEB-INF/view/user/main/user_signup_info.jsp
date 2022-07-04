<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_signup_info.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
    body
     {
         min-height: 100vh;
     }
    .input-form {
      max-width: 680px;
      margin-top: 20px;
      padding: 32px;
      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function searchAddr()
   {
      new daum.Postcode({
         
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
               // 예제를 참고하여 다양한 활용법을 확인해 보세요.
               //alert(data); //[Object]
               
               var fullRoadAddr = data.roadAddress;   // 도로명 주소 변수
               var extraRoadAddr = '';
               
             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname))
               {
                     extraRoadAddr += data.bname;
               }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment == 'Y')
               {
                     extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== '')
               {
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== '')
               {
                   fullRoadAddr += extraRoadAddr;
               }
               
               alert(fullRoadAddr);
               document.getElementById('address').value = fullRoadAddr;
               
           }
       }).open({
          /* popupKey : 'popup1'   // 팝업창 key 설정 */
       });   
   }
   
   function fn_submit()
   {
         
      // 검증에 사용할 정규식 변수 regExp에 저장
         
      // alert('비밀번호 정규식 규칙 위반!!');
      var pwd = document.getElementById('password').value;
      var pwdCheck = document.getElementById('password_check').value;
      //alert(pwdCheck);
      var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
      
      if (!passwordRules.test(pwd))
      {
         alert('유효하지 않은 비밀번호입니다.');
         return;
      }
      
      if(pwd != pwdCheck)
      {
         alert('입력하신 비밀번호가 비밀번호확인과 일치하지 않습니다.');
         return;
      }
       
         
      var text = document.getElementById('tel').value;
      var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;  
       if (regPhone.test(text) != true)
       {
          alert('정상적인 휴대전화번호를 입력해주세요');
          return;
       }
       
   	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var emailVal = document.getElementById('email').value;
	
	if (emailVal.match(regExp) == null)
    {
          alert('정상적인 이메일을 입력해주세요');
          return;
    }
       
       $("#regitform").submit();
   }
   
   $(function()
   {
		//alert("sd")
		$("#nickname").focusout(function() // 닉네임 중복 검사
		{
			var nickName = "nickName=" + $.trim($("#nickname").val());
			
			$.ajax({
				type : "POST"
			   , url : "nicknamecheck.action"
			   , data : nickName
			   , success : function(result)
			{
				if (result == 1)
				{
					$("#checkNick").css("display", "inline");
					$("#checkNick").html("이미 사용중인 닉네임 입니다.");
					$("#regitBtn").prop("disabled", true);
				}
				else
				{
					$("#checkNick").css("display", "inline");
					$("#checkNick").html("사용가능한 닉네임 입니다.");
					$("#regitBtn").prop("disabled", false);
				}	
			}
			  , error : function(e)
			{
				alert(e.responseText);
			}	
			})
			
		})
		
		
		$("#email").focusout(function() // 이메일
		{
			
			var email = "email=" + $.trim($("#email").val());
			$.ajax({
				type : "POST"
			   , url : "emailcheck.action"
			   , data : email
			   , success : function(result)
			{
				if (result == 1)
				{
					$("#checkEmail").css("display", "inline");
					$("#checkEmail").html("이미 사용중인 이메일 입니다.");
					$("#regitBtn").prop("disabled", true);
				}
				else
				{
					$("#checkEmail").css("display", "inline");
					$("#checkEmail").html("사용가능한 이메일 입니다.");
					$("#regitBtn").prop("disabled", false);
				}	
			}
			  , error : function(e)
			{
				alert(e.responseText);
			}	
			})
			
		})
		
   })
   
   
</script>
</head>



<!-- Modal 주소 검색 -->
<div class="modal fade" id="searchAddr" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><img src="images/logo.png" alt="" style="width: 150px; height: auto;"/>주소 검색</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
         <div class="input-group mb-1 col-xl-6" >
           <span class="input-group-text" id="inputGroup-sizing-default"><i class="bi bi-search"></i></span>
           <input type="text" class="form-control" placeholder="도로명 혹은 지번으로 주소 입력">
           <span style="font-size: 10pt; font-weight: bold; color: skyblue;">검색어 예 : 도로명(반포대로 58), 건물명(독립기념관), 지번(삼성동85)</span>
           </div>
           
           <!-- 주소출력 -->
           <div>
           
           
           </div>
      </div>
      
      
      <div class="modal-footer">
         <button type="button" class="btn btn-primary"
        data-bs-toggle="modal" data-bs-target="#searchAdddr_ok">확인</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<!-- 회원가입 폼 -->
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        
        <h4 class="mb-3"><img src="images/logo.png" alt="" style="width: 250px; height: auto;"/></h4>
        <form action="regit.action" method="post" class="validation-form" id="regitform" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" name="name" required="required">
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">닉네임</label>
              <input type="text" class="form-control" id="nickname" name="nickname" required="required">
              <span style="display: none; color:red;" class="err" id="checkNick"></span>
              <div class="invalid-feedback">
                닉네임을 입력해주세요.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required="required">
            <span style="display: none; color:red;" class="err" id="checkEmail"></span>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="tel">휴대폰번호</label>
            <input type="tel" class="form-control" id="tel" name="tel" placeholder="010-1111-2222" required="required">
            <div class="invalid-feedback">
              휴대폰번호를 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요." required>
             &nbsp;<span style="font-size: 12pt; color: skyblue;">8자리 이상(영어, 숫자, 특수문자 각 1개 포함) </span>
            <div class="invalid-feedback">
              비밀번호를 확인해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="password_check">비밀번호확인</label>
            <input type="password" class="form-control" id="password_check" placeholder="비밀번호를 한번 더 입력해주세요." required>
            <div class="invalid-feedback">
              비밀번호를 확인해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address">주소</label><br />
            <input type="text" class="form-control" id="address" name="address" placeholder="클릭해주세요" required="required" readonly="readonly" onclick="searchAddr()">
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address2">상세주소</label>
            <input type="text" class="form-control" id="address2" name="address2" placeholder="상세주소를 입력해주세요."  required="required" >
          </div>
         
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required="required">
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          
          <div class="mb-4"></div>
        </form>
        <button class="btn btn-primary btn-lg btn-block" type="button" onclick="fn_submit()">가입 완료</button>
      </div>
    </div>
  </div>
<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');
      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
</script>



</body>
</html>