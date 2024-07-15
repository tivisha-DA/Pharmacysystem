{$title = 'Dashboard'}
{extends file="Layouts/member.tpl"}
{block name=body}
	<div class="main-content">
	
		{include file='Elements/member_topbar.tpl'}
		
		{literal}
			<script type="text/javascript">
			jQuery(document).ready(function($)
			{
				{/literal}
				// Sample Toastr Notification
				setTimeout(function()
				{
					var opts = {
						"closeButton": true,
						"debug": false,
						"positionClass": rtl() || public_vars.$pageContainer.hasClass('right-sidebar') ? "toast-top-left" : "toast-top-right",
						"toastClass": "black",
						"onclick": null,
						"showDuration": "300",
						"hideDuration": "1000",
						"timeOut": "5000",
						"extendedTimeOut": "1000",
						"showEasing": "swing",
						"hideEasing": "linear",
						"showMethod": "fadeIn",
						"hideMethod": "fadeOut"
					};
			
					toastr.success("Welcome back {$user['username']}!", "Greetings", opts);
				}, 3000);
				{literal}
			});
			</script>
		{/literal}
	
		<div class="row">

			<div class="col-md-12 col-xs-12">
				<blockquote class="blockquote-default">
					<h1 class="h1">
						<strong>Welcome To OPS</strong>
						<span class="badge badge-primary" style="font-size:25px;">
							<i class="fa fa-heartbeat"></i>
						</span>
					</h1>
				</blockquote>
				
			</div>
			
			<div class="clear visible-xs"></div>
		</div>
		<br>


		<div class="row">
			<div class="col-sm-4">
			
				<a href="medicines.php" class="tile-title tile-green">
					
					<div class="icon">
						<i class="glyphicon glyphicon-leaf"></i>
					</div>
					
					<div class="title">
						<h3>List of Medicines</h3>
						<p>-</p>
					</div>
				</a>
				
			</div>
			
			<div class="col-sm-4">
				<a href="orders.php" class="tile-title tile-primary">
					<div class="icon">
						<i class="glyphicon glyphicon-shopping-cart"></i>
					</div>
					<div class="title">
						<h3>List of Orders</h3>
						<p>-</p>
					</div>
				</a>
			</div>
			
			<div class="col-sm-4">
				<a href="customer_support.php" class="tile-title tile-blue">
					<div class="icon">
						<i class="glyphicon glyphicon-question-sign"></i>
					</div>
					<div class="title">
						<h3>Customer Support</h3>
						<p>-</p>
					</div>
				</a>
			</div>
		</div>
		<br />
		
		<!-- Footer -->
		{include file='Elements/member_bottombar.tpl'}
	</div>
{/block}
{block name=scripts}
	<script type="text/javascript">
		$.noConflict();
		jQuery( document ).ready( function( $ ) {
			var table = $( '.datatable' );
			
			// Initialize DataTable
			datatable = table.DataTable( {
				"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"bStateSave": true
			});
			
			// Initalize Select Dropdown after DataTables is created
			table.closest( '.dataTables_wrapper' ).find( 'select' ).select2( {
				minimumResultsForSearch: -1
			});

			table.closest( '.dataTables_wrapper' ).addClass( 'table-responsive' );
		} );
	</script>
	{* <script src="assets/js/morris.min.js"></script> *}
	{* <script src="../../assets/member/js/neon-charts.js"></script> *}
	{literal}
	<script>
		$(document).ready(function(){
			// Morris.js Graphs
				if(typeof Morris != 'undefined')
				{
					// Bar Charts
					// Morris.Bar({
					// 	element: 'chart3',
					// 	axes: true,
					// 	data: [
					// 		{x: '2013 Q1', y: getRandomInt(1,10), z: getRandomInt(1,10), a: getRandomInt(1,10)},
					// 		{x: '2013 Q2', y: getRandomInt(1,10), z: getRandomInt(1,10), a: getRandomInt(1,10)},
					// 		{x: '2013 Q3', y: getRandomInt(1,10), z: getRandomInt(1,10), a: getRandomInt(1,10)},
					// 		{x: '2013 Q4', y: getRandomInt(1,10), z: getRandomInt(1,10), a: getRandomInt(1,10)}
					// 	],
					// 	xkey: 'x',
					// 	ykeys: ['y', 'z', 'a'],
					// 	labels: ['Facebook', 'LinkedIn', 'Google+'],
					// 	barColors: ['#707f9b', '#455064', '#242d3c']
					// });
					
					// // Stacked Bar Charts
					// Morris.Bar({
					// 	element: 'chart4',
					// 	data: [
					// 		{x: '2013 Q1', y: getRandomInt(1,10), z: getRandomInt(1,20), a: getRandomInt(1,20)},
					// 		{x: '2013 Q2', y: getRandomInt(1,11), z: getRandomInt(1,10), a: getRandomInt(1,14)},
					// 		{x: '2013 Q3', y: getRandomInt(1,20), z: getRandomInt(1,20), a: getRandomInt(1,19)},
					// 		{x: '2013 Q4', y: getRandomInt(1,15), z: getRandomInt(1,15), a: getRandomInt(1,11)}
					// 	],
					// 	xkey: 'x',
					// 	ykeys: ['y', 'z', 'a'],
					// 	labels: ['Facebook', 'LinkedIn', 'Google+'],
					// 	stacked: true,
					// 	barColors: ['#ffaaab', '#ff6264', '#d13c3e']
					// });
					
					// // Donut
					// Morris.Donut({
					// 	element: 'chart5',
					// 	data: [
					// 		{label: "Download Sales", value: getRandomInt(10,50)},
					// 		{label: "In-Store Sales", value: getRandomInt(10,50)},
					// 		{label: "Mail-Order Sales", value: getRandomInt(10,50)}
					// 	],
					// 	colors: ['#707f9b', '#455064', '#242d3c']
					// });
					
					// // Donut Colors
					// Morris.Donut({
					// 	element: 'chart6',
					// 	data: [
					// 		{label: "Games", value: getRandomInt(10,50)},
					// 		{label: "Photos", value: getRandomInt(10,50)},
					// 		{label: "Apps", value: getRandomInt(10,50)},
					// 		{label: "Other", value: getRandomInt(10,50)},
					// 	],
					// 	labelColor: '#303641',
					// 	colors: ['#f26c4f', '#00a651', '#00bff3', '#0072bc']
					// });
					
					// // Donut Formatting
					// Morris.Donut({
					// 	element: 'chart7',
					// 	data: [
					// 		{value: 70, label: 'foo', formatted: 'at least 70%' },
					// 		{value: 15, label: 'bar', formatted: 'approx. 15%' },
					// 		{value: 10, label: 'baz', formatted: 'approx. 10%' },
					// 		{value: 5, label: 'A really really long label', formatted: 'at most 5%' }
					// 	],
					// 	formatter: function (x, data) { return data.formatted; },
					// 	colors: ['#b92527', '#d13c3e', '#ff6264', '#ffaaab']
					// });
					
					
					// // Line Chart
					var day_data = [
						{"elapsed": "I", "value": 34},
						{"elapsed": "II", "value": 24},
						{"elapsed": "III", "value": 3},
						{"elapsed": "IV", "value": 12},
						{"elapsed": "V", "value": 13},
						{"elapsed": "VI", "value": 22},
						{"elapsed": "VII", "value": 5},
						{"elapsed": "VIII", "value": 26},
						{"elapsed": "IX", "value": 12},
						{"elapsed": "X", "value": 19}
					];
					
					Morris.Line({
						element: 'chart8',
						data: day_data,
						xkey: 'elapsed',
						ykeys: ['value'],
						labels: ['value'],
						parseTime: false,
						lineColors: ['#242d3c']
					});
					
					
					
					// Goals
					// var decimal_data = [];
					
					// for (var x = 0; x <= 360; x += 10) {
					// 	decimal_data.push({
					// 	x: x,
					// 	y: Math.sin(Math.PI * x / 180).toFixed(4)
					// 	});
					// }
					
					// Morris.Line({
					// 	element: 'chart9',
					// 	data: decimal_data,
					// 	xkey: 'x',
					// 	ykeys: ['y'],
					// 	labels: ['sin(x)'],
					// 	parseTime: false,
					// 	goals: [-1, 0, 1],
					// 	lineColors: ['#d13c3e']
					// });
				
					
					// Area Chart
					// Morris.Area({
					// 	element: 'chart10',
					// 	data: [
					// 		{ y: '2006', a: getRandomInt(10,100), b: getRandomInt(10,100) },
					// 		{ y: '2007', a: getRandomInt(10,100),  b: getRandomInt(10,100) },
					// 		{ y: '2008', a: getRandomInt(10,100),  b: getRandomInt(10,100) },
					// 		{ y: '2009', a: getRandomInt(10,100),  b: getRandomInt(10,100) },
					// 		{ y: '2010', a: getRandomInt(10,100),  b: getRandomInt(10,100) },
					// 		{ y: '2011', a: getRandomInt(10,100),  b: getRandomInt(10,100) },
					// 		{ y: '2012', a: getRandomInt(10,100), b: getRandomInt(10,100) }
					// 	],
					// 	xkey: 'y',
					// 	ykeys: ['a', 'b'],
					// 	labels: ['Series A', 'Series B']
					// });
				}
		});

		function getRandomInt(min, max) 
		{
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
	</script>
	{/literal}
{/block}