/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.HistorialMedico;
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
public class HistorialMedicoFacade extends AbstractFacade<HistorialMedico> implements HistorialMedicoFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public HistorialMedicoFacade() {
        super(HistorialMedico.class);
    }
    
    @Override
    public List<HistorialMedico> findByNUHSA (Integer nuhsa) {
        
        //HistorialMedico hm;
         List<HistorialMedico> hm;
        Query buscarNuhsa;
        
        try
        {
        
        buscarNuhsa= em.createQuery("SELECT t from HistorialMedico t WHERE t.nuhsaPaciente.nuhsa =:nuhsa")
                 .setParameter("nuhsa", nuhsa);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (List<HistorialMedico>)  buscarNuhsa.getResultList();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
}
