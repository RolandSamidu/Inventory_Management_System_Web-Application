<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>INSPIRED - USER</title>
<link rel="shortcut icon" type="image/png"
	href="../assets/images/logos/logo.png" />
<link rel="stylesheet" href="../assets/css/styles.min.css" />
</head>

<style>
.btn-circle {
	border-radius: 0;
	/* Remove the border-radius to make the buttons square */
}

.btn-circle i {
	display: none; /* Hide any icon inside the button (if present) */
}
</style>

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
							href="userDashboard.jsp" aria-expanded="false"> <span>
									<i class="ti ti-layout-dashboard"></i>
							</span> <span class="hide-menu">DASHBOARD</span>
						</a></li>
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
							class="hide-menu">COMPONENTS</span></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="userHome.jsp" aria-expanded="false"> <span>
									<i class="ti ti-article"></i>
							</span> <span class="hide-menu">Stocks Details</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="userPurchase.jsp" aria-expanded="false"> <span> <i
									class="ti ti-receipt"></i>
							</span> <span class="hide-menu">Purchase</span>
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
						<li class="nav-item"><a class="nav-link nav-icon-hover"
							href=""> <i class="ti ti-bell-ringing"></i>
						</a></li>
						<li class="nav-item"><a class="nav-link" onClick="printPDF()">
								<i class="ti ti-file-description">Report Generate</i>
						</a></li>
					</ul>
					<div class="navbar-collapse justify-content-end px-0"
						id="navbarNav">
						<form action="../admin/searchProducts.jsp" class="d-flex" method="post">
							<input class="form-control me-2" type="search"
								placeholder="Search" name="search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
						<ul
							class="navbar-nav flex-row ms-auto align-items-center justify-content-end">



							<li class="nav-item dropdown"><a
								class="nav-link nav-icon-hover" href="javascript:void(0)"
								id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
									<img src="../assets/images/profile/user-1.jpg" alt=""
									width="35" height="35" class="rounded-circle">
							</a></li>
						</ul>
					</div>
				</nav>
			</header>
			<!--  Header End -->
			<div class="container-fluid">

				<%
				String msg = request.getParameter("msg");
				String errorMessage = request.getParameter("errorMessage");
				if ("done".equals(msg)) {
				%>
				<div class="alert alert-warning" role="alert">Successfully
					Edit Item..!</div>
				<%
				}
				%>
				<%
				if ("add".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert">Successfully Add
					Item..!</div>
				<%
				}
				%>

				<%
				if ("addToCart".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert">Added Item to
					Cart..!</div>
				<%
				}
				%>

				<%
				if ("wrong".equals(msg)) {
				%>
				<div class="alert alert-warning" role="alert">Already added this item to the cart..!</div>
				<%
				}
				%>
				<%
				if ("delete".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert">Successfully
					Delete Item..!</div>
				<%
				}
				%>

				<!-- Print Data -->
				<%
				try {
					Connection con = ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select count(*) from stockdetails");
					String Countrow = "";
					while (rs.next()) {
						Countrow = rs.getString(1);
						out.println("Stock Items :" + Countrow);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>

				<div class="row">
					<div class="col-lg-12 d-flex align-items-stretch">
						<div class="card w-100">
							<div class="card-body p-4">
								<h5 class="card-title fw-semibold mb-4" style="color: orange;">Stock
									Details</h5>
								<div class="table-responsive">
									<table class="table text-nowrap mb-0 align-middle">
										<thead class="text-dark fs-4">
											<tr>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-1" style="color: Blue;">
														<b>ID</b>
													</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-1" style="color: Blue;">Item
														Name</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-1" style="color: Blue;">Quantity</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-1" style="color: Blue;">Unit
														Price</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-1" style="color: Blue;">Image</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-1" style="color: Blue;">Actions</h6>
												</th>
											</tr>
										</thead>
										<tbody>
											<%
											String id = request.getParameter("ITEMNO");
											String ITEMNAME = request.getParameter("ITEMNAME");
											try {
												Connection con = ConnectionProvider.getCon();
												Statement st = con.createStatement();
												ResultSet rs = st.executeQuery("select * from stockdetails");
												while (rs.next()) {

													int quantity = rs.getInt("QTY");
													int reorderLevel = rs.getInt("REORDERLEVEL");

													// Check if quantity is less than reorder level
													if (quantity < reorderLevel) {
											%>
											<script type="text/javascript">
                                                     alert("Re-order to item <%=rs.getString("ITEMNAME")%>");
											</script>
											<%
											}
											%>
											<tr>
												<td class="border-bottom-0"><h6
														class="fw-semibold mb-0"><%=rs.getString(1)%></h6></td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-1"><%=rs.getString(2)%></h6>
												</td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-0"><%=rs.getString(3)%></h6>
												</td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-0"><%=rs.getString(4)%></h6>
												</td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-0">
														<img src="<%=rs.getString(6)%>" alt="Item Image"
															width="50" height="50">
													</h6>
												</td>
												<td class="border-bottom-0"><a
													class="btn btn-info submit-btn"
													href="userCartAction.jsp?ITEMNO=<%=rs.getString(1)%>"><i
														class="ti ti-shopping-cart"></i></a> <%-- <a class="btn btn-warning submit-btn" href="test.jsp?ITEMNO=<%=rs.getString(1) %>"><i class="ti ti-shopping-cart"></i></a> --%>
												</td>
											</tr>

											<%
											}
											} catch (Exception e) {
											System.out.println(e);
											}
											%>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Print Script Function -->
	<script>
		function printPDF() {
			window.print();
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