<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>

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
.receipt-container {
	font-family: Arial, sans-serif;
	width: 250px;
	margin: 0 auto;
	padding: 10px;
	border: 1px solid #ccc;
}

.receipt-header {
	text-align: center;
	margin-bottom: 10px;
}

.receipt-header h2 {
	margin: 0;
}

.receipt-items {
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 10px;
}

.receipt-items th, .receipt-items td {
	border: 1px solid #ccc;
	padding: 5px;
}

.receipt-items th {
	background-color: #f2f2f2;
	text-align: left;
}

.receipt-items td:last-child {
	text-align: right;
}

.receipt-total {
	text-align: right;
	margin-bottom: 10px;
}

.receipt-footer {
	text-align: center;
}
</style>

</head>
<body>



	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-8 d-flex align-items-stretch">
				<div class="card w-100 print-only">
					<div class="card-body p-4">

						<div class="receipt-container">
							<div class="receipt-header">
								<h2>Receipt</h2>
							</div>
							<table class="receipt-items">
								<tr>
									<th>Item</th>
									<th>Price</th>
								</tr>
								<tr>
									<td>Product 1</td>
									<td>$10</td>
								</tr>
								<tr>
									<td>Product 2</td>
									<td>$15</td>
								</tr>
								<!-- Add more rows for other items -->
							</table>
							<div class="receipt-total">
								<strong>Total:</strong> $25
							</div>
							<div class="receipt-footer">Thank you for your purchase!</div>
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


</body>
</html>