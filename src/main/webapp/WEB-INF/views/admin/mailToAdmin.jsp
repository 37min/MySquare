<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<img src = "image/header/menu0.png">

<div style="width:50%; margin-left:25%; margin-right:25%;'">
   <table style="background:none; width:400px; ">
      <tbody style="width:350px;">
      <tr>
         <th>
            관리자에게 메일을 보내세요!
         </th>
      </tr>
      <tr >
         <td>
            <textarea rows="10" cols="90" id="mailContents" ></textarea>
         <td>
      </tr>
      <tr>
         <td >
            <button id="send" class="send">메일 보내기</button>
            <button id="goback" class="send">뒤로가기</button>
         </td>
      </tr>
      </tbody>
   </table>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
   $("#goback").click(function(){
      history.go(-1);
   });

   $("#send").click(function(){
      
      if( $("#mailContents").val() == "" ) alert("내용을 입력하세요!");
      
      else
      {
         $("body").css({"background":"black"});
         $("body").css({"z-index":"1000"});
         $("body").css({"opacity":"0.2"});
         var mailContents = $("#mailContents").val();
         
         $.ajax({
            type:"get", //get방식으로
            url: "mailToAdminProcess.htm", //해당 url로
            data : {mailContents : mailContents}, //data를 갖고
            dataType : "json", //반환받는 data type은 JSON 형태
            success:function(data){  //비동기 성공했을 때
                  
                  if( data.result == 1 )
                  {
                     alert("메일을 성공적으로 발송하였습니다.");
                  }
                  else if ( data.result == 0 )
                  {
                     alert("메일 발송을 실패하였습니다.");
                  }
                  $("body").css({"background":"none"});
                  $("body").css({"z-index":"1"});
                  $("body").css({"opacity":"1"});
                  history.go(-1);
               } ,
            error:function(data){
               $("body").css({"background":"none"});
               $("body").css({"z-index":"1"});
               $("body").css({"opacity":"1"});
               alert("메일 발송을 실패하였습니다.");
               history.go(-1);
               }
         });
      }
      
   });
   
</script>