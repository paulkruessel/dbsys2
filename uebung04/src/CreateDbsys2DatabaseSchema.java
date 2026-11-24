/**
 * Licensee: paul(HTWG Konstanz)
 * License Type: Academic
 */
import org.orm.*;
public class CreateDbsys2DatabaseSchema {
	public static void main(String[] args) {
		try {
			ORMDatabaseInitiator.createSchema(Dbsys2PersistentManager.instance());
			Dbsys2PersistentManager.instance().disposePersistentManager();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
