<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="templates/header.jsp"></jsp:include>
<!DOCTYPE HTML>
<html>
<body>
	<section id="two" class="wrapper style2 special">
		<div class="inner narrow">
			<header>
				<h2>Search Club</h2>
			</header>
			<form class="grid-form" method="post">
			<input type="hidden" name="history" value="false" />
				<div class="form-control">
					<label for="clubName">Club Name</label> <input type="text"
						id="clubName" name="clubName">
				</div>
				<ul class="actions">
					<li><input type="submit" name="submit" value="Search"></li>
				</ul>

			</form>
		</div>
	</section>
	<blockquote class="align-center"><div id="result"></div></blockquote>
</body>
<script type="text/javascript">
$("form").submit(function(event){
	event.preventDefault();
    $.ajax({
		url: "SearchClub", 
		method: "post",
		data: {"clubName":$("#clubName").val(),"userid":$("#userid").val(),"history":$("#history").val()},
		success: function(result){
			
			
			var club = $.parseJSON(result.club);
			if(club.id !== 0){
			var listOfStudents = $.parseJSON(result.listOfStudents);
			var school = club.school;
        	$("#result").html(club.name+' <br />'+school.name+' <br /> ');
        	for(i=0;i<listOfStudents.length;i++){
   				if(i!=0)$("#result").append(', ');
        		$("#result").append(listOfStudents[i].name);
        	}
			}else{
				$("#result").html("No record found.");
			}
    	}
    });
});
</script>
</html>
<jsp:include page="templates/footer.jsp"></jsp:include>