//채팅방 나가기 클릭시
  	$("#chatExit").on("click", function(){
  		let roomId = $("#rooId_input").val();
  		console.log(roomId);
  		let post_seq = $("#post_seq_input").val();
    	console.log(post_seq);
  		location.href = "/chatting/chat_m_exit?roomId="+roomId+"&post_seq="+post_seq;
  	})
    //채팅멤버 클릭 -> 리스트 출력
    $(".yourProfile").on("click", function(e){
        $(".yourProfile").css('background-color','')
        $(this).css('background-color','rgb(237, 238, 239)');
        let roomId = $(this).find("#roomId").val();
        let post_seq = $(this).find("#post_seq").val();
        let loginId= '${loginSession.user_id}';
        $("#rooId_input").val(roomId);
        $("#post_seq_input").val(post_seq);
        console.log(post_seq,roomId);
       
        function ajax(){
        	 
        	  $(".yourProfile").on("click", function(e){
        		  clearInterval(timer);
        		  return 
        	 })
        	$.ajax({
        		url: "/chatting/chat_m_select"
        		, type: "get"
        		, data: {roomId : roomId, 
        				post_seq : post_seq}
        		, success: function(data){
        			console.log(data);
        			$("#chatting_before").remove();
        			$("#chatting_after").removeClass('d-none');
        			$("#yourPost").empty();
        			$("#yourPost").append(
        					"<img src='/user_profile/"+data.postMap.user_profile+"'>"
        					+'<div class="ms-2">'
        					+	'<span class="fw-bolder">'+ data.postMap.post_state +'</span>'
        					+	'<span class="font_gray ms-1">'+ data.postMap.post_title +'</span>'
        					+		'<div class="fw-bolder">'
        					+			'<span>'+data.postMap.price_selling+'원</span>'
        					+		'</div>'
        					+'</div>');
        			$("#reported_id").val(data.postMap.user_id);
        			$("#category_seq").val(data.postMap.post_seq);
        			console.log($("#reported_id").val()+$("#category_seq").val());
        			$(".contentDiv").empty();
        			for(var i=0; i<data.messagelist.length; i++){
        				if(data.messagelist[i].messageId==loginId){
        					var chat = 
        						"<div class='dynamicChat_r'>"
        						+"<span class='me-2 font_gray_b'>"
        	    				+	data.messagelist[i].upload_date
        	    				+"</span>"
        	    				+	data.messagelist[i].message 
        	    				+"</div>";
    	    				 $(".contentDiv").append(chat);
        				}else{
        					var chat = "<div class='dynamicChat_l'>" 
        	    				+ data.messagelist[i].message 
        	    				+ "<span class='ms-2 font_gray_b'>"+data.messagelist[i].upload_date+"</span></div>";
        	    				 $(".contentDiv").append(chat);
        				}
        			}
        			$(".contentDiv").scrollTop($(".contentDiv")[0].scrollHeight);   
        		}, error: function(e){
        			console.log(e);
        		}
        	})
        	
        }
        var timer = window.setInterval(ajax, 2500);
        
    })