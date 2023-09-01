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
</head>

<body>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

	<!-- Side bar Start -->
    <aside class="left-sidebar" style="background-color: white;">
      <!-- Side bar scroll-->
      <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
         
          <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
            <i class="ti ti-x fs-8"></i>
          </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
          <ul id="sidebarnav">
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Home</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="adminDashboard.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                <span class="hide-menu">DASHBOARD</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">COMPONENTS</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="viewStockDetails.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-article"></i>
                </span>
                <span class="hide-menu">Stocks Details</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="viewUserDetails.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-users"></i>
                </span>
                <span class="hide-menu">Users</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="purchase.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-receipt"></i>
                </span>
                <span class="hide-menu">Purchase</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="reportsHome.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-files"></i>
                </span>
                <span class="hide-menu">Reports</span>
              </a>
            </li>
            
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">AUTH</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="../logout.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-logout"></i>
                </span>
                <span class="hide-menu">Logout</span>
              </a>
            </li>
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
						<li class="nav-item"><a class="nav-link" href="AddUser.jsp"> <i
								class="ti ti-plus"> Add New User</i>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="viewUserDetails.jsp"> <i
								class="ti ti-file-description"> All Users</i>
						</a></li>
					</ul>
					<div class="navbar-collapse justify-content-end px-0"
						id="navbarNav">
						<ul
							class="navbar-nav flex-row ms-auto align-items-center justify-content-end">

							<li class="nav-item dropdown"><a
								class="nav-link nav-icon-hover" href=""
								id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
									<img src="../assets/images/profile/user-1.jpg" alt=""
									width="35" height="35" class="rounded-circle">
							</a></li>
						</ul>
					</div>
				</nav>
			</header>
			<!--  Header End -->

			<p style="color: red; text-align: center">${errorMessage}</p>
			<%
			String msg = request.getParameter("msg");
			String errorMessage = request.getParameter("errorMessage");
			if ("done".equals(msg)) {
			%>
			<h1 style="text-align: center; color: green">Added User
				Successfully!</h1>
			<%
			}
			%>
			<%
			if ("wrong".equals(msg)) {
			%>
			<h1>Some thing Went Wrong! Try Again !</h1>
			<%
			}
			%>


			<%
            String email = request.getParameter("email");
            try{
	            Connection con = ConnectionProvider.getCon();
	            Statement st = con.createStatement();
	            ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	        while(rs.next())
	        {
            %>

			<div class="container-fluid">

				<div class="row">
					<div class="col-lg-12 d-flex align-items-stretch">
						<div class="card w-100">
							<div class="card">
								<div class="card-body">
									<form action="editUserAction.jsp" method="post">
										<h3 class="mt-2 mb-3" style="color: orange;">EDIT USER</h3>


										<div class="row g-3 mt-5">
											<div class="col-md-6">
												<label for="inputText" class="form-label">First
													Name</label> <input class="form-control" type="text"
													name="firstname" value="<%=rs.getString(1)%>" required>
											</div>
											<div class="col-md-6">
												<label class="form-label">Last Name</label> <input
													class="form-control" type="text" name="lastname" value="<%=rs.getString(2)%>" required>
											</div>
											<div class="col-md-6">
												<label for="inputText" class="form-label">Username</label> <input
													class="form-control" id="inputPassword4" type="text"
													name="username" value="<%=rs.getString(3)%>" required>
											</div>
											<div class="col-md-6">
												<label for="inputText" class="form-label">Telephone</label>
												<input class="form-control" id="inputPassword4" type="tel"
													name="pnumber" value="<%=rs.getString(4)%>" required>
											</div>
											<div class="col-md-6">
												<label for="inputText" class="form-label">Email</label>
												<input class="form-control" id="inputPassword4" type="email"
													name="email" value="<%=rs.getString(5)%>" required>
											</div>
											<div class="col-md-6">
												<label for="inputText" class="form-label">Password</label>
												<input class="form-control" id="inputPassword4" type="text"
													name="password" value="<%=rs.getString(6)%>" required>
											</div>
											<div class="col-md-6">
												<label for="inputText" class="form-label">Privilege</label>
												<select class="form-select col-md-6" aria-label=".form-select-lg example" name="privilege" required>
												     <option value="default"><% out.print(rs.getString(7)); %></option>
                                                     <option value="admin">Administrator</option>
                                                     <option value="user">User</option>
                                                </select>
											</div>
										</div>
										<button type="submit" class="btn btn-primary mt-5" value="EditUser">Edit User</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<%
               }
            }catch (Exception e){
               System.out.println(e);
            }
            %>
			
		</div>
	</div>
	<script src="../assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../assets/js/sidebarmenu.js"></script>
	<script src="../assets/js/app.min.js"></script>
	<script src="../assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="../assets/libs/simplebar/dist/simplebar.js"></script>
	<script src="../assets/js/dashboard.js"></script>
</body>

</html>