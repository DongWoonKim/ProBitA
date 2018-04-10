/**
 * canvas
 */
 
var picture = {
   canvas : null,
   context : null
};

/**
 * 0 : 펜
 * 1 : 직선
 * 2 : 사각형
 */
var eventObject = {
   mode: 0,   
   click : false,   
   x: 0,   
   y: 0,
};

function getPosition(event) {
    var x = event.pageX - canvas.offsetLeft - 200;
    var y = event.pageY - canvas.offsetTop;
    return {X : x, Y : y};
 }

// 지우개 기능
function clearCanvas(event)
{  
   var coors = getPosition(event);
   
   eventObject.x = coors.X; 
   eventObject.y = coors.Y;
   
   if (eventObject.click) { 
      // 픽셀 정리
      picture.context.clearRect(eventObject.x, eventObject.y, 50, 50);
       // 컨텍스트 리셋
      picture.context.beginPath();
   }
 
}
 
// 현재 클릭중인지 아닌지 구분?하기위한 변수 세팅
function setClickTrue(){    
   eventObject.click = true;
}

function setClickFalse(){
   eventObject.click = false;
}  

// 펜일 경우의 이벤트
function dragEvent(event) { 
   var g = picture.context; 
   g.moveTo(eventObject.x, eventObject.y);
   
   var coors = getPosition(event);
   
   eventObject.x = coors.X; 
   eventObject.y = coors.Y;     
   
   if (eventObject.click) { 
      g.lineTo(eventObject.x, eventObject.y); 
      g.stroke();      
   } 
}  

// 좌표 출력
function printXY(e){
   var g = picture.context;
   document.getElementById("x").innerHTML = e.x;
   document.getElementById("y").innerHTML = e.y;
} 

// 라인, 사각형 등 이전 좌표가 필요할 경우 이전좌표 세팅
function setBeforeXY(e){
   var g = picture.context;
   eventObject.x = e.x;
   eventObject.y = e.y;
   g.moveTo(e.x, e.y);
} 

// setBeforeXY 에서 세팅한 좌표부터 현재 좌표까지 직선을 그림
function drawLine(e){
   var g = picture.context;
   g.lineTo(e.x, e.y);
   g.stroke();
} 

// setBeforeXY 에서 세팅한 좌표부터 현재 좌표까지 사각형을 그림
function drawRect(e){
   var g = picture.context;
   g.rect(eventObject.x, eventObject.y, e.x-eventObject.x, e.y-eventObject.y);
   g.stroke();
   // g.fill(); 을 g.stroke() 대신 사용하면 속이 꽉찬 사각형을 그린다.
} 

// 각 경우에 따라서 이벤트리스너를 달아준다.
function mouseListener(){
   var mode = Number(eventObject.mode);
   picture.canvas.addEventListener("mousemove", printXY, false);
 
   switch(mode){
      case 0:
         document.getElementById("mode").innerHTML = "pen";
         picture.canvas.addEventListener("mousedown",setClickTrue, false);
         picture.canvas.addEventListener("mouseup", setClickFalse, false);
         picture.canvas.addEventListener("mousemove", dragEvent, false);
         break;   
      case 1:   
         document.getElementById("mode").innerHTML = "line";   
         picture.canvas.addEventListener("mousedown",setBeforeXY, false);   
         picture.canvas.addEventListener("mouseup", drawLine, false);   
         break;   
      case 2:   
         document.getElementById("mode").innerHTML = "rect";   
         picture.canvas.addEventListener("mousedown",setBeforeXY, false);   
         picture.canvas.addEventListener("mouseup", drawRect, false);
         break;
      case 3:   
         document.getElementById("mode").innerHTML = "erase";   
         picture.canvas.addEventListener("mousedown",setClickTrue, false);
         picture.canvas.addEventListener("mousemove", clearCanvas, false);
         picture.canvas.addEventListener("mouseup", setClickFalse, false);
         break;    
      default:   
         break;
   
   }
} 

// 이벤트 리스너 제거
function removeEvent(){
   picture.canvas.removeEventListener("mousedown",setClickTrue, false);   
   picture.canvas.removeEventListener("mouseup", setClickFalse, false);   
   picture.canvas.removeEventListener("mousemove", dragEvent, false);   
   picture.canvas.removeEventListener("mousedown",setBeforeXY, false);   
   picture.canvas.removeEventListener("mouseup", drawLine, false);   
   picture.canvas.removeEventListener("mouseup", drawRect, false);
   picture.canvas.removeEventListener("mousemove", clearCanvas, false);
    
}

// 모드 체인지
function changeMode(mode){
   removeEvent();   
   eventObject.mode = mode;   
   mouseListener();
}

//////////////////////////////////////////////////////////////////////////////

// input file 로 읽어온 이미지를 canvas에 배경으로 출력
function loadImg(e){     
   var file = e.target.files[0];
   var fileReader = new FileReader();   
   fileReader.readAsDataURL(file);
   fileReader.onload = function() {
      var output = new Image();   
      output.src = fileReader.result;          
      picture.context.drawImage(output, 0,0,400,300);   
      picture.context.stroke();   
   };
}
 
// canvas에 그려진 그림을 파일로 저장
function save(){       
   var image = picture.canvas.toDataURL("image/png");           
   var params = {'image':image};
   myAjax({
      method: "POST",
      url: "../inputChart.do",
      params:params,
      success:function (data) {    
         var arr = JSON.parse(data);   
         
         var myImage = new Image();
         myImage.src = arr[0].get;
         console.log(arr[0].get);
         
//         picture.context.clearRect(0, 0, 794, 1123);
//         picture.context.drawImage(myImage, 50, 50);
      }
   });
}
 

/////////////////////
//canvas에 그려진 그림을 파일로 저장
function save2(){    
   var image = picture.canvas.toDataURL("image/png");           
   var params = {'image':image};
   myAjax({
      method: "POST",
      url: "../inputChartImage.do",
      params:params,
      success:function (data) {    
 
      }
   });
}