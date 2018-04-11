<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title> 
 
</head>   

<script>
   function goChart() {
      var hiddenPatId = document.getElementById('hiddenPatId').value;       
      location.href="http://localhost:8080/Pra01/main/chart.jsp?patId=" + hiddenPatId;      
   }
   
</script>
 
<body>
   <div id="side-bar" lang="ko">         
     <div class="logo">
       <nav class="menu">
         <ul>
           <li>
             <a href="#">COMPANY</a>
             <ul>
               <li><a href="#">ABOUT</a></li>
               <li><a href="#">HISTORY</a></li>
               <li><a href="#">CONTACT US</a></li>
             </ul>
           </li>
           <li>
             <a href="#">CHART</a>
             <ul>
               <li><a onclick="goChart()">CHART</a></li>             
               <li><a href="http://localhost:8080/Pra01/main/viewer/viewerMain.jsp">VIEWER</a></li>
             </ul>
           </li>            
         </ul>
       </nav>           
      </div> 
     </div>
</body>           
</html>