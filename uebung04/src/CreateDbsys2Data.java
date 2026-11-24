/**
 * Licensee: paul(HTWG Konstanz)
 * License Type: Academic
 */
import org.orm.*;
public class CreateDbsys2Data {
	public void createTestData() throws PersistentException {
		PersistentTransaction t = Dbsys2PersistentManager.instance().getSession().beginTransaction();
		try {
			Studiengang ain = neuerStudiengang("AIN", "Angewandte Informatik", "Bachelor of Science");
			Studiengang win = neuerStudiengang("WIN", "Wirtschaftsinformatik", "Bachelor of Science");

			neueVorlesung(ain, "Mathematik 1", 8, 6);
			neueVorlesung(ain, "Programmiertechnik 1", 8, 6);
			neueVorlesung(ain, "Datenbanksysteme 1", 5, 4);
			neueVorlesung(ain, "Betriebssysteme", 6, 4);
			neueVorlesung(ain, "Teamprojekt", 9, 1);

			neueVorlesung(win, "Betriebswirtschaftslehre", 7, 5);
			neueVorlesung(win, "Rechnungswesen", 8, 6);
			neueVorlesung(win, "Datenbank- und Informationssysteme 1", 7, 6);
			neueVorlesung(win, "Betriebssysteme", 6, 4);
			neueVorlesung(win, "Teamprojekt", 9, 1);

			t.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		}
	}

	private Studiengang neuerStudiengang(String kuerzel, String name, String abschluss) throws PersistentException {
		Studiengang s = Studiengang.createStudiengang();
		s.setKuerzel(kuerzel);
		s.setName(name);
		s.setAbschluss(abschluss);
		s.save();
		return s;
	}

	private void neueVorlesung(Studiengang s, String name, int ects, int sws) throws PersistentException {
		Vorlesung v = Vorlesung.createVorlesung();
		v.setName(name);
		v.setEcts(ects);
		v.setSws(sws);
		v.setStudiengang(s);
		v.save();
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
