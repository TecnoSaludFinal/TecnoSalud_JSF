/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.Citas;
import java.util.Date;
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
public class CitasFacade extends AbstractFacade<Citas> implements CitasFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CitasFacade() {
        super(Citas.class);
    }
    
    @Override
    public List<Citas> findAllByNuhsa(Integer nuhsa)
    {
        List<Citas> c;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT c FROM Citas c WHERE c.nushaPaciente.nuhsa = :nuhsa").setParameter("nuhsa", nuhsa);
            //q = em.createNamedQuery("Pacientes.findByDni").setParameter("dni", dni); //No funciona
            c = (List<Citas>) q.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return c;
    }
    
    @Override
    public Citas findById(Integer id)
    {
        Citas c;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT c FROM Citas c WHERE c.idCitas = :id").setParameter("id", id);
            c = (Citas) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        
        return c;
    }
    
    @Override
    public List<Citas> findAllById_Med(Integer id_med)
    {
        List<Citas> c;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT c FROM Citas c WHERE c.idMedicos.idMedicos = :id_med").setParameter("id_med", id_med);
            //q = em.createNamedQuery("Pacientes.findByDni").setParameter("dni", dni); //No funciona
            c = (List<Citas>) q.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return c;
    }
    
    @Override
    public void actualizar(Citas c, Integer num)
    {
        num++;
        Query q;
        q = em.createQuery("UPDATE Citas c SET c.idCitas ="+num+" WHERE c.idCitas =:id2").setParameter("id2", c.getIdCitas());
        q.executeUpdate();
    }
    
    @Override
    public List<Citas> findByFecha (Date fecha) {
        
        //HistorialMedico hm;
         List<Citas> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Citas t WHERE t.fecha =:fecha")
                 .setParameter("fecha", fecha);
       // buscarNuhsa.setParameter("nuhsa", nuhsa);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Citas>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
    @Override
    public List<Citas> findByPendiente (Date fecha) {
        
        //HistorialMedico hm;
         List<Citas> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Citas t WHERE t.fecha >:fecha")
                 .setParameter("fecha", fecha);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Citas>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
    @Override
    public List<Citas> findByPasada (Date fecha) {
        
        //HistorialMedico hm;
         List<Citas> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Citas t WHERE t.fecha <:fecha")
                 .setParameter("fecha", fecha);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Citas>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
    @Override
    public List<Citas> findByNombre(String apellidos) {
        
        //HistorialMedico hm;
         List<Citas> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Citas t WHERE t.idMedicos.apellidos =:apellidos")
                 .setParameter("apellidos",apellidos);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Citas>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
    @Override
     public List<Citas> findByFechaNuhsa (Date fecha, Integer nuhsa) {
        
        //HistorialMedico hm;
         List<Citas> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t FROM Citas t WHERE t.fecha = :fecha AND t.nushaPaciente.nuhsa = :nuhsa")
                 .setParameter("fecha", fecha)
                .setParameter("nuhsa", nuhsa);
     
        hm = (List<Citas>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
     @Override
     public List<Citas> findByFechaIdMedico (Date fecha, Integer id) {
        
        //HistorialMedico hm;
         List<Citas> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Citas t WHERE t.fecha = :fecha and t.idMedicos.idMedicos = :id")
                 .setParameter("fecha", fecha)
                .setParameter("id", id);
     
        hm = (List<Citas>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
     
     @Override
    public List<Citas> findByPendienteNuhsa(Date fecha, Integer nuhsa) {
        
        //HistorialMedico hm;
         List<Citas> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Citas t WHERE t.fecha >:fecha AND t.nushaPaciente.nuhsa = :nuhsa")
                 .setParameter("fecha", fecha)
                . setParameter("nuhsa", nuhsa);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Citas>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
    @Override
    public List<Citas> findByPendienteIdMedico(Date fecha, Integer id) {
        
        //HistorialMedico hm;
         List<Citas> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Citas t WHERE t.fecha >:fecha AND t.idMedicos.idMedicos = :id")
                 .setParameter("fecha", fecha)
                . setParameter("id", id);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Citas>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
    @Override
    public List<Citas> findByPasadaNuhsa(Date fecha, Integer nuhsa) {
        
        //HistorialMedico hm;
         List<Citas> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Citas t WHERE t.fecha <:fecha AND t.nushaPaciente.nuhsa = :nuhsa")
                 .setParameter("fecha", fecha).setParameter("nuhsa", nuhsa);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Citas>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
     @Override
    public  List<Citas> findByPasadaIdMedico(Date fecha, Integer id) {
        
        //HistorialMedico hm;
         List<Citas> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Citas t WHERE t.fecha <:fecha AND t.idMedicos.idMedicos = :id")
                 .setParameter("fecha", fecha).setParameter("id", id);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Citas>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
}
