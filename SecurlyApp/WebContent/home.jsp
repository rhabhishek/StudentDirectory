<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="templates/header.jsp"></jsp:include>
<!DOCTYPE HTML>
<html>
	<body>
    <section id="one" class="wrapper special">
    <div class="inner">
        <header class="major">
            <h2>Dashboard</h2>
        </header>
        <div class="features">
           <div class="feature narrow">
             <a href="studentSearch.jsp"><i class="fa  fa-search"></i>
                <h3>Search Student</h3></a>
                <p>Search student details by Email</p>
            </div>
            <div class="feature narrow">
                <a href="clubSearch.jsp"><i class="fa fa-users "></i>
                <h3>Search Club</h3></a>
                <p>Get details of a Club</p>
            </div>
            <div class="feature narrow">
                <a href="relationship.jsp"><i class="fa fa-retweet"></i>
                <h3>Student Relationship</h3></a>
                <p>Check if two students are connected</p>
            </div>
            <div class="feature narrow">
                <a href="history.jsp"><i class="fa fa-list"></i>
                <h3>History</h3></a>
                <p>See all the previous queries</p>
            </div>
        </div>
    </div>
</section>
	</body>
</html>
<jsp:include page="templates/footer.jsp"></jsp:include>