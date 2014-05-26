/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.Especialidad;
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
public class EspecialidadFacade extends AbstractFacade<Especialidad> implements EspecialidadFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EspecialidadFacade() {
        super(Especialidad.class);
    }
    
    @Override
    public Especialidad findByNombre(String nombre)
    {
        Especialidad e;
        Query q;
        try
        {
            q = em.createQuery("SELECT e FROM Especialidad e WHERE e.nombre = :nombre").setParameter("nombre", nombre);
            e = (Especialidad) q.getSingleResult();
        }
        catch(NoResultException ee)
        {
            return null;
        }
        
        return e;
    }
    
    @Override
    public Especialidad findById(Integer id) {
        
        Especialidad hm;
        Query buscarId;
        
        try
        {
        
        buscarId= em.createQuery("SELECT t from Especialidad t WHERE t.idEspecialidad =:id")
                 .setParameter("id", id);
        
        hm = (Especialidad) buscarId.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
}
