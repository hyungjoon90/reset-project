<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>

		<div class="chart-container" style="display: block; width: 800px; height: 385px;">
		    <canvas id="chart-${chartSort }" ></canvas>
		</div>
		<script>
		console.log(chartData.data1);
		console.log(chartData.data2);
		var ctx = document.getElementById("chart-${chartSort}").getContext('2d');
		var myChart = new Chart(ctx, {
		    type: 'line',
		    data: {
		        datasets: [{
		        	data: [20, 50, 100, 75, 25, 0],
		            label: '접속자',
		            // This binds the dataset to the left y axis
		        }, {
		            data: [21, 5, 10, 20, 15, 30],
		            label: '로그인',
		            // This binds the dataset to the right y axis
		        }],
		        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
		    },
		    options: {}
		});
		</script>
