/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.PeticionCita;
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
public class PeticionCitaFacade extends AbstractFacade<PeticionCita> implements PeticionCitaFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PeticionCitaFacade() {
        super(PeticionCita.class);
    }
    
    @Override
    public PeticionCita findById(Integer id)
    {
        PeticionCita pc;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT pc FROM PeticionCita pc WHERE pc.idPeticion = :id").setParameter("id", id);
            pc = (PeticionCita) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return pc;
    }
    
    @Override
    public List<PeticionCita> findAllByNuhsa(Integer id)
    {
        List<PeticionCita> pc;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT pc FROM PeticionCita pc WHERE pc.nuhsaPaciente.nuhsa = :id").setParameter("id", id);
            pc = (List<PeticionCita>) q.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return pc;
    }

    @Override
    public void actualizar(PeticionCita pc, Integer num)
    {
        num++;
        Query q;
        q = em.createQuery("UPDATE PeticionCita pc SET pc.idPeticion ="+num+" WHERE pc.idPeticion =:id2").setParameter("id2", pc.getIdPeticion());
        q.executeUpdate();
    }
    
}
