<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<title>�T���h�ʺA���</title>
</head>
<script type="text/javascript">
//�{�����J�ɥ����Ʈw���ocitys���
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
//�N��Ʃ�J�Ĥ@��select
function cityCreate(oJson,targetId){
	$('#town').empty();
	$('#road').empty();
	var i=0;
	$.each(oJson,function(){
		$('#'+targetId).append("<option value='"+oJson[i].city+"'>"+oJson[i].city+"</option>");
		i++;
	});
	//�p�G�Ĥ@��select���ܴN���Ʈw��towns���
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
//�N��Ʃ�J�ĤG��select
function townCreate(oJson,targetId){
	$('#town').empty();
	$('#road').empty();
	var i=0;
	$.each(oJson,function(){
		$('#'+targetId).append("<option value='"+oJson[i].town+"'>"+oJson[i].town+"</option>");
		i++;
	});
	//�p�G�ĤG��select���ܴN���Ʈw��roads���
	$('#'+targetId).change(function(){
		$.ajax({
			 type:"GET",
			 url:"jsonRSP.do",
			 data:{"action":"roaddata","town":$('#'+targetId).val()},
			 dataType:"json",
			//�N��Ʃ�J�ĤT��select
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
���G
<select id="city">
	<option value="�п��">�п��</option>
</select>
���G
<select id="town">
	<option value="3">�п��</option>
</select>
���W:
<select id="road">
<option value="3">�п��</option>
</select>
</body>
</html>