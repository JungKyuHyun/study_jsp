<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/common/Head.jsp"></jsp:include>
  <style>
    #graph-container {
      top: 50;
      bottom: 50;
      left: 0;
      right: 0;
      position: absolute;
    }
  </style>
<!-- <script src="./Chart/src/sigma.core.js"></script>
<script src="./Chart/src/conrad.js"></script>
<script src="./Chart/src/utils/sigma.utils.js"></script>
<script src="./Chart/src/utils/sigma.polyfills.js"></script>
<script src="./Chart/src/sigma.settings.js"></script>
<script src="./Chart/src/classes/sigma.classes.dispatcher.js"></script>
<script src="./Chart/src/classes/sigma.classes.configurable.js"></script>
<script src="./Chart/src/classes/sigma.classes.graph.js"></script>
<script src="./Chart/src/classes/sigma.classes.camera.js"></script>
<script src="./Chart/src/classes/sigma.classes.quad.js"></script>
<script src="./Chart/src/classes/sigma.classes.edgequad.js"></script>
<script src="./Chart/src/captors/sigma.captors.mouse.js"></script>
<script src="./Chart/src/captors/sigma.captors.touch.js"></script>
<script src="./Chart/src/renderers/sigma.renderers.canvas.js"></script>
<script src="./Chart/src/renderers/sigma.renderers.webgl.js"></script>
<script src="./Chart/src/renderers/sigma.renderers.svg.js"></script>
<script src="./Chart/src/renderers/sigma.renderers.def.js"></script>
<script src="./Chart/src/renderers/webgl/sigma.webgl.nodes.def.js"></script>
<script src="./Chart/src/renderers/webgl/sigma.webgl.nodes.fast.js"></script>
<script src="./Chart/src/renderers/webgl/sigma.webgl.edges.def.js"></script>
<script src="./Chart/src/renderers/webgl/sigma.webgl.edges.fast.js"></script>
<script src="./Chart/src/renderers/webgl/sigma.webgl.edges.arrow.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.labels.def.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.hovers.def.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.nodes.def.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.edges.def.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.edges.curve.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.edges.arrow.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.edges.curvedArrow.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.edgehovers.def.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.edgehovers.curve.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.edgehovers.arrow.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.edgehovers.curvedArrow.js"></script>
<script src="./Chart/src/renderers/canvas/sigma.canvas.extremities.def.js"></script>
<script src="./Chart/src/renderers/svg/sigma.svg.utils.js"></script>
<script src="./Chart/src/renderers/svg/sigma.svg.nodes.def.js"></script>
<script src="./Chart/src/renderers/svg/sigma.svg.edges.def.js"></script>
<script src="./Chart/src/renderers/svg/sigma.svg.edges.curve.js"></script>
<script src="./Chart/src/renderers/svg/sigma.svg.labels.def.js"></script>
<script src="./Chart/src/renderers/svg/sigma.svg.hovers.def.js"></script>
<script src="./Chart/src/middlewares/sigma.middlewares.rescale.js"></script>
<script src="./Chart/src/middlewares/sigma.middlewares.copy.js"></script>
<script src="./Chart/src/misc/sigma.misc.animation.js"></script>
<script src="./Chart/src/misc/sigma.misc.bindEvents.js"></script>
<script src="./Chart/src/misc/sigma.misc.bindDOMEvents.js"></script>
<script src="./Chart/src/misc/sigma.misc.drawHovers.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sigma.js/1.2.1/plugins/sigma.plugins.animate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sigma.js/1.2.1/sigma.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sigma.js/1.2.1/sigma.require.js"></script>
<!-- END SIGMA IMPORTS -->
<!-- <script src="./Chart/plugins/sigma.plugins.animate/sigma.plugins.animate.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		const t = new Date();
		const cTime = t.getFullYear() + ""
		+((t.getMonth()+1)<10 ? "0"+(t.getMonth()+1):(t.getMonth()+1))+""
		+((t.getDate()-1)<10? "0"+(t.getDate()-1):(t.getDate()-1));
		
		$('#inputDate').attr("value",cTime);
		let URL="http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
		const mykey = "6624eeed975e2734c6dd329911451502";
		const selectDate = $("#inputDate").attr("value");
		console.log(selectDate);
		
		$("#chart").click(()=>{
			$.getJSON(
					URL, {
						key:mykey,
						targetDt:$("#inputDate").val()
						}, 
						(data, textStatus, xhr)=>{					
							const dataArr = data.boxOfficeResult.dailyBoxOfficeList;
							
							//부트스트랩 적용
							let table = '<table class="table"><thead class="text-center"><tr><th>순위</th>';
					            table += '<th>영화제목</th>'
					            table += '<th>개봉일</th>'
					           	table += '<th>관객수('+ $("#inputDate").val() +')</th>'
					            table += '<th>누적관객수</th>'
					            table += '<th>누적 매출액</th></tr></thead>';
					        $.each(dataArr, (i, item)=>{
					        table+="<tbody class='text-center'><tr></td><td>"+ item.rank +"</td><td>"+item.movieNm+"</td><td>"+item.openDt+"</td><td>" +(item.audiCnt*1).toLocaleString() +"</td><td>" +(item.audiAcc*1).toLocaleString()+"</td><td>"+(item.salesAcc*1).toLocaleString() + "</td></tr>";
					        });
							table+="</tbody></table>";
							
							$("#display").html(table);
						});
		})
		
		$("#graph").click(()=>{
			$.getJSON(
					URL, {
						key:mykey,
						targetDt:$("#inputDate").val()
						}, 
						(data, textStatus, xhr)=>{
							const dataArr = data.boxOfficeResult.dailyBoxOfficeList;
							const labelArr = new Array();
							const dataArrVal = new Array();
							for(let i=0;i<dataArr.length;i++){
								labelArr[i]=dataArr[i].movieNm;
								dataArrVal[i] = dataArr[i].audiAcc;
							}
							
							
							
							$("#display").html('<canvas id="myChart" width="400" height="200"></canvas>');
							var ctx = document.getElementById('myChart').getContext('2d');
							var myChart = new Chart(ctx, {
							    type: 'horizontalBar',
							    data: {
							        labels: labelArr,//[dataArr[0].movieNm, 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
							        datasets: [{
							            label: ': 누적관객수',
							            data: dataArrVal,//[12, 19, 3, 5, 2, 3],
							            backgroundColor: [
							                'rgba(255, 99, 132, 0.2)',
							                'rgba(54, 162, 235, 0.2)',
							                'rgba(255, 206, 86, 0.2)',
							                'rgba(75, 192, 192, 0.2)',
							                'rgba(153, 102, 255, 0.2)',
							                'rgba(255, 159, 64, 0.2)',
							                'rgba(255, 255, 44, 0.2)',
							                'rgba(91, 255, 44, 0.2)',
							                'rgba(57, 255, 208, 0.2)',
							                'rgba(31, 94, 255, 0.2)'
							            ],
							            borderColor: [
							                'rgba(255, 99, 132, 1)',
							                'rgba(54, 162, 235, 1)',
							                'rgba(255, 206, 86, 1)',
							                'rgba(75, 192, 192, 1)',
							                'rgba(153, 102, 255, 1)',
							                'rgba(255, 159, 64, 1)',
							                'rgba(255, 255, 44, 1)',
							                'rgba(91, 255, 44, 1)',
							                'rgba(57, 255, 208, 1)',
							                'rgba(31, 94, 255, 1)'
							            ],
							            borderWidth: 1
							        }]
							    },
							    options: {
							        scales: {
							            yAxes: [{
							                ticks: {
							                    beginAtZero: true
							                }
							            }]
							        }
							    }
							});
						});
		});//그래프 클릭끝
		
		$("#graph1").click(()=>{
			$.getJSON(
					URL, {
						key:mykey,
						targetDt:$("#inputDate").val()
						}, 
						(data, textStatus, xhr)=>{
							console.log("#graph1 이벤트 실행성공 : " +textStatus)
							const dataArr = data.boxOfficeResult.dailyBoxOfficeList;
							const labelArr = new Array();
							const dataArrVal = new Array();
							for(let i=0;i<dataArr.length;i++){
								labelArr[i]=dataArr[i].movieNm;
								dataArrVal[i] = dataArr[i].audiAcc;
							}
							//$("#display").html('<canvas id="myChart" width="400" height="200"></canvas>');
							var i,
						    s,
						    o,
						    L = 10,
						    N = 10,
						    E = 100,
						    g = {
						      nodes: [],
						      edges: []
						    },
						    step = 0;

						// Generate a random graph:
						for (i = 0; i < N; i++) {
						  o = {
						    id: 'n' + i,
						    label: 'Node ' + i,
						    circular_x: L * Math.cos(Math.PI * 2 * i / N - Math.PI / 2),
						    circular_y: L * Math.sin(Math.PI * 2 * i / N - Math.PI / 2),
						    circular_size: Math.random(),
						    circular_color: '#' + (
						      Math.floor(Math.random() * 16777215).toString(16) + '000000'
						    ).substr(0, 6),
						    grid_x: i % L,
						    grid_y: Math.floor(i / L),
						    grid_size: 1,
						    grid_color: '#ccc'
						  };

						  ['x', 'y', 'size', 'color'].forEach(function(val) {
						    o[val] = o['grid_' + val];
						  });

						  g.nodes.push(o);
						}

						for (i = 0; i < E; i++)
						  g.edges.push({
						    id: 'e' + i,
						    source: 'n' + (Math.random() * N | 0),
						    target: 'n' + (Math.random() * N | 0)
						  });

						// Instantiate sigma:
						s = new sigma({
						  graph: g,
						  container: 'graph-container',
						  settings: {
						    animationsTime: 1000
						  }
						});

						setInterval(function() {
						  var prefix = ['grid_', 'circular_'][step = +!step];
						  sigma.plugins.animate(
						    s,
						    {
						      x: prefix + 'x',
						      y: prefix + 'y',
						      size: prefix + 'size',
						      color: prefix + 'color'
						    }
						  );
						}, 2000);
								
						});
		});//그래프1 클릭끝
	
		$('#testDatepicker').datetimepicker({
		    icons: {
		      time: "tim-icons icon-watch-time",
		      date: "tim-icons icon-calendar-60",
		      up: "fa fa-chevron-up",
		      down: "fa fa-chevron-down",
		      previous: 'tim-icons icon-minimal-left',
		      next: 'tim-icons icon-minimal-right',
		      today: 'fa fa-screenshot',
		      clear: 'fa fa-trash',
		      close: 'fa fa-remove'
		    }
		});
		
		
	});

</script>


<body>
  
  
<div class="wrapper ">
  <!-- left_side_menu  -->
  <jsp:include page="/common/Left.jsp"></jsp:include>
  
  <div class="main-panel">
    <!-- Navbar -->
	<jsp:include page="/common/Top.jsp"></jsp:include>
	
    <div class="content">
      <div class="container-fluid">
         <!-- your content here -->
         
         
         <div class="form-group">
		    <label class="label-control">일별 박스오피스</label>
		    <input type="text" class="form-control datetimepicker" id="inputDate"/>
		</div>
        <button class="btn btn-primary animation-on-hover" type="button" id="chart">표 보기</button>
		<button class="btn btn-primary animation-on-hover" type="button" id="graph">막대 그래프</button>
		<button class="btn btn-primary animation-on-hover" type="button" id="graph1">관계도</button>
        <div id="display"></div>
		<div id="graph-container"></div>
      
      
      </div>
    </div>
    

    
    <!-- wrapper, main-panel end -->
  </div>
</div>
    <!-- footer -->
 	<jsp:include page="/common/Bottom.jsp"></jsp:include>

</body>
</html>