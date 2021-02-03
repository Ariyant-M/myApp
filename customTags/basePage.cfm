<!--- basic html tag for all files --->
<cfparam name="attributes.title" default="myApp">
<cfif thisTag.ExecutionMode EQ 'start'>

	<!DOCTYPE html>
	<html lang="en">
		<head>
			<meta charset="UTF-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<title><cfoutput>#attributes.title#</cfoutput></title>
			<!--- css style link --->
			<link rel="stylesheet" href="../myApp/CSS/style.css" />
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
			<!---bootstrap CDN--->
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
			<script src="JavaScript/jquery-3.5.1.js"></script>
			<script src="https://kit.fontawesome.com/ee6f18f199.js" crossorigin="anonymous"></script>
		</head>
		<body>
<cfelse>
		</body>
	</html>
</cfif>