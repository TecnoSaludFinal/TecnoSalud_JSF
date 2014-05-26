/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.Citas;
import app.entity.Medicos;
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
public class MedicosFacade extends AbstractFacade<Medicos> implements MedicosFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MedicosFacade() {
        super(Medicos.class);
    }
    
    @Override
    public Medicos findById(Integer id)
    {
        Medicos m;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT m FROM Medicos m WHERE m.idMedicos = :id").setParameter("id", id);
            m = (Medicos) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return m;
    }
    
    @Override
    public Medicos findByDni(String dni)
    {
        Medicos m;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT m FROM Medicos m WHERE m.dni = :dni").setParameter("dni", dni);
            m = (Medicos) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return m;
    }
    
    @Override
    public Medicos findByDni(String dni, String pass)
    {
        Medicos m;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT m FROM Medicos m WHERE m.dni = :dni AND m.contrasena = :pass")
                    .setParameter("dni", dni).setParameter("pass", pass);
            m = (Medicos) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return m;
    }
    
    //Jose Antonio
    
    @Override
    public List<Medicos> findByNombre(String apellidos) {
        
        //HistorialMedico hm;
         List<Medicos> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Medicos t WHERE t.apellidos =:apellidos")
                 .setParameter("apellidos",apellidos);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Medicos>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
    @Override
    public void actualizar(Medicos me , Integer num)
    {
        num++;
        Query q;
        q = em.createQuery("UPDATE Medicos me SET me.idMedicos ="+num+" WHERE me.idMedicos =:id2").setParameter("id2", me.getIdMedicos());
        q.executeUpdate();
    }
    
    @Override
    public Medicos findByIdEspecialidad(String n)
    {
        Medicos m;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT m FROM Medicos m WHERE m.idEspecialidad.nombre = :especialidad").setParameter("especialidad", n);
            m = (Medicos) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return m;
    }
    
    @Override
    public List<Medicos> findByIdAllEspecialidad(String n)
    {
        List<Medicos> m;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT m FROM Medicos m WHERE m.idEspecialidad.nombre = :especialidad").setParameter("especialidad", n);
            m = (List<Medicos>) q.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return m;
    }
}
