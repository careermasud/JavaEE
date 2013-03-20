/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import entity.Seller;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Masudul Haque
 */
@Stateless
public class SellerFacade extends AbstractFacade<Seller> {
    @PersistenceContext(unitName = "AffableJSFPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SellerFacade() {
        super(Seller.class);
    }
    
}
