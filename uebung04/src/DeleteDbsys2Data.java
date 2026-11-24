/**
 * Licensee: paul(HTWG Konstanz)
 * License Type: Academic
 */
import org.orm.*;
public class DeleteDbsys2Data {
	public void deleteTestData() throws PersistentException {
		PersistentTransaction t = Dbsys2PersistentManager.instance().getSession().beginTransaction();
		try {
			Vorlesung vorlesung = Vorlesung.loadVorlesungByQuery(null, null);
			vorlesung.delete();
			Studiengang studiengang = Studiengang.loadStudiengangByQuery(null, null);
			studiengang.delete();
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public static void main(String[] args) {
		try {
			DeleteDbsys2Data deleteDbsys2Data = new DeleteDbsys2Data();
			try {
				deleteDbsys2Data.deleteTestData();
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
