<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myapp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Covid Cases Stats</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.spanOdd{
	color: darkgray;
}
.spanEven{
	color: mediumaquamarine;
}
.headerTab{
	padding-left: 1%;
    padding-top: 1%;
    background-color: darkslategray;
    margin-bottom: 19px;
    padding-bottom: 5px;
}
#leftbox { 
    float:left;  
    width:25%; 
    height:150px; 
    margin-right: 7px;
    border: 5px solid skyblue;
    text-align: center;
    color: darkcyan;
    margin-left: 6%;
} 
#middlebox{ 
    float:left;  
    width:25%; 
    height:150px; 
    margin-right: 5px;
    border: 5px solid coral;
    text-align: center;
    color: coral;
    margin-left: 6%;
} 
#rightbox{ 
    float:right; 
    width:25%; 
    height:150px; 
    border: 5px solid aquamarine;
    text-align: center;
    color: lightgreen;
    margin-left: 6%;
    margin-right: 6%;
} 

body {
  background-image: url(d5.jpg);
  background-position: 0px 85px;
    -webkit-background-size: 100% 100%;
    -moz-background-size: 100% 100%;
    -o-background-size: 100% 100%;
    background-size: 100% 100%;
}

</style>
<script type="text/javascript">
		var myapp = angular.module('myapp', []);
		myapp.controller('caseController', function($scope, $http){
			$http.get('http://localhost:8080/CovidCasesEntry/case').
			then(function(response){
				debugger;
				$scope.casesList = response.data;
				 var totalCases = 0;
				 var totalDeaths = 0;
				 var totalRecovered = 0;
				for(i=0; i<$scope.casesList.length; i++){
					 totalCases += $scope.casesList[i].totalCases;
					 totalDeaths += $scope.casesList[i].totalDeaths;
					 totalRecovered += $scope.casesList[i].totalRecovered;
				}
				console.log('cases are '+ totalCases+' Recovered'+totalRecovered+' Deaths '+totalDeaths);
				document.getElementById('totalCases').innerHTML = totalCases;  
				document.getElementById('totalDeaths').innerHTML = totalDeaths;
				document.getElementById('totalRecovered').innerHTML = totalRecovered;
			});
		});
	</script>
</head>
<body ng-controller="caseController">
	<div class="headerTab">
		<h2>
			<span class="spanOdd">COVID-19</span>
			<span class="spanEven">CORONAVIRUS</span>
			<span class="spanOdd">PANDEMIC</span>
		</h2>
	</div>
	<div style="width: 100%">
		<div id="leftbox">
			<p><h2>Coronavirus Cases :</h2></p>
			<span id="totalCases" style="font-size: 45px;font-weight: 500;"></span>
		</div>
		<div id="middlebox">
			<p><h2>Deaths :</h2></p>
			<span id="totalDeaths" style="font-size: 45px;font-weight: 500;"></span>
		</div>
		<div id="rightbox">
			<p><h2>Recovered :</h2></p>
			<span id="totalRecovered" style="font-size: 45px;font-weight: 500;"></span>
		</div>
	</div>
	<div style="margin-top: 14%;
    padding-left: 7px;
    padding-right: 7px;">
		<table class="table table-bordered" >
			<tr style="background-color: darkslategray;color: mediumaquamarine">
				<th>Country</th>
				<th>Total Cases</th>
				<th>New Cases</th>
				<th>Total Deaths</th>
				<th>New Deaths</th>
				<th>Total Recovered</th>
				<th>Active Cases</th>
				<th>Serious Critical</th>
				<th>Tot Cases/ 1M Pop</th>
				<th>Deaths/ 1M Pop</th>
				<th>Total Tests</th>
				<th>Tests/ 1M Pop</th>
			</tr>
			<tr ng-repeat="cs in casesList" style="color: grey">
				<th>{{cs.countryName}}</th>
				<th>{{cs.totalCases}}</th>
				<th>{{cs.newCases}}</th>
				<th>{{cs.totalDeaths}}</th>
				<th>{{cs.newDeaths}}</th>
				<th>{{cs.totalRecovered}}</th>
				<th>{{cs.activeCases}}</th>
				<th>{{cs.seriousCritical}}</th>
				<th>{{cs.totCasesMpop}}</th>
				<th>{{cs.deathsMpop}}</th>
				<th>{{cs.totalTests}}</th>
				<th>{{cs.testsMpop}}</th>
			</tr>
		</table>
	</div>
</body>
</html>
