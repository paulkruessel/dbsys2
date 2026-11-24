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

public class VorlesungCriteria extends AbstractORMCriteria {
	public final IntegerExpression ID;
	public final StringExpression studiengangId;
	public final AssociationExpression studiengang;
	public final StringExpression name;
	public final IntegerExpression ects;
	public final IntegerExpression sws;
	
	public VorlesungCriteria(Criteria criteria) {
		super(criteria);
		ID = new IntegerExpression("ID", this);
		studiengangId = new StringExpression("studiengang.kuerzel", this);
		studiengang = new AssociationExpression("studiengang", this);
		name = new StringExpression("name", this);
		ects = new IntegerExpression("ects", this);
		sws = new IntegerExpression("sws", this);
	}
	
	public VorlesungCriteria(PersistentSession session) {
		this(session.createCriteria(Vorlesung.class));
	}
	
	public VorlesungCriteria() throws PersistentException {
		this(Dbsys2PersistentManager.instance().getSession());
	}
	
	public StudiengangCriteria createStudiengangCriteria() {
		return new StudiengangCriteria(createCriteria("studiengang"));
	}
	
	public Vorlesung uniqueVorlesung() {
		return (Vorlesung) super.uniqueResult();
	}
	
	public Vorlesung[] listVorlesung() {
		java.util.List list = super.list();
		return (Vorlesung[]) list.toArray(new Vorlesung[list.size()]);
	}
}

