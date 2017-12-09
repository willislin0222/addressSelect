<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<title>三階層動態選單</title>
</head>
<script type="text/javascript">
//程式載入時先到資料庫取得citys資料
$(document).ready(function (){
	$.ajax({
		 type:"GET",
		 url:"jsonRSP.do",
		 data:"&action=citydata",
		 dataType:"json",
		 success:function (data){
			 cityCreate(data,'city');
		    },
         error:function(){alert("error")}
    })
})
//將資料放入第一個select
function cityCreate(oJson,targetId){
	$('#town').empty();
	$('#road').empty();
	var i=0;
	$.each(oJson,function(){
		$('#'+targetId).append("<option value='"+oJson[i].city+"'>"+oJson[i].city+"</option>");
		i++;
	});
	//如果第一個select改變就到資料庫取towns資料
	$('#'+targetId).change(function(){
		$.ajax({
			 type:"GET",
			 url:"jsonRSP.do",
			 data:{"action":"towndata","city":$('#'+targetId).val()},
			 dataType:"json",
			 success:function (data){
				 townCreate(data,'town');
		     },
            error:function(){alert("error")}
        })
	})
}
//將資料放入第二個select
function townCreate(oJson,targetId){
	$('#town').empty();
	$('#road').empty();
	var i=0;
	$.each(oJson,function(){
		$('#'+targetId).append("<option value='"+oJson[i].town+"'>"+oJson[i].town+"</option>");
		i++;
	});
	//如果第二個select改變就到資料庫取roads資料
	$('#'+targetId).change(function(){
		$.ajax({
			 type:"GET",
			 url:"jsonRSP.do",
			 data:{"action":"roaddata","town":$('#'+targetId).val()},
			 dataType:"json",
			//將資料放入第三個select
			 success:function (data){
				 $('#road').empty();
				 var j=0;
				 $.each(data,function(){
					 $('#road').append("<option value='"+data[j].road+"'>"+data[j].road+"</option>");
					 j++;
				 })
		     },
            error:function(){alert("error")}
        })
	})
}

</script>
<body>
縣：
<select id="city">
	<option value="請選擇">請選擇</option>
</select>
市：
<select id="town">
	<option value="3">請選擇</option>
</select>
路名:
<select id="road">
<option value="3">請選擇</option>
</select>
</body>
</html>