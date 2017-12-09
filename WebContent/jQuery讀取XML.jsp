<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
		$.ajax({
			 url:'data.xml', //外部的xml檔
			 type: 'GET',
			 dataType: 'xml',
			 success: parseXml,
			 error : function(){
			 	alert("XML讀取失敗");
			 }
		});

		function parseXml(xml){
			alert("xml讀取成功");
			 $(xml).find("user").each(function(){   //取得xml父節點 
			  var total=$(xml).find("user").length; //xml的總筆數
			  var city = $(this).children("username").text();
// 			  var username = $(this).children("username").text();
// 			  var email = $(this).children("email").text();
			  console.log(city );
// 			  alert(total + " - " + userid + " - " + username + " - " + email)
			 });
		}


	</script>  
</head>
<body>

</body>
</html>