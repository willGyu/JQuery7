<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery 반드시 라이브러리 추가 (CDN : Content Delivery Network) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		 //alert("test7.jsp");
		 
		 // 동기방식 : 서버의 정보와 동일 형태로 처리되는 방식
		 //         => 사용자의 요청이 처리가 완료될때까지 코드실행이 멈춤(대기)
		 //         => 페이지 이동하는 형태(주로 발생)
		 
		 // 비동기방식 (AJAX) : 서버의 정보와 다른 형태로 처리되는 방식
		 //                  => 사용자의 요청이 처리 완료될때를 기다지않고 바로 처리
		 //                  => 페이지 이동 X (한 화면에서 처리), 정보 불러오기(파일업로드/다운로드, 이메일전송)
		 //                    화면의 전환없이 데이터를 처리
		 
		 // AJAX(Asyncronous JavaScript And XML) : 비동기 방식의 JavaScript,XML
		 
		 // $.ajax() : 데이터를 서버에 HTTP통신방식으로 정보 전달(비동기 방식)
		 // https://api.jquery.com/jQuery.ajax/#jQuery-ajax-url-settings
// 		 $.ajax({
// 			 url : "전송 페이지(액션페이지)",
// 			 type : "전송 방식(get(기본),post)",
// 			 data : "전송할 데이터(파라메터)",
// 			 dataType : "요청한 데이터 타입(html(기본),xml,text,json)",
// 			 success : function(data){ data : 전달받은 정보
// 				 성공시 수행할 동작
// 			 },
// 			 error : function(data){ data : 실패정보
// 				 실패시 수행할 동작
// 			 },
// 			 complete : function(){
// 				 ajax동작이 완료시 수행하는 동작
// 			 }
// 		 });
		 
		 
		 
		 $('body').css("background","orange");
		 
		 // 동기 방식으로 string1.jsp 조회
		 //location.href="string1.jsp";
		 
		 // 비동기 방식으로 string1.jsp 조회
		 $.ajax({
			 url : "string1.jsp",
			 type : "get",
			 dataType : "html",
			 success : function(data){
				// alert(" 비동기방식으로 string1.jsp 갔다옴 ");
				 //alert(data);
				 $("body").append(data);
			 },
			 error : function(data){
				 alert(" 비동기방식 실행에 문제가 있음 ");
				 //alert(data);
				 console.log(data);
			 }
		 });
		 
		 
		 // string2.jsp 비동기방식 데이터처리 
		 // 정보 전달 + 처리된 결과 가져오기
		 $.ajax({
			 url:"string2.jsp",
			 type : "get",
			 //data : name="itwill", (x) { 속성:값 } 사용해서 객체 형태로 전달
			 data : {name:"itwill",birth:240830}, 
			 success : function(data){
				 alert(" string2.jsp 페이지 다녀옴 ");
				 $("body").append("<hr> 정보 전달 + 처리된 결과 가져오기 ");
				 $('body').append(data);
			 }
		 });
		 
		 
		 // XML (eXtensible Markup Language) : 확장 가능한 마크업 언어
		 //  => HTML형태 처럼  태그를 사용해서 데이터를 저장하는 언어
		 //  => 다양한 플랫폼에서 사용가능한 타입(복잡한 데이터구조 표현가능)
		
		 
		// xml1.jsp or xml2.xml를 비동기방식으로 데이터 처리
		$.ajax({
			//url : "xml1.jsp",
			//type : "get",
			url : "xml2.xml",
			success : function(data){
				alert("xml1.jsp 비동기 방식으로 페이지 다녀옴");
				$("body").append(" <hr> xml 비동기 방식 처리 ");
				//alert(data);
				console.log(data);
				//$('body').append(data);
				
				$(data).find("person").each(function(){
				  	  	var name = $(this).find("name").text();	
				  	  	var gender = $(this).find("gender").text();	
				  	  	var tel = $(this).find("tel").text();	
				  	  	
					    //alert(name);
					    $('body').append("<hr> 이름 : "+name +", 성별 : "+gender+", 전화번호 : "+tel+"<hr>" );
				});
				
			}			
		});
		 
		 
	
// 		var title;
// 		var tag;
		// jtbc RSS 서비스정보를 비동기 방식으로 처리
		$.ajax({
			url : "https://fs.jtbc.co.kr/RSS/sports.xml",
			success : function(data){
				alert(" JTBC 뉴스 정보에 접근 성공 ! ");
				console.log(data);
				// id = news에 기사제목 출력
				$(data).find("item").each(function(){
					   var title = $(this).find("title").text();
					   var link = $(this).find("link").text();
					   // $("#news").append(title+"<hr>");
					   
					   var tag = "<a href='"+link+"'>"+title+"</a>";
					   
// 					   var tag = "";
// 					       tag += "<a href='"+link+"'>"
// 					       tag += title
// 					       tag += "</a>";
					    
					    // ` ` (백틱)
// 						var tag = `
// 						   <a href="link"> ${title} </a>
// 						`;
					       
					       
					   $("#news").append(tag+"<hr>");
					   
					   
					   
				});
			}	
			
		});
		
		// $("#news").append(tag+"<hr>"); (x)
	   	 
		 
		 
		
	});// jqeury

</script>
</head>
<body>
	<h1>test7.jsp</h1>
	
	<h1> 비동기방식 (AJAX) </h1>
	
	<hr>
	
	<div id="news"></div>
	
	
</body>
</html>
