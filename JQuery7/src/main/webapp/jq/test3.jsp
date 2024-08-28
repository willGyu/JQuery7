<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery 반드시 라이브러리 추가 -->
<script src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//alert("test3.jsp");
		
		// 특정 요소의 속성의 값을 가져오기
		var c = $('h2').css('color');
		alert(c);
		
		// 특정 요소의 속성의 값을 변경하기
		$('h2').css('color','green');
// 		$('h2:first').css('color','yellow');
// 		$('h2:last').css('color','red');
		
		// function 속성을 사용하여 값 변경
		var colorArr = ["red","orange","yellow"];
		//$('h2').css('color',colorArr[0]);
		$('h2').css('color',function(index,value){
				//alert(index +"/"+value);
				return colorArr[index];
		});
		
		$('h2').css('background','black');
		
		// 한번에 다양한 속성정보를 변경
		$('h2').css({
			//"속성":"값", ....
			color : 'red',
			background : 'yellow'			
		});
		
		// 글자색(빨,주,노) + 배경색(검)
		$('h2').css({
			color : function(idx,a,b){
				//alert(idx+"/"+a+"/"+b);
				return colorArr[idx];
			},
			background : 'black'			
		});
		
		
		//////////////////////////////////////////
		// 태그 속성에 접근제어 attr()
		
		var imgValue = $('img').attr("src");
		alert(imgValue);
		
		$('img').attr("src","ico_kakao.png");
		
		// img태그에 'border'속성의 값을 5 설정
		$('img').attr('border',5);
		
		// 이미지 마다 다르게 설정 (5,10,15)
		$('img').attr('border',function(idx,attr){
			//alert(idx+"/"+attr); 인덱스, 설정된 속성값
			return (idx+1)*5;
		});
		
		// width, height, border 설정을 한번에 처리
		// -> 가로길이를 모두 다르게 설정
		$('img').attr({
			"width":function(idx){
				return (idx+1)*100;
			},
			"height":100,
			"border":5
		});
		
		
	});

</script>
<style type="text/css">
 img{
    background: 
 }

</style>
</head>
<body>
	<h1>test3.jsp</h1>
	
	<h2>head-0</h2>
	<h2>head-1</h2>
	<h2>head-2</h2>
	
	<h2>head-3</h2>
	
	<h3>head-4</h3>
	
	<hr>
	
	<img src="ico_instargram_r.png"   >
	<img src="ico_kakao.png">
	<img src="ico_phone.png">
	
	
	

</body>
</html>