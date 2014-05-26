/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.PeticionCita;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Deiver
 */
@Local
public interface PeticionCitaFacadeLocal {

    void create(PeticionCita peticionCita);

    void edit(PeticionCita peticionCita);

    void remove(PeticionCita peticionCita);

    PeticionCita find(Object id);

    List<PeticionCita> findAll();

    List<PeticionCita> findRange(int[] range);

    int count();
    
    PeticionCita findById(Integer id);
    
    List<PeticionCita> findAllByNuhsa(Integer nuhsa);
    
    void actualizar(PeticionCita pc, Integer num);
    
}
