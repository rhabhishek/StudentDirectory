/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.*;
import utility.ConnectionPool;
import utility.DBUtility;

/**
 * @author Abhishek
 *
 */
public class SearchDAO {

	public static Student studentSearch(Student student) {
		try {

			ConnectionPool pool = ConnectionPool.getInstance();
			Connection connection = pool.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			String query = "SELECT student.id 'student_id', student.name 'name', school.name 'school' "
					+ "FROM `student`, `school` " + "WHERE school_id = school.id and email = ?";
			try {
				ps = connection.prepareStatement(query);
				ps.setString(1, student.getEmail());
				rs = ps.executeQuery();
				if (rs.next()) {
					student.setId(rs.getInt("student_id"));
					student.setName(rs.getString("name"));
					School school = new School();
					school.setName(rs.getString("school"));
					student.setSchool(school);
				}else{
					return new Student();
				}

			} catch (SQLException e) {
				System.out.println(e);
			} finally {
				DBUtility.closeResultSet(rs);
				DBUtility.closePreparedStatement(ps);
				pool.freeConnection(connection);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return student;
	}

	public static List<Club> getListOfClubs(Student student) {
		List<Club> listOfClubs = new ArrayList<Club>();
		try {
			ConnectionPool pool = ConnectionPool.getInstance();
			Connection connection = pool.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;

			String query2 = "SELECT (select name from `club` where id=a.club_id) as 'name', a.club_id 'club_id'"
					+ " FROM `student_x_club` as `a` " 
					+ "WHERE a.student_id = ?";
			try {
				ps = connection.prepareStatement(query2);
				ps.setInt(1, student.getId());
				rs = ps.executeQuery();
				while (rs.next()) {
					Club club = new Club();
					club.setId(rs.getInt("club_id"));
					club.setName(rs.getString("name"));
					listOfClubs.add(club);
				}
				student.setListOfClubs(listOfClubs);
			} catch (SQLException e) {
				System.out.println(e);
			} finally {
				DBUtility.closeResultSet(rs);
				DBUtility.closePreparedStatement(ps);
				pool.freeConnection(connection);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return listOfClubs;

	}

	public static Club clubSearch(Club club) {
		try {
			ConnectionPool pool = ConnectionPool.getInstance();
			Connection connection = pool.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;

			String query = "SELECT club.id clubId, school.name school FROM `club`, `school` WHERE club.school_id = school.id and club.name =  ?";
			try {
				ps = connection.prepareStatement(query);
				ps.setString(1, club.getName());
				rs = ps.executeQuery();
				if (rs.next()) {
					club.setId(rs.getInt("clubId"));
					School school = new School();
					school.setName(rs.getString("school"));
					club.setSchool(school);
				}

			} catch (SQLException e) {
				System.out.println(e);
			} finally {
				DBUtility.closeResultSet(rs);
				DBUtility.closePreparedStatement(ps);
				pool.freeConnection(connection);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return club;
	}

	public static List<Student> getListOfStudentsInClub(Club club) {
		List<Student> listOfStudents = new ArrayList<Student>();
		try {
			ConnectionPool pool = ConnectionPool.getInstance();
			Connection connection = pool.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;

			String query2 = "SELECT student.name name, student.id id FROM `student_x_club` x, `student` WHERE student.id = student_id and club_id = ?";
			try {
				ps = connection.prepareStatement(query2);
				ps.setInt(1, club.getId());
				rs = ps.executeQuery();
				while (rs.next()) {
					Student student = new Student();
					student.setId(rs.getInt("id"));
					student.setName(rs.getString("name"));
					listOfStudents.add(student);
				}
			} catch (SQLException e) {
				System.out.println(e);
			} finally {
				DBUtility.closeResultSet(rs);
				DBUtility.closePreparedStatement(ps);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return listOfStudents;
	}
}
