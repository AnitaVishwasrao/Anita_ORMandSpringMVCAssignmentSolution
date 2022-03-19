<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Debate Event: Message</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
</head>
<body>
	<div class="container">
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h3 class="display-4">Customer Relationship Management</h3>
				<p class="lead text-success bg-light" style="font-weight: 600">${message}</p>
				<p class="lead">
					<a class="btn btn-primary btn-sm"
						href="/CustomerRelationshipManagementApplication/customer/"
						role="button">Home</a> <a class="btn btn-primary btn-sm"
						href="/CustomerRelationshipManagementApplication/customer/customers"
						role="button">View Customers</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>