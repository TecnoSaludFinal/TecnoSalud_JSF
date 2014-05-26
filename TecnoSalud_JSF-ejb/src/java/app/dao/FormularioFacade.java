/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.Formulario;
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
public class FormularioFacade extends AbstractFacade<Formulario> implements FormularioFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FormularioFacade() {
        super(Formulario.class);
    }
    
    @Override
    public Formulario findByIdFormulario2 (Integer id) {
        
        //HistorialMedico hm;
        Formulario hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Formulario t WHERE t.idFormulario =:id")
                 .setParameter("id", id);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (Formulario)  buscarNuhsa.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
    @Override
    public List<Formulario> findByNUHSA (Integer nuhsa) {
        
        //HistorialMedico hm;
        List<Formulario> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Formulario t WHERE t.nuhsaPaciente.nuhsa =:nuhsa")
                 .setParameter("nuhsa", nuhsa);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Formulario>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    @Override
    public Formulario findByNUHSAform (Integer nuhsa, Integer id) {
        
        //HistorialMedico hm;
        Formulario hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Formulario t WHERE t.nuhsaPaciente.nuhsa =:nuhsa AND t.idFormulario = :id")
                 .setParameter("nuhsa", nuhsa)
                . setParameter("id", id);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (Formulario)  buscarNuhsa.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
    @Override
    public List<Formulario> findById(Integer id) {
        
        //HistorialMedico hm;
        List<Formulario> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Formulario t WHERE t.idFormulario =:id")
                 .setParameter("id", id);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Formulario>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
     @Override
    public Formulario findByIdFormulario (Integer id) {
        
        //HistorialMedico hm;
        Formulario hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Formulario t WHERE t.idFormulario =:id")
                 .setParameter("id", id);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (Formulario)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
     
     @Override
    public List<Formulario> findByQuejas (Integer quejas){
        
        //HistorialMedico hm;
        List<Formulario> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Formulario t WHERE t.idTipoform.idTipoform =:quejas")
                 .setParameter("quejas", quejas);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Formulario> )  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    @Override
    public List<Formulario> findBySugerencias (Integer sugerencia){
        
        //HistorialMedico hm;
        List<Formulario> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Formulario t WHERE t.idTipoform.idTipoform =:sugerencia")
                 .setParameter("sugerencia", sugerencia);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Formulario> )  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
        @Override
    public List<Formulario> findByFelicitaciones (Integer felicitacion){
        
        //HistorialMedico hm;
        List<Formulario> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from Formulario t WHERE t.idTipoform.idTipoform =:felicitacion")
                 .setParameter("felicitacion", felicitacion);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<Formulario> )  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
          @Override
    public void actualizar(Formulario c, Integer num)
    {
        num++;
        Query q;
        q = em.createQuery("UPDATE Formulario c SET c.idFormulario ="+num+" WHERE c.idFormulario =:id2").setParameter("id2", c.getIdFormulario());
        q.executeUpdate();
    }
    
}
