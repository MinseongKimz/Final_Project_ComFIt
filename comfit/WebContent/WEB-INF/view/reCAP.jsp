<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리캡차 실험</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
    async defer>
</script>
<script type="text/javascript">
  var onloadCallback = function() {
    alert("grecaptcha is ready!");
  };
</script>
</head>
<body>
 <form action="?" method="POST">
      <div class="g-recaptcha" data-sitekey="6LdisUkgAAAAAGPcmQqg7F5QD5tALOrZlqp0jFnf
"></div>
      <br/>
      <input type="submit" value="Submit">
    </form>




</body>
</html>