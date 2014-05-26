/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.PersonalAdministrativo;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Deiver
 */
@Local
public interface PersonalAdministrativoFacadeLocal {

    void create(PersonalAdministrativo personalAdministrativo);

    void edit(PersonalAdministrativo personalAdministrativo);

    void remove(PersonalAdministrativo personalAdministrativo);

    PersonalAdministrativo find(Object id);

    List<PersonalAdministrativo> findAll();

    List<PersonalAdministrativo> findRange(int[] range);

    int count();
    
    PersonalAdministrativo findByDni(String dni);
    
    PersonalAdministrativo findByDni(String dni, String pass);
    
    PersonalAdministrativo findById(Integer id);
    
     void actualizar(PersonalAdministrativo pa , Integer num);
    
}
