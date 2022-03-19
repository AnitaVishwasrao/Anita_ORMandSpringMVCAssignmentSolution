<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CRM: Customers</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
</head>
<body>
	<div class="container">
		<div class="row">
			<h2 class="col-10">Customers</h2>
			<h5 class="col-2 text-right">
				<a href="/CustomerRelationshipManagementApplication/customer/">Home</a>
			</h5>
		</div>
		<hr>
		<a
			href="/CustomerRelationshipManagementApplication/customer/customer-details-form"
			class="btn btn-success btn-sm">Add Customer</a>
		<div class="mt-3">
			<c:choose>
				<c:when test="${Customers.size() > 0}">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th scope="col">First Name</th>
								<th scope="col">Last Name</th>
								<th scope="col">Email</th>
								<th scope="col">Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${Customers}" var="customer">
								<tr>
									<td><c:out value="${customer.firstName}" /></td>
									<td><c:out value="${customer.lastName}" /></td>
									<td><c:out value="${customer.email}" /></td>
									<td><a
										href="/CustomerRelationshipManagementApplication/customer/edit-customer-details?customerId=${customer.customerId}">Update</a>&nbsp;|&nbsp;<a
										href="/CustomerRelationshipManagementApplication/customer/delete-customer?customerId=${customer.customerId}"
										onclick="return confirm('Are you sure you want to delete customer - ${customer.firstName} ${customer.lastName}?')">Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<h4 style="color: #383CC1">No customers found</h4>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>