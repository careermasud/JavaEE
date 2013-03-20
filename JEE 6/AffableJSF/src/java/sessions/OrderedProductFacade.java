/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import entity.OrderedProduct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Masudul Haque
 */
@Stateless
public class OrderedProductFacade extends AbstractFacade<OrderedProduct> {
    @PersistenceContext(unitName = "AffableJSFPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderedProductFacade() {
        super(OrderedProduct.class);
    }
    
}
