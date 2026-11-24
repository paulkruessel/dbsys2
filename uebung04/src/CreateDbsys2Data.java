/**
 * Licensee: paul(HTWG Konstanz)
 * License Type: Academic
 */
import org.orm.*;
public class CreateDbsys2Data {
	public void createTestData() throws PersistentException {
		PersistentTransaction t = Dbsys2PersistentManager.instance().getSession().beginTransaction();
		try {
			Vorlesung vorlesung = Vorlesung.createVorlesung();
			// TODO Initialize the properties of the persistent object here, the following properties must be initialized before saving : sws, ects, studiengang
			vorlesung.save();
			Studiengang studiengang = Studiengang.createStudiengang();
			// TODO Initialize the properties of the persistent object here, the following properties must be initialized before saving : vorlesung, kuerzel
			studiengang.save();
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public static void main(String[] args) {
		try {
			CreateDbsys2Data createDbsys2Data = new CreateDbsys2Data();
			try {
				createDbsys2Data.createTestData();
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
