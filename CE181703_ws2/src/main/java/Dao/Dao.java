/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.movie;
import db.DBContext;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyễn Hồ Trọng Đạt_CE181703
 */
public class Dao extends DBContext{
    public ArrayList<movie> getAll(){
        
     ArrayList<movie> movie =new ArrayList<movie>();
    String query="select * from movies";
    try(ResultSet rs = execSelectQuery(query)){
        while(rs.next()){
            movie.add(new movie(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDouble(5), rs.getInt(6)));
        }
    }catch(SQLException ex){
        Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Err");
    }
    return movie;
}
    public movie getoneById(int id){
        String query="select* from movies where id=?";
        Object[] params={id};
       try (ResultSet rs = execSelectQuery(query, params)){
        while(rs.next()){
           return  new movie(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDouble(5), rs.getInt(6));
        }
    }   catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
       return null;
    }
    public int create(movie movie){
        String querynextid="select max(id)+1 as nextid from movies";
        try (ResultSet rs = execSelectQuery(querynextid)){
             if(rs.next()){
      int nextid=  rs.getInt(1);
      String query="insert into movies(id,title,director,release_year,rating,Is_rented) values(?,?,?,?,?,?)";
      Object[] params={nextid,movie.getTitle(),movie.getDirector(),movie.getRelease_year(),movie.getRating(),movie.getIs_rented()};
      return execQuery(query, params); 
             }
    }   catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public int update(movie movie){
        String query="update movies set title =?, director =?,release_year=?, rating= ?, Is_rented =? where id =?";
        Object[] params ={movie.getTitle(),movie.getDirector(),movie.getRelease_year(),movie.getRating(),movie.getIs_rented(), movie.getId()};
        try{
            return execQuery(query, params);
        }catch(SQLException ex){
              Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);;
              return 0;
        }
    }
    public int delete(int id){
        String query="delete from movies where id =?";
      Object[] params={id}; 
      try{
          return execQuery(query, params);
      } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
      
    }
}

