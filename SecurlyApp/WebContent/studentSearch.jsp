<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="templates/header.jsp"></jsp:include>
<!DOCTYPE HTML>
<html>
<body>
	<section id="two" class="wrapper style2 special">
		<div class="inner narrow">
			<header>
				<h2>Search Student</h2>
			</header>
			<form class="grid-form" >
				<input type="hidden" name="history" value="false" />
				<div class="form-control">
					<label for="email">Student Email</label> <input id="email" type="text"
						id="email" name="email">
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
		url: "SearchStudent", 
		method: "post",
		data: {"email":$("#email").val(),"userid":$("#userid").val(),"history":$("#history").val()},
		success: function(result){
			if(result.id !== 0){
				var name = result.name;
				var email = result.email;
				var school = result.school;
				var id = result.id;
				var listOfClubs = result.listOfClubs;
				
		       	$("#result").html(name+' from '+school.name+'. Involved in ');
		       	for(i=0;i<listOfClubs.length;i++){
		  				if(i!=0)$("#result").append(', ');
		       		$("#result").append(listOfClubs[i].name);
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

