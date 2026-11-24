/**
 * Licensee: paul(HTWG Konstanz)
 * License Type: Academic
 */
import org.orm.*;
public class ListDbsys2Data {
	private static final int ROW_COUNT = 100;
	
	public void listTestData() throws PersistentException {
		System.out.println("Listing Vorlesung...");
		Vorlesung[] vorlesungs = Vorlesung.listVorlesungByQuery(null, null);
		int length = Math.min(vorlesungs.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(vorlesungs[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
		System.out.println("Listing Studiengang...");
		Studiengang[] studiengangs = Studiengang.listStudiengangByQuery(null, null);
		length = Math.min(studiengangs.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(studiengangs[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
	}
	
	public void listByCriteria() throws PersistentException {
		System.out.println("Listing Vorlesung by Criteria...");
		VorlesungCriteria vorlesungCriteria = new VorlesungCriteria();
		// Please uncomment the follow line and fill in parameter(s) 
		//vorlesungCriteria.ID.eq();
		vorlesungCriteria.setMaxResults(ROW_COUNT);
		Vorlesung[] vorlesungs = vorlesungCriteria.listVorlesung();
		int length =vorlesungs== null ? 0 : Math.min(vorlesungs.length, ROW_COUNT); 
		for (int i = 0; i < length; i++) {
			 System.out.println(vorlesungs[i]);
		}
		System.out.println(length + " Vorlesung record(s) retrieved."); 
		
		System.out.println("Listing Studiengang by Criteria...");
		StudiengangCriteria studiengangCriteria = new StudiengangCriteria();
		// Please uncomment the follow line and fill in parameter(s) 
		//studiengangCriteria.kuerzel.eq();
		studiengangCriteria.setMaxResults(ROW_COUNT);
		Studiengang[] studiengangs = studiengangCriteria.listStudiengang();
		length =studiengangs== null ? 0 : Math.min(studiengangs.length, ROW_COUNT); 
		for (int i = 0; i < length; i++) {
			 System.out.println(studiengangs[i]);
		}
		System.out.println(length + " Studiengang record(s) retrieved."); 
		
	}
	
	public static void main(String[] args) {
		try {
			ListDbsys2Data listDbsys2Data = new ListDbsys2Data();
			try {
				listDbsys2Data.listTestData();
				//listDbsys2Data.listByCriteria();
			}
			finally {
				Dbsys2PersistentManager.instance().disposePersistentManager();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
