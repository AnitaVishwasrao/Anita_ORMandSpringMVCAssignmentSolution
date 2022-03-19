<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CRM: Customer Details Form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
</head>
<body>
	<div class="container">
		<div class="row">
			<h2 class="col-10">Customer Details Form</h2>
			<h5 class="col-2 text-right">
				<a href="/CustomerRelationshipManagementApplication/customer/">Home</a>
			</h5>
		</div>
		<hr>
		<form
			action="/CustomerRelationshipManagementApplication/customer/save"
			method="POST">
			<div class="form-row">
				<input type="hidden" name="customerId" id="customerId"
					value="${customer.customerId}">
				<div class="form-group col-md-4">
					<label for="firstName">First Name</label> <input type="text"
						class="form-control" name="firstName" id="firstName"
						placeholder="John" value="${customer.firstName}" required>
				</div>
				<div class="form-group col-md-4 mt-2">
					<label for="lastName">Last Name</label> <input type="text"
						class="form-control" name="lastName" id="lastName"
						placeholder="Doe" value="${customer.lastName}" required>
				</div>
				<div class="form-group col-md-4 mt-2">
					<label for="email">Email</label> <input type="text"
						class="	form-control" name="email" id="email"
						placeholder="johndoe@greatlearning.com" value="${customer.email}"
						required>
				</div>
			</div>
			<input type="submit" class="btn btn-primary mt-2" value="Save" /> <input
				type="reset" class="btn btn-secondary mt-2" value="Clear" /> <a
				href="/CustomerRelationshipManagementApplication/customer/customers"
				class="btn btn-warning mt-2">Customer List</a>
		</form>
	</div>
</body>
</html>