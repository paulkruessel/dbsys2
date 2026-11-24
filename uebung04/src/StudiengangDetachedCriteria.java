/**
 * "Visual Paradigm: DO NOT MODIFY THIS FILE!"
 * 
 * This is an automatic generated file. It will be regenerated every time 
 * you generate persistence class.
 * 
 * Modifying its content may cause the program not work, or your work may lost.
 */

/**
 * Licensee: paul(HTWG Konstanz)
 * License Type: Academic
 */
import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import org.orm.PersistentSession;
import org.orm.criteria.*;

public class StudiengangDetachedCriteria extends AbstractORMDetachedCriteria {
	public final StringExpression kuerzel;
	public final StringExpression name;
	public final StringExpression abschluss;
	public final CollectionExpression vorlesung;
	
	public StudiengangDetachedCriteria() {
		super(Studiengang.class, StudiengangCriteria.class);
		kuerzel = new StringExpression("kuerzel", this.getDetachedCriteria());
		name = new StringExpression("name", this.getDetachedCriteria());
		abschluss = new StringExpression("abschluss", this.getDetachedCriteria());
		vorlesung = new CollectionExpression("ORM_Vorlesung", this.getDetachedCriteria());
	}
	
	public StudiengangDetachedCriteria(DetachedCriteria aDetachedCriteria) {
		super(aDetachedCriteria, StudiengangCriteria.class);
		kuerzel = new StringExpression("kuerzel", this.getDetachedCriteria());
		name = new StringExpression("name", this.getDetachedCriteria());
		abschluss = new StringExpression("abschluss", this.getDetachedCriteria());
		vorlesung = new CollectionExpression("ORM_Vorlesung", this.getDetachedCriteria());
	}
	
	public VorlesungDetachedCriteria createVorlesungCriteria() {
		return new VorlesungDetachedCriteria(createCriteria("ORM_Vorlesung"));
	}
	
	public Studiengang uniqueStudiengang(PersistentSession session) {
		return (Studiengang) super.createExecutableCriteria(session).uniqueResult();
	}
	
	public Studiengang[] listStudiengang(PersistentSession session) {
		List list = super.createExecutableCriteria(session).list();
		return (Studiengang[]) list.toArray(new Studiengang[list.size()]);
	}
}

