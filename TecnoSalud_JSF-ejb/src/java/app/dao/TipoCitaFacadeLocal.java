/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.TipoCita;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Deiver
 */
@Local
public interface TipoCitaFacadeLocal {

    void create(TipoCita tipoCita);

    void edit(TipoCita tipoCita);

    void remove(TipoCita tipoCita);

    TipoCita find(Object id);

    List<TipoCita> findAll();

    List<TipoCita> findRange(int[] range);

    int count();
    
    TipoCita findByNombre(String nombre);
    
}
