/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.Hora;
import java.sql.Time;
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
public class HoraFacade extends AbstractFacade<Hora> implements HoraFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public HoraFacade() {
        super(Hora.class);
    }
    
    @Override
    public Hora findByHora(Time h)
    {
        Hora hora;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT h FROM Hora h WHERE h.hora = :hora").setParameter("hora", h);
            hora = (Hora) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return hora;
        
    }
    
    @Override
    public Hora findByIdHora(Integer h)
    {
        Hora hora;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT h FROM Hora h WHERE h.idHora = :hora").setParameter("hora", h);
            hora = (Hora) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return hora;
        
    }
    
}
