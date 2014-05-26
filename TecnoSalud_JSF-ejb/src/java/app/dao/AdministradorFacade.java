/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.Administrador;
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
public class AdministradorFacade extends AbstractFacade<Administrador> implements AdministradorFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdministradorFacade() {
        super(Administrador.class);
    }
    
    @Override
    public Administrador findByDni(String dni)
    {
        Administrador m;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT a FROM Administrador a WHERE a.dni = :dni").setParameter("dni", dni);
            m = (Administrador) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return m;
    }
    
    @Override
    public Administrador findByDni(String dni, String pass)
    {
        Administrador m;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT a FROM Administrador a WHERE a.dni = :dni AND a.contrasena = :pass")
                    .setParameter("dni", dni).setParameter("pass", pass);
            m = (Administrador) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return m;
    }
    
}
