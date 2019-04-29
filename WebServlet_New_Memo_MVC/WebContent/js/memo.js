$(document).ready(function(){
	$('#message').click(function(){
		if($('#id').val() == ""){
			alert("ID 입력");
			$('#id').focus();
		}else{
			$.ajax(
					{
					   url:"Memoid", //Ex10_ok.jsp	
					   data:{id:$('#id').val()}, //MemoId?id=aa
					   dataType:"html", //xml , json , script , html , text
					   success:function(responsedata){
						   console.log(">" + responsedata + "<");
						   if(responsedata == "true"){
							   alert("사용가능");
							   $('#email').focus();
						   }else{
							   alert("사용불가능");
							   $('#id').val("");
							   $('#id').focus();
						   }
					   },
					   error:function(){
						   
					   }
					}		
				);
			
		}
	});
});