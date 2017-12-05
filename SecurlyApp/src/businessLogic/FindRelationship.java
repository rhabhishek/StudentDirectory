/**
 * 
 */
package businessLogic;

import java.util.ArrayList;
import java.util.List;

import dao.SearchDAO;
import model.Club;
import model.Student;

/**
 * @author Abhishek
 *
 */
public class FindRelationship {
	
	public static boolean findRelationship(Student student1, Student student2){
		
		List<Club> student1Clubs = new ArrayList<Club>();
		List<Club> student2Clubs = new ArrayList<Club>();
		student1 = SearchDAO.studentSearch(student1);
		student1Clubs = SearchDAO.getListOfClubs(student1);
		student2 = SearchDAO.studentSearch(student2);
		student2Clubs = SearchDAO.getListOfClubs(student2);
		for (Club club1 : student1Clubs) {
			for (Club club2 : student2Clubs) {
				if(club1.getName().equals(club2.getName())){
					return true;
				}
			}
		}
		return false;
	}
}
