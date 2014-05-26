/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.Roles;
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
public class RolesFacade extends AbstractFacade<Roles> implements RolesFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RolesFacade() {
        super(Roles.class);
    }
    
    @Override
     public Roles findById (Integer id)
    {
        Roles rol;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT rol FROM Roles rol WHERE rol.idRol = :id").setParameter("id", id);
            rol = (Roles) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return rol;       
    }
    
}
