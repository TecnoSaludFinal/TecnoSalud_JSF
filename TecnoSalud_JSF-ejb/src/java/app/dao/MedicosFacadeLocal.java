/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.Medicos;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Deiver
 */
@Local
public interface MedicosFacadeLocal {

    void create(Medicos medicos);

    void edit(Medicos medicos);

    void remove(Medicos medicos);

    Medicos find(Object id);

    List<Medicos> findAll();

    List<Medicos> findRange(int[] range);

    int count();
    
    Medicos findById(Integer nombre);
    
    Medicos findByDni(String dni);
    
    Medicos findByDni(String dni, String pass);
    
    List<Medicos> findByNombre(String apellidos);
    
    void actualizar(Medicos me , Integer num);
    
    Medicos findByIdEspecialidad(String especialidad);
    
    List<Medicos> findByIdAllEspecialidad(String especialidad);
    
    Medicos getIdByDni (Integer dni);
    
    List<Medicos> findAllOrderById ();
    
}
