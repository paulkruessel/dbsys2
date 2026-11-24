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
import org.hibernate.Criteria;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import org.orm.criteria.*;

public class StudiengangCriteria extends AbstractORMCriteria {
	public final StringExpression kuerzel;
	public final StringExpression name;
	public final StringExpression abschluss;
	public final CollectionExpression vorlesung;
	
	public StudiengangCriteria(Criteria criteria) {
		super(criteria);
		kuerzel = new StringExpression("kuerzel", this);
		name = new StringExpression("name", this);
		abschluss = new StringExpression("abschluss", this);
		vorlesung = new CollectionExpression("ORM_Vorlesung", this);
	}
	
	public StudiengangCriteria(PersistentSession session) {
		this(session.createCriteria(Studiengang.class));
	}
	
	public StudiengangCriteria() throws PersistentException {
		this(Dbsys2PersistentManager.instance().getSession());
	}
	
	public VorlesungCriteria createVorlesungCriteria() {
		return new VorlesungCriteria(createCriteria("ORM_Vorlesung"));
	}
	
	public Studiengang uniqueStudiengang() {
		return (Studiengang) super.uniqueResult();
	}
	
	public Studiengang[] listStudiengang() {
		java.util.List list = super.list();
		return (Studiengang[]) list.toArray(new Studiengang[list.size()]);
	}
}

