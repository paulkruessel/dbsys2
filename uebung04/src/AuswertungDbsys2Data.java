import org.orm.*;
import java.util.Set;
import java.util.TreeSet;

public class AuswertungDbsys2Data {

	public void teilD() throws PersistentException {
		System.out.println("=== Teil d: Vorlesungen mit ECTS und Studiengang ===");
		Vorlesung[] vorlesungen = Vorlesung.listVorlesungByQuery(null, "Vorlesung.name");
		for (Vorlesung v : vorlesungen) {
			System.out.printf("%-40s %3d ECTS  %s%n", v.getName(), v.getEcts(), v.getStudiengang().getKuerzel());
		}
		System.out.println();
	}

	public void teilE() throws PersistentException {
		System.out.println("=== Teil e: Summe der ECTS pro Studiengang ===");
		Studiengang[] studiengaenge = Studiengang.listStudiengangByQuery(null, "Studiengang.kuerzel");
		for (Studiengang s : studiengaenge) {
			int summe = 0;
			for (Vorlesung v : s.vorlesung.toArray()) {
				summe += v.getEcts();
			}
			System.out.printf("%-30s %3d ECTS%n", s.getName(), summe);
		}
		System.out.println();
	}

	public void teilF() throws PersistentException {
		System.out.println("=== Teil f: Vorlesungen mit gleichem Namen in AIN und WIN ===");
		Set<String> ain = namenVon("AIN");
		Set<String> win = namenVon("WIN");
		ain.retainAll(win);
		if (ain.isEmpty()) {
			System.out.println("Keine gemeinsamen Vorlesungsnamen.");
		}
		for (String name : ain) {
			System.out.println(name);
		}
		System.out.println();
	}

	private Set<String> namenVon(String kuerzel) throws PersistentException {
		Set<String> namen = new TreeSet<>();
		Studiengang s = Studiengang.getStudiengangByORMID(kuerzel);
		if (s != null) {
			for (Vorlesung v : s.vorlesung.toArray()) {
				namen.add(v.getName());
			}
		}
		return namen;
	}

	public static void main(String[] args) {
		try {
			AuswertungDbsys2Data a = new AuswertungDbsys2Data();
			try {
				a.teilD();
				a.teilE();
				a.teilF();
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
