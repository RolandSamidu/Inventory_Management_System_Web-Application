<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>


<!doctype html>
<html lang="en">


<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>INSPIRED - ADMIN</title>
<link rel="shortcut icon" type="image/png"
	href="../assets/images/logos/logo.png" />
<link rel="stylesheet" href="../assets/css/styles.min.css" />


<style>
.btn-circle {
	border-radius: 50%;
}
</style>


</head>


<body style="background-color: lightblue;">

	<!-- Body Wrapper -->

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
							href="userHome.jsp" aria-expanded="false"> <span>

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

		<!-- Sidebar End -->







		<!-- Main wrapper -->

		<div class="body-wrapper">

			<!-- Header Start -->

			<header class="app-header">

				<nav class="navbar navbar-expand-lg navbar-light">

					<ul class="navbar-nav">

						<li class="nav-item"><a class="nav-link nav-icon-hover"
							href=""> <i class="ti ti-bell-ringing"></i>

						</a></li>

						<li class="nav-item"><a class="nav-link"> <i
								class="ti ti-plus">Add Item</i>

						</a></li>

						<li class="nav-item"><a class="nav-link"> <i
								class="ti ti-file-description">Report Generate</i>

						</a></li>

					</ul>

					<div class="navbar-collapse justify-content-end px-0"
						id="navbarNav">

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

			<!-- Header End -->



			<%
			String msg = request.getParameter("msg");

			if ("wrong".equals(msg)) {
			%>

			<div class="alert alert-danger" role="alert">Something went

				wrong, Try again..!</div>

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

			<%
			if ("msg1".equals(msg)) {
			%>

			<div class="alert alert-success" role="alert">Cash is low ..!</div>

			<%
			}
			%>





			<%
			double total = 0;

			int sno = 0;

			try {

				Connection con = ConnectionProvider.getCon();

				Statement st = con.createStatement();

				ResultSet rs1 = st.executeQuery("select sum(total) from cart");

				while (rs1.next()) {

					total = rs1.getDouble(1);

				}

			} catch (Exception e) {

				System.out.println(e);

			}
			%>



			<div class="container-fluid">



				<!-- View all item in the Cart -->



				<div class="row">

					<div class="col-lg-8 d-flex align-items-stretch">

						<div class="card w-100">

							<div class="card-body p-4">

								<h5 class="card-title fw-semibold mb-4" style="color: orange;">Purchase

									Items</h5>

								<div class="table-responsive">

									<table class="table text-nowrap mb-0 align-middle">

										<thead class="text-dark fs-4">

											<tr>

												<th class="border-bottom-0">

													<h6 class="fw-semibold mb-1" style="color: Green;">

														Total : <b>Rs. </b>

														<%
														out.println(total);
														%>

													</h6>

												</th>

											</tr>

											<tr>

												<th class="border-bottom-0">

													<h6 class="fw-semibold mb-1" style="color: Blue;">Item

														No</h6>

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

													<h6 class="fw-semibold mb-1" style="color: Blue;">Total

														Price</h6>

												</th>

											</tr>

										</thead>

										<tbody>

											<%
											String pid = request.getParameter("pid");

											try {

												Connection con = ConnectionProvider.getCon();

												Statement st = con.createStatement();

												ResultSet rs = st.executeQuery("select * from cart");

												while (rs.next()) {
											%>

											<tr>

												<td class="border-bottom-0"><h6
														class="fw-semibold mb-0"><%=rs.getString(1)%></h6></td>

												<td class="border-bottom-0">

													<h6 class="fw-semibold mb-1"><%=rs.getString(2)%></h6>

												</td>

												<td class="border-bottom-0">

													<h6 class="fw-semibold mb-0">

														<a class="btn-sm btn-info btn-circle"
															href="../admin/incdecQtyAction.jsp?pid=<%=rs.getString(1)%>&quantity=dec"><i
															class="ti ti-minus"></i></a>

														<%=rs.getString(3)%>

														<a class="btn-sm btn-info btn-circle"
															href="../admin/incdecQtyAction.jsp?pid=<%=rs.getString(1)%>&quantity=inc"><i
															class="ti ti-plus"></i></a>

													</h6>

												</td>

												<td class="border-bottom-0">

													<h6 class="fw-semibold mb-0">

														<b>Rs. </b><%=rs.getString(4)%></h6>

												</td>

												<td class="border-bottom-0">

													<h6 class="fw-semibold mb-0">

														<b>Rs. </b><%=rs.getString(5)%></h6>

												</td>

												<td class="border-bottom-0"><a
													class="btn btn-danger delete-btn"
													href="../admin/DeleteCartItemAction.jsp?pid=<%=rs.getString(1)%>"><i
														class="ti ti-trash"></i></a></td>

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



					<%
					int quantity = 0;

					try {

						Connection con = ConnectionProvider.getCon();

						Statement st = con.createStatement();

						ResultSet rs2 = st.executeQuery("select sum(quantity) from cart");

						while (rs2.next()) {

							quantity = rs2.getInt(1);

						}

					} catch (Exception e) {

						System.out.println(e);

					}
					%>





					<div class="col-lg-4 d-flex align-items-stretch">

						<div class="card w-100">

							<div class="card-body p-4">

								<h5 class="card-title fw-semibold mb-4" style="color: orange;">Input

									Details Here</h5>

								<div>

									<form>

										<div class="row g-3 mb-3">

											<div class="mb-3 col-md-6">

												<label for="name" class="form-label">Cash</label> <input
													type="text" class="form-control" id="cash" name="CASH"
													placeholder="" required>

											</div>

											<div class="mb-3 col-md-6">

												<label for="name" class="form-label">Total</label> <input
													type="text" class="form-control" id="total" name="TOTAL"
													placeholder="" value="<%out.println(total);%>" required>

											</div>

											<div class="mb-3 col-md-4">

												<label for="name" class="form-label">Discount (%)</label> <input
													type="text" class="form-control" id="discount_p"
													name="DISCOUNT_P" placeholder="" value=0 required>

											</div>

											<div class="mb-3 col-md-4">

												<label for="name" class="form-label">Discount (m)</label> <input
													type="text" class="form-control" id="discount_m"
													name="DISCOUNT_M" placeholder="" value=0 required>

											</div>

											<div class="mb-3 col-md-4">

												<label for="name" class="form-label text-white">Click

													me</label>

												<button type="button" class="btn btn-warning"
													onclick="calculateBalance()">Calculate</button>

											</div>

										</div>

									</form>



									<%
									int purchaseId = 1;

									try {

										Connection con = ConnectionProvider.getCon();

										Statement st = con.createStatement();

										ResultSet rs = st.executeQuery("select max(pid) from purchase ");

										while (rs.next()) {

											purchaseId = rs.getInt(1);

											purchaseId = purchaseId + 1;

										}

									} catch (Exception e) {

										//

									}
									%>



									<form action="purchasebillAction.jsp" method="post">

										<div class="row g-3 mb-3">

											<input type="text" class="invisible" name="purchaseId"
												value="<%out.println(purchaseId);%>" required>

											<div class="mb-3 col-md-4">

												<label for="name" class="form-label">No of Items</label> <input
													type="text" class="form-control" id="quantity"
													name="quantity" value="<%out.println(quantity);%>" required>

											</div>

											<div class="mb-3 col-md-4">

												<label for="name" class="form-label">Final Total</label> <input
													type="text" class="form-control" id="finaltotal"
													name="TOTALCOST" placeholder="" readonly>

											</div>

											<div class="mb-3 col-md-4">

												<label for="name" class="form-label">Balance</label> <input
													type="text" class="form-control" id="balance"
													name="BALANCE" placeholder="" readonly>

											</div>

											<div class="mb-3 col-md-12">

												<label for="name" class="form-label">Description</label>

												<textarea class="form-control" id="noOfItems" rows="3"
													name="DESCRIPTION"
													placeholder="Thank you... And Come Again..!"></textarea>

											</div>

										</div>

										<button type="submit" class="btn btn-success"
											onclick="printContent()">Print</button>

										<button type="submit" class="btn btn-info">Clear</button>

									</form>



								</div>

							</div>

						</div>

					</div>





				</div>





				<div id="contentToPrint" style="display: none;">

					<!-- Your content goes here -->

					<p>==============================</p>

					<h4>Inspired Business Solutions</h4>

					<p>==============================</p>

					<%
					int purchaseId1 = 1;

					try {

						Connection con = ConnectionProvider.getCon();

						Statement st = con.createStatement();

						ResultSet rs = st.executeQuery("select max(pid) from purchase ");

						while (rs.next()) {

							purchaseId1 = rs.getInt(1);

							purchaseId1 = purchaseId1 + 1;

						}

					} catch (Exception e) {

						//

					}
					%>







					<div>

						<h5>
							Purchase Id :<%
						out.println(purchaseId);
						%>
						</h5>

						<h5>
							Quantity :<%
						out.println(quantity);
						%>
						</h5>



					</div>

					<div>



						<table>

							<thead>



								<tr>

									<th class="border-bottom-0">

										<h6 style="color: Black;">Item Name</h6>

									</th>

									<th class="border-bottom-0">

										<h6 style="color: Black;">Quantity</h6>

									</th>

									<th class="border-bottom-0">

										<h6 style="color: Black;">Unit Price</h6>

									</th>

									<th class="border-bottom-0">

										<h6 style="color: Black;">Total Price</h6>

									</th>

								</tr>



							</thead>

							<tbody>

								<%
								String pid1 = request.getParameter("pid");

								try {

									Connection con = ConnectionProvider.getCon();

									Statement st = con.createStatement();

									ResultSet rs = st.executeQuery("select * from cart");

									while (rs.next()) {
								%>

								<tr>



									<td><p><%=rs.getString(2)%></p></td>

									<td><p><%=rs.getString(3)%></p></td>

									<td><p>
											<b>Rs. </b><%=rs.getString(4)%></p></td>

									<td><p>
											<b>Rs. </b><%=rs.getString(5)%></p></td>

								</tr>







								<%
								}

								} catch (Exception e) {

								System.out.println(e);

								}
								%>







							</tbody>

							<tr>

								<th></th>



								<th></th>

								<th></th>

								<th><p style="color: Black;">
										<%
										out.println(total);
										%>
									</p></th>

							</tr>

						</table>















					</div>



					<div>



						<h5>
							Cash : <span id="cashValue"></span>
						</h5>

						<h5>
							Discount: <span id="discountValue"></span>
						</h5>

						<h5>
							Final Total: <span id="finalTotalValue"></span>
						</h5>



						<h5>
							Balance: <span id="balanceValue"></span>
						</h5>

					</div>



					<p>***********************</p>

					<h5>.....Thank You.. Come Again.....</h5>

					<p>***********************</p>





				</div>

				<script>
					function printContent() {

						var cashValue = document.getElementById('cash').value;

						document.getElementById('cashValue').textContent = cashValue;

						var discountPercentage = document
								.getElementById('discount_p').value;

						var discountAmount = document
								.getElementById('discount_m').value;

						var discountValue = discountPercentage != 0 ? discountPercentage
								+ '%'
								: 'Rs. ' + discountAmount;

						document.getElementById('discountValue').textContent = discountValue;

						// Get the input field values

						var cash = parseFloat(document.getElementById('cash').value);

						var total = parseFloat(document.getElementById('total').value);

						var discountPercentage = parseFloat(document
								.getElementById('discount_p').value);

						var discountAmount = parseFloat(document
								.getElementById('discount_m').value);

						// Calculate the final total based on the discount

						var discountValue = discountPercentage != 0 ? total
								* (discountPercentage / 100) : discountAmount;

						var finalTotal = total - discountValue;

						var balance = cash - finalTotal;

						// Set the final total and balance values in the input fields

						document.getElementById('finalTotalValue').textContent = 'Rs. '
								+ finalTotal.toFixed(2);

						document.getElementById('balance').value = (cash - finalTotal)
								.toFixed(2);

						document.getElementById('balanceValue').textContent = 'Rs. '
								+ balance.toFixed(2);

						var content = document.getElementById('contentToPrint').innerHTML;

						var printWindow = window.open('', '',
								'width=350,height=600');

						printWindow.document.open();

						printWindow.document
								.write('<html><head><title>Print</title></head><body>'
										+ content + '</body></html>');

						printWindow.document.close();

						printWindow.print();

					}
				</script>

			</div>





		</div>

	</div>



	<script>
		function calculateBalance() {

			// Get the input field values

			var cash = parseFloat(document.getElementById('cash').value);

			var total = parseFloat(document.getElementById('total').value);

			var discount_p = parseFloat(document.getElementById('discount_p').value);

			var discount_m = parseFloat(document.getElementById('discount_m').value);

			var finaltotal = parseFloat(document.getElementById('finaltotal').value);

			// Calculate the balance

			if (discount_m == 0) {

				var x = total * (discount_p / 100);

				var finaltotal = total - x;

				var balance = cash - finaltotal;

			} else {

				var finaltotal = total - discount_m;

				var balance = cash - finaltotal;

			}

			// Set the balance value in the input field

			document.getElementById('balance').value = balance.toFixed(2);

			document.getElementById('finaltotal').value = finaltotal.toFixed(2);

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