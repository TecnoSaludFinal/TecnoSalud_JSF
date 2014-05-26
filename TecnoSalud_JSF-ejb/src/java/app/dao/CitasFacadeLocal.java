/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import app.entity.Citas;
import java.util.Date;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Deiver
 */
@Local
public interface CitasFacadeLocal {

    void create(Citas citas);

    void edit(Citas citas);

    void remove(Citas citas);

    Citas find(Object id);

    List<Citas> findAll();

    List<Citas> findRange(int[] range);

    int count();
    
    List<Citas> findAllByNuhsa(Integer nuhsa);
    
    List<Citas> findAllById_Med(Integer id_med);
    
    Citas findById(Integer id);
    
    void actualizar(Citas c, Integer num);
    
    List<Citas> findByFecha (Date fecha);
    
    List<Citas> findByPendiente (Date fecha);
    
    List<Citas> findByPasada (Date fecha);
    
    List<Citas> findByNombre(String apellidos);
    
    List<Citas> findByFechaNuhsa (Date fecha, Integer nuhsa);
    
    List<Citas> findByFechaIdMedico (Date fecha, Integer id);
      
    List<Citas> findByPendienteNuhsa(Date fecha, Integer nuhsa);
    
    List<Citas> findByPendienteIdMedico(Date fecha, Integer id);
    
    List<Citas> findByPasadaNuhsa(Date fecha, Integer nuhsa);
    
    List<Citas> findByPasadaIdMedico(Date fecha, Integer id);
    
}
