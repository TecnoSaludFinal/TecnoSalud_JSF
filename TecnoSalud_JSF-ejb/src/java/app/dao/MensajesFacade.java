/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.Mensajes;
import java.util.List;
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
public class MensajesFacade extends AbstractFacade<Mensajes> implements MensajesFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MensajesFacade() {
        super(Mensajes.class);
    }

    @Override
    public List<Mensajes> findAllByRemi(String r)
    {
        List<Mensajes> lista;
        Query q;
        try
        {
            q = em.createNamedQuery("Mensajes.findByRemitente").setParameter("remitente", r);
            lista = (List<Mensajes>) q.getResultList();
            
        }catch(NoResultException e)
        {
            return null;
        }
        return lista;
    }
    
    public List<Mensajes> findNotReaded(String owner)
    {
        List<Mensajes> mensa;
        Query q;
        String p = "P";
        try
        {
            q = em.createQuery("SELECT mensa FROM Mensajes mensa WHERE mensa.estado = :p AND mensa.destinatario = :owner")
                    .setParameter("owner", owner)
                    .setParameter("p", p);
            mensa = q.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return mensa;   
    }

    public List<Mensajes> findReaded(String owner)
    {
        List<Mensajes> mensa;
        Query q;
        String s = "S";
        try
        {
            q = em.createQuery("SELECT mensa FROM Mensajes mensa WHERE mensa.estado = :s AND mensa.destinatario = :owner")
                    .setParameter("owner", owner)
                    .setParameter("s", s);
            mensa = q.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return mensa;   
    }

    
    
}
