<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="templates/header.jsp"></jsp:include>
<!DOCTYPE HTML>
<html>
<body ng-app='historyApp' ng-controller="historyController">
	<section id="two" class="wrapper style2 special">
		<div class="inner narrow">
			<header>
				<h2>Search History</h2>
			</header>
		</div>
		<div class=" inner">
		<div ng-if="x.length<=0" style="color:red;">No history recorded</div>
		<table>
		<thead>
		<tr>
		<th>Search Type</th>
		<th>Time stamp</th>
		<th>Query</th>
		</tr>
		</thead>
		 <tbody>
        <tr ng-repeat="item in x">
            <td>{{item.searchType}}</td>
            <td>{{item.timeStamp}}</td>
            <td>{{item.listOfInputs}}</td>
            <td><input type="button" value="Get Result" ng-click="getResult(item)"/></td>
        </tr> 
    </tbody>
		</table>
		</div>
	</section>
<input type="hidden" id="result"/>
<script type="text/javascript">
var jsonData=[];
$(function() {
$.ajax({
		url: "GetHistory", 
		method: "post",
		data: {"userid":$("#userid").val()},
		success: function(result){
			$("#result").val(JSON.stringify(result));
    	}
    });
});


var historyApp = angular.module("historyApp",[]);

historyApp.controller('historyController', ['$scope', function($scope) {
	  $scope.x = $.parseJSON($("#result").val());
	  $scope.getResult = function(json){
		  var url= json.searchType;
		  var params = $.parseJSON(json.listOfInputs);
		  params.history = true;
		  params.userid = $("#userid").val();
		  $.ajax({	
				url: url, 
				method: "post",
				data: params,
				success: function(result){
					var resultString;
					if(url==="SearchStudent"){
						var name = result.name;
						var email = result.email;
						var school = result.school;
						var id = result.id;
						var listOfClubs = result.listOfClubs;
						resultString = name+' from '+school.name+'. Involved in ';
			        	for(i=0;i<listOfClubs.length;i++){
			   				if(i!=0)resultString+=', ';
			   				resultString+=listOfClubs[i].name;
			        	}
					}else if(url ==="SearchClub"){
						var club = $.parseJSON(result.club);
						var listOfStudents = $.parseJSON(result.listOfStudents);
						var school = club.school;
						resultString = club.name+' \n'+school.name+' \n ';
			        	for(i=0;i<listOfStudents.length;i++){
			        		if(i!=0)resultString+=', ';
			        		resultString+=listOfStudents[i].name;
			        	}
						
					}else if(url === "GetRelationship"){
						resultString = result.connection;
					}
					alert(resultString);
		    	}
		    });
	  };
	 
	}]);

</script>
</body>
</html>
<jsp:include page="templates/footer.jsp"></jsp:include>