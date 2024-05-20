/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Configuraciones;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author piero
 */
public class fecha {
    
    public static Calendar calendar = Calendar.getInstance();
    private static String fecha;
    
   public fecha(){
       
   }
   
   public static String fecha(){
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       fecha = sdf.format(calendar.getTime());
       return fecha;
   }
   
    public static String fechaBD(){
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       fecha = sdf.format(calendar.getTime());
       return fecha;
   }
}
