<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- START SIGMA IMPORTS -->
<script src="./Chart/src/sigma.core.js"></script>
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
<script src="./Chart/src/misc/sigma.misc.drawHovers.js"></script> 
<!-- END SIGMA IMPORTS -->
<script src="./Chart/plugins/sigma.plugins.animate/sigma.plugins.animate.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){

		let URL="http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
		const mykey = "6624eeed975e2734c6dd329911451502";

			
			$.getJSON(
					URL, {
						key:mykey,
						targetDt:"20190422"   //$("#inputDate").val()
						}, 
						(data, textStatus, xhr)=>{					
							const dataArr = data.boxOfficeResult.dailyBoxOfficeList;
							
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
							
/* 							//부트스트랩 적용
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
							
							$("#display").html(table); */
						});
		
		
</script>
  <style>
    #graph-container {
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      position: absolute;
    }
  </style>


<div id="container">
  <div id="graph-container"></div>
</div>


