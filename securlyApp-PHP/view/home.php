<?php include "templates/header.php"; ?>
<!DOCTYPE HTML>
<html>
	<body>
    <section id="one" class="wrapper special">
    <div class="inner">
        <header class="major">
            <h2>Dashboard</h2>
        </header>
        <div class="features narrow">
           <div class="feature">
             <a href="studentSearch.php"><i class="fa  fa-search"></i>
                <h3>Search Student</h3></a>
                <p>Search student details by Email</p>
            </div>
            <div class="feature narrow">
                <a href="clubSearch.php"><i class="fa fa-users "></i>
                <h3>Search Club</h3></a>
                <p>Get details of a Club</p>
            </div>
            <div class="feature narrow">
                <a href="findRelationship.php"><i class="fa fa-retweet"></i>
                <h3>Student Relationship</h3></a>
                <p>Check if two students are connected</p>
            </div>
            <div class="feature narrow">
                <a href="history.php"><i class="fa fa-list"></i>
                <h3>History</h3></a>
                <p>See all the previous queries</p>
            </div>
        </div>
    </div>
</section>
	</body>
</html>
<?php include "templates/footer.php"; ?>