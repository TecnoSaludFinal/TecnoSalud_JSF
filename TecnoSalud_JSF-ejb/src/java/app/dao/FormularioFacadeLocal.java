/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.Formulario;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Deiver
 */
@Local
public interface FormularioFacadeLocal {

    void create(Formulario formulario);

    void edit(Formulario formulario);

    void remove(Formulario formulario);

    Formulario find(Object id);

    List<Formulario> findAll();

    List<Formulario> findRange(int[] range);

    int count();
    
    List<Formulario> findByNUHSA (Integer nuhsa);
    
    List<Formulario> findById (Integer id);
    
    Formulario findByIdFormulario (Integer id);
    
    List<Formulario> findByQuejas (Integer id);
    
    List<Formulario> findByFelicitaciones (Integer felicitacion);
    
    List<Formulario> findBySugerencias (Integer sugerencia);
    
    void actualizar(Formulario c, Integer num);
    
    Formulario findByNUHSAform (Integer nuhsa, Integer id);
    
    Formulario findByIdFormulario2 (Integer id);
}
