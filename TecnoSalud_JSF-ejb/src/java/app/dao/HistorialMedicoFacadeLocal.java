/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.HistorialMedico;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Deiver
 */
@Local
public interface HistorialMedicoFacadeLocal {

    void create(HistorialMedico historialMedico);

    void edit(HistorialMedico historialMedico);

    void remove(HistorialMedico historialMedico);

    HistorialMedico find(Object id);

    List<HistorialMedico> findAll();

    List<HistorialMedico> findRange(int[] range);

    int count();
    
    List<HistorialMedico> findByNUHSA (Integer nuhsa);
    
}
