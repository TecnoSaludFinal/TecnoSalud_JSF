/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.TipoCita;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Deiver
 */
@Stateless
public class TipoCitaFacade extends AbstractFacade<TipoCita> implements TipoCitaFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TipoCitaFacade() {
        super(TipoCita.class);
    }
    
    @Override
    public TipoCita findByNombre(String nombre)
    {
        TipoCita tc;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT tc FROM TipoCita tc WHERE tc.nombre = :tipocita").setParameter("tipocita", nombre);
            
            tc = (TipoCita) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return tc;
    }
    
}
