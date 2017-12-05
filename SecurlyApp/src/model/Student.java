/**
 * 
 */
package model;

import java.util.List;

/**
 * @author Abhishek
 *
 */
public class Student {

	private String name;
	private String email;
	private int id;
	private School school;
	private List<Club> listOfClubs;
	
	
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the school
	 */
	public School getSchool() {
		return school;
	}
	/**
	 * @param school the school to set
	 */
	public void setSchool(School school) {
		this.school = school;
	}
	/**
	 * @return the listOfClubs
	 */
	public List<Club> getListOfClubs() {
		return listOfClubs;
	}
	/**
	 * @param listOfClubs2 the listOfClubs to set
	 */
	public void setListOfClubs(List<Club> listOfClubs2) {
		this.listOfClubs = listOfClubs2;
	}
	
	
}
