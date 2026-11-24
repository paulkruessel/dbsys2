/**
 * Licensee: paul(HTWG Konstanz)
 * License Type: Academic
 */
import org.orm.*;
public class RetrieveAndUpdateDbsys2Data {
	public void retrieveAndUpdateTestData() throws PersistentException {
		PersistentTransaction t = Dbsys2PersistentManager.instance().getSession().beginTransaction();
		try {
			Vorlesung vorlesung = Vorlesung.loadVorlesungByQuery(null, null);
			// Update the properties of the persistent object
			vorlesung.save();
			Studiengang studiengang = Studiengang.loadStudiengangByQuery(null, null);
			// Update the properties of the persistent object
			studiengang.save();
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public void retrieveByCriteria() throws PersistentException {
		System.out.println("Retrieving Vorlesung by VorlesungCriteria");
		VorlesungCriteria vorlesungCriteria = new VorlesungCriteria();
		// Please uncomment the follow line and fill in parameter(s)
		//vorlesungCriteria.ID.eq();
		System.out.println(vorlesungCriteria.uniqueVorlesung());
		
		System.out.println("Retrieving Studiengang by StudiengangCriteria");
		StudiengangCriteria studiengangCriteria = new StudiengangCriteria();
		// Please uncomment the follow line and fill in parameter(s)
		//studiengangCriteria.kuerzel.eq();
		System.out.println(studiengangCriteria.uniqueStudiengang());
		
	}
	
	
	public static void main(String[] args) {
		try {
			RetrieveAndUpdateDbsys2Data retrieveAndUpdateDbsys2Data = new RetrieveAndUpdateDbsys2Data();
			try {
				retrieveAndUpdateDbsys2Data.retrieveAndUpdateTestData();
				//retrieveAndUpdateDbsys2Data.retrieveByCriteria();
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
