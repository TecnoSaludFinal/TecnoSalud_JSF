/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.TipoFormulario;
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
public class TipoFormularioFacade extends AbstractFacade<TipoFormulario> implements TipoFormularioFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TipoFormularioFacade() {
        super(TipoFormulario.class);
    }
    
    @Override
    public TipoFormulario findById (Integer id) {
        
        //HistorialMedico hm;
         TipoFormulario hm;
        Query buscarId;
        
        try
        {
        
        buscarId= em.createQuery("SELECT t from TipoFormulario t WHERE t.idTipoform =:id")
                 .setParameter("id", id);
        
       // hm = (HistorialMedico) buscarNuhsa.getSingleResult();
        hm = (TipoFormulario) buscarId.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return hm;
    }
    
}
