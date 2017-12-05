<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="templates/header.jsp"></jsp:include>
<!DOCTYPE HTML>
<html>
<body>
	<section id="two" class="wrapper style2 special">
		<div class="inner narrow">
			<header>
				<h2>Find Relationship</h2>
			</header>
			<form class="grid-form" method="post">
			<input type="hidden" name="history" value="false" />
				<div class="form-control narrow">
					<label for="student1">Student 1</label> <input type="text"
						id="student1" name="student1">
				</div>
				<div class="form-control narrow">
					<label for="student2">Student 2</label> <input type="text"
						id="student2" name="student2">
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
		url: "GetRelationship", 
		method: "post",
		data: {"student1":$("#student1").val(), "student2":$("#student2").val(),"userid":$("#userid").val(),"history":$("#history").val()},
		success: function(result){
        	$("#result").html(result.connection).show();
    	}
    });
});
</script>
</html>
<jsp:include page="templates/footer.jsp"></jsp:include>