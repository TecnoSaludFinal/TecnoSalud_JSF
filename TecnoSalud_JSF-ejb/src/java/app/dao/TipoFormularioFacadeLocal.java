/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.TipoFormulario;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Deiver
 */
@Local
public interface TipoFormularioFacadeLocal {

    void create(TipoFormulario tipoFormulario);

    void edit(TipoFormulario tipoFormulario);

    void remove(TipoFormulario tipoFormulario);

    TipoFormulario find(Object id);

    List<TipoFormulario> findAll();

    List<TipoFormulario> findRange(int[] range);

    int count();
    
    TipoFormulario findById (Integer id);
    
}
