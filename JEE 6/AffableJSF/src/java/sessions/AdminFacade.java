/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import entity.Admin;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.EntityType;

/**
 *
 * @author Masudul Haque
 */
@Stateless
public class AdminFacade extends AbstractFacade<Admin> {
    @PersistenceContext(unitName = "AffableJSFPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdminFacade() {
        super(Admin.class);
    }

    public Admin findByUserNamePass(String userName, String password) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery cq = cb.createQuery(Admin.class);
        Root<Admin> aRoot = cq.from(Admin.class);
//        EntityType<Admin> type = aRoot.getModel();
        cq.where(cb.equal(aRoot.get("userName"), userName));
        cq.where(cb.equal(aRoot.get("password"), password));
       
        TypedQuery<Admin> tq=em.createQuery(cq);
        return tq.getSingleResult();
//        Query q = em.createNamedQuery("Admin.findByUserNamePassword");
//        q.setParameter("userName", userName);
//        q.setParameter("password", password);
//        List obj = q.getResultList();
//        if (!obj.isEmpty()) {
//            return (Admin) obj.get(0);
//        } else {
//            return null;
//        }
    }
}
