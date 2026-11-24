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

public class VorlesungDetachedCriteria extends AbstractORMDetachedCriteria {
	public final IntegerExpression ID;
	public final StringExpression studiengangId;
	public final AssociationExpression studiengang;
	public final StringExpression name;
	public final IntegerExpression ects;
	public final IntegerExpression sws;
	
	public VorlesungDetachedCriteria() {
		super(Vorlesung.class, VorlesungCriteria.class);
		ID = new IntegerExpression("ID", this.getDetachedCriteria());
		studiengangId = new StringExpression("studiengang.kuerzel", this.getDetachedCriteria());
		studiengang = new AssociationExpression("studiengang", this.getDetachedCriteria());
		name = new StringExpression("name", this.getDetachedCriteria());
		ects = new IntegerExpression("ects", this.getDetachedCriteria());
		sws = new IntegerExpression("sws", this.getDetachedCriteria());
	}
	
	public VorlesungDetachedCriteria(DetachedCriteria aDetachedCriteria) {
		super(aDetachedCriteria, VorlesungCriteria.class);
		ID = new IntegerExpression("ID", this.getDetachedCriteria());
		studiengangId = new StringExpression("studiengang.kuerzel", this.getDetachedCriteria());
		studiengang = new AssociationExpression("studiengang", this.getDetachedCriteria());
		name = new StringExpression("name", this.getDetachedCriteria());
		ects = new IntegerExpression("ects", this.getDetachedCriteria());
		sws = new IntegerExpression("sws", this.getDetachedCriteria());
	}
	
	public StudiengangDetachedCriteria createStudiengangCriteria() {
		return new StudiengangDetachedCriteria(createCriteria("studiengang"));
	}
	
	public Vorlesung uniqueVorlesung(PersistentSession session) {
		return (Vorlesung) super.createExecutableCriteria(session).uniqueResult();
	}
	
	public Vorlesung[] listVorlesung(PersistentSession session) {
		List list = super.createExecutableCriteria(session).list();
		return (Vorlesung[]) list.toArray(new Vorlesung[list.size()]);
	}
}

