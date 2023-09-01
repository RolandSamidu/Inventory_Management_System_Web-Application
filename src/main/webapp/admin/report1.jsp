<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>INSPIRED - ADMIN</title>
<link rel="shortcut icon" type="image/png"
	href="../assets/images/logos/logo.png" />
<link rel="stylesheet" href="../assets/css/styles.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>

<body style="background-color: lightblue;">
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

		<!-- Side bar Start -->
		<aside class="left-sidebar" style="background-color: white;">
			<!-- Side bar scroll-->
			<div>
				<div
					class="brand-logo d-flex align-items-center justify-content-between">

					<div
						class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
						id="sidebarCollapse">
						<i class="ti ti-x fs-8"></i>
					</div>
				</div>
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav scroll-sidebar" data-simplebar="">
					<ul id="sidebarnav">
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
							class="hide-menu">Home</span></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="adminDashboard.jsp" aria-expanded="false"> <span>
									<i class="ti ti-layout-dashboard"></i>
							</span> <span class="hide-menu">DASHBOARD</span>
						</a></li>
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
							class="hide-menu">COMPONENTS</span></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="viewStockDetails.jsp" aria-expanded="false"> <span>
									<i class="ti ti-article"></i>
							</span> <span class="hide-menu">Stocks Details</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="viewUserDetails.jsp" aria-expanded="false"> <span>
									<i class="ti ti-users"></i>
							</span> <span class="hide-menu">Users</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="purchase.jsp" aria-expanded="false"> <span> <i
									class="ti ti-receipt"></i>
							</span> <span class="hide-menu">Purchase</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="reportsHome.jsp" aria-expanded="false"> <span> <i
									class="ti ti-files"></i>
							</span> <span class="hide-menu">Reports</span>
						</a></li>

						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
							class="hide-menu">AUTH</span></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="../logout.jsp" aria-expanded="false"> <span> <i
									class="ti ti-logout"></i>
							</span> <span class="hide-menu">Logout</span>
						</a></li>
					</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<!--  Sidebar End -->



		<!--  Main wrapper -->
		<div class="body-wrapper">
			<!--  Header Start -->
			<header class="app-header">
				<nav class="navbar navbar-expand-lg navbar-light">
					<ul class="navbar-nav">
						<li class="nav-item d-block d-xl-none"><a
							class="nav-link sidebartoggler nav-icon-hover"
							id="headerCollapse" href="javascript:void(0)"> <i
								class="ti ti-menu-2"></i>
						</a></li>
						<li class="nav-item"><a class="nav-link nav-icon-hover"
							href=""> <i class="ti ti-bell-ringing"></i>

						</a></li>
					</ul>
					<div class="navbar-collapse justify-content-end px-0"
						id="navbarNav">
						<ul
							class="navbar-nav flex-row ms-auto align-items-center justify-content-end">

							<li class="nav-item dropdown"><a
								class="nav-link nav-icon-hover" href="" id="drop2"
								data-bs-toggle="dropdown" aria-expanded="false"> <img
									src="../assets/images/profile/user-1.jpg" alt="" width="35"
									height="35" class="rounded-circle">
							</a></li>
						</ul>
					</div>
				</nav>
			</header>
			<!--  Header End -->
			<div class="container-fluid">

				<div class="row">
					<div class="col-lg-6 d-flex align-items-strech">
						<div class="card w-100">
							<div class="card-body p-4">
								<div
									class="d-sm-flex d-block align-items-center justify-content-between mb-9">
									<!-- <div class="mb-3 mb-sm-0">
										<label for="date">Enter Date:</label> <input type="text"
											id="date" placeholder="YYYY-MM-DD" name="email">



										<button type="submit" class="btn btn-dark">View Items</button>
									</div> -->
									<div class="mb-3 mb-sm-0">
										<h5 class="card-title fw-semibold">Sales on Last Week</h5>
									</div>
									<div>
										<button class="btn btn-dark" onclick="showTable()">View
											Table</button>
									</div>

								</div>
								<div class="table-responsive row">

									<!-- Table 1 -->

									<table class="table text-nowrap mb-0 align-middle" id="myTable"
										style="display: none;">
										<thead class="text-dark fs-4">
											<tr>
												<th class="border-bottom-0" scope="col">Sales Date</th>
												<th class="border-bottom-0" scope="col">Total On Date</th>
											</tr>
										</thead>
										<tbody>
											<%
											try {
												Connection con = ConnectionProvider.getCon();
												Statement st = con.createStatement();
												String query = "SELECT * FROM purchase WHERE date >= CURDATE() - INTERVAL 7 DAY ORDER BY date DESC";
												ResultSet rs = st.executeQuery(query); // Declare and execute the query

												Map<String, String> latestSalesByDate = new HashMap<String, String>();
												// Map to store the latest sales data by date

												while (rs.next()) {
													String salesDate = rs.getString("date");
													String totalOnDate = rs.getString("totalprice");

													if (!latestSalesByDate.containsKey(salesDate)) {
												latestSalesByDate.put(salesDate, totalOnDate); // Store the latest sales data for each date
													}
												}

												rs.close(); // Close the ResultSet
												st.close(); // Close the Statement
												con.close(); // Close the Connection

												for (Map.Entry<String, String> entry : latestSalesByDate.entrySet()) {
													String salesDate = entry.getKey();
													String totalOnDate = entry.getValue();
											%>
											<tr>
												<td class="border-bottom-0"><%=salesDate%></td>
												<td class="border-bottom-0"><%=totalOnDate%></td>
											</tr>
											<%
											}
											} catch (Exception e) {
											e.printStackTrace();
											}
											%>
										</tbody>
									</table>

								</div>
								<div id="chart"></div>
							</div>
						</div>
					</div>

					<div class="col-lg-6 d-flex align-items-strech">
						<div class="card w-100">
							<div class="card-body p-4">
								<div
									class="d-sm-flex d-block align-items-center justify-content-between mb-9">

									<div class="mb-3 mb-sm-0">
										<label for="date">Enter Date:</label> <input type="text"
											id="date" placeholder="YYYY-MM-DD" name="email">
									</div>

									<div>
										<button type="submit" class="btn btn-dark">View Items</button>
									</div>

								</div>
								<div class="table-responsive row">

									<!-- Table 2 -->

									<table class="table text-nowrap mb-0 align-middle">
										<thead class="text-dark fs-4">
											<tr>
												<th class="border-bottom-0" scope="col">Product ID</th>
												<th class="border-bottom-0" scope="col">Item Name</th>
												<th class="border-bottom-0" scope="col">Item Qty</th>
												<th class="border-bottom-0" scope="col">Sub Total</th>
											</tr>
										</thead>
										<tbody>

											<%
											try {
												Connection con = ConnectionProvider.getCon();
												Statement st = con.createStatement();
												ResultSet rs = st.executeQuery(
												"SELECT receipt.pid, stockdetails.itemname, receipt.reitemqty, receipt.SubTotal FROM receipt INNER JOIN stockdetails ON receipt.itemno = stockdetails.itemno");
												while (rs.next()) {
											%>

											<tr>
												<td><%=rs.getString(1)%></td>
												<td><%=rs.getString(2)%></td>
												<td><%=rs.getString(3)%></td>
												<td><%=rs.getString(4)%></td>
											</tr>

											<%
											}
											} catch (Exception e) {
											System.out.println(e);
											}
											%>

										</tbody>
									</table>

									<%
									double SubTotal = 0;
									int sno = 0;
									try {
										Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs1 = st.executeQuery("select sum(SubTotal) from receipt");
										while (rs1.next()) {
											SubTotal = rs1.getDouble(1);
										}
									} catch (Exception e) {
										System.out.println(e);
									}
									%>

									<div class="d-sm-flex d-block align-items-center justify-content-between">
										<div class="mb-3 mb-sm-0">
											
										</div>
										<div class="mt-3 ml-5">
											<h6 class="fw-semibold mb-1" style="color: blue;">
												Total:
												<%
											out.println(SubTotal);
											%>
											</h6>
										</div>
									</div>

									<%

									%>

								</div>
								<div id="chart"></div>
							</div>
						</div>
					</div>

				</div>

				<div class="row">
					<div class="col-lg-6 d-flex align-items-stretch">
						<div class="card w-100">
							<div class="card-body p-4">
								<!-- <h5 class="card-title fw-semibold mb-4">Daily Report</h5> -->
								<div class="table-responsive">

									<!-- Canvas -->
									<canvas id="myChart1" style="width: 100%; max-width: 500px"></canvas>

									<%
									try {
										Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("SELECT * FROM receipt"); // Replace with your query and column names

										List<String> xValues = new ArrayList<String>();
										List<Integer> yValues = new ArrayList<Integer>();
										List<String> barColors = new ArrayList<String>();
										while (rs.next()) {
											xValues.add(rs.getString("itemno")); // Replace with your column name for x-values
											yValues.add(rs.getInt("reitemqty")); // Replace with your column name for y-values
											barColors.add("#b91d47");
											barColors.add("#00aba9");
											barColors.add("#2b5797");
											barColors.add("#e8c3b9"); // Replace with your column name for bar colors
										}
									%>


									<script>
										var xValues =
									<%=new Gson().toJson(xValues)%>
										;
										var yValues =
									<%=new Gson().toJson(yValues)%>
										;
										var barColors =
									<%=new Gson().toJson(barColors)%>
										;

										new Chart(
												"myChart1",
												{
													type : "pie",
													data : {
														labels : xValues,
														datasets : [ {
															backgroundColor : barColors,
															data : yValues
														} ]
													},
													options : {
														title : {
															display : true,
															text : "Daily Report"
														}
													}
												});
									</script>
									<%
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>

								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6 d-flex align-items-stretch">
						<div class="card w-100">
							<div class="card-body p-4">
								<h5 class="card-title fw-semibold mb-4">Weekly Report</h5>
								<div class="table-responsive">

									<!-- Canvas -->

									<canvas id="myChart" style="width: 100%; max-width: 500px"></canvas>
									<%
									try {
										Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("SELECT * FROM purchase"); // Replace with your query and column names

										List<String> xValues = new ArrayList<String>();
										List<Integer> yValues = new ArrayList<Integer>();
										List<String> barColors = new ArrayList<String>();

										while (rs.next()) {
											xValues.add(rs.getString("date")); // Replace with your column name for x-values
											yValues.add(rs.getInt("totalprice")); // Replace with your column name for y-values
											barColors.add("#b91d47"); // Replace with your column name for bar colors
											barColors.add("#b91d47");
											barColors.add("#00aba9");
											barColors.add("#2b5797");
											barColors.add("#e8c3b9");
										}
									%>
									<script>
										var xValues =
									<%=new Gson().toJson(xValues)%>
										;
										var yValues =
									<%=new Gson().toJson(yValues)%>
										;
										var barColors =
									<%=new Gson().toJson(barColors)%>
										;

										new Chart(
												"myChart",
												{
													type : "bar",
													data : {
														labels : xValues,
														datasets : [ {
															backgroundColor : barColors,
															data : yValues
														} ]
													},
													options : {
														legend : {
															display : false
														},
														title : {
															display : true,
															text : "Week Report"
														}
													}
												});
									</script>
									<%
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script>
		function showTable() {
			// Retrieve the table element
			var table = document.getElementById("myTable");

			// Show the table by changing the display style
			table.style.display = "table";
		}
	</script>

	<script src="../assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../assets/js/sidebarmenu.js"></script>
	<script src="../assets/js/app.min.js"></script>
	<script src="../assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="../assets/libs/simplebar/dist/simplebar.js"></script>
	<script src="../assets/js/dashboard.js"></script>
</body>

</html>