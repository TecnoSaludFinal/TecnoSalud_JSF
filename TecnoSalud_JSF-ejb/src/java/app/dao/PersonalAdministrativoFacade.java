/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.PersonalAdministrativo;
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
public class PersonalAdministrativoFacade extends AbstractFacade<PersonalAdministrativo> implements PersonalAdministrativoFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PersonalAdministrativoFacade() {
        super(PersonalAdministrativo.class);
    }
    
    @Override
    public PersonalAdministrativo findByDni(String dni)
    {
        PersonalAdministrativo m;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT pa FROM PersonalAdministrativo pa WHERE pa.dni = :dni").setParameter("dni", dni);
            m = (PersonalAdministrativo) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return m;
    }
    
    @Override
    public PersonalAdministrativo findByDni(String dni, String pass)
    {
        PersonalAdministrativo m;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT pa FROM PersonalAdministrativo pa WHERE pa.dni = :dni AND pa.contrasena = :pass")
                    .setParameter("dni", dni).setParameter("pass", pass);
            m = (PersonalAdministrativo) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return m;
    }
    
    @Override
    public PersonalAdministrativo findById(Integer id)
    {
        PersonalAdministrativo pa;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT pa FROM PersonalAdministrativo pa WHERE pa.idPersonalAdmin = :id").setParameter("id", id);
            pa = (PersonalAdministrativo) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return pa;      
    }
    
     @Override
    public void actualizar(PersonalAdministrativo pa , Integer num)
    {
        num++;
        Query q;
        q = em.createQuery("UPDATE PersonalAdministrativo pa SET pa.idPersonalAdmin ="+num+" WHERE pa.idPersonalAdmin =:id2").setParameter("id2", pa.getIdPersonalAdmin());
        q.executeUpdate();
    }
    
}
