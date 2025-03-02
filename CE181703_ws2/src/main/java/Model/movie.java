/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Nguyễn Hồ Trọng Đạt_CE181703
 */
public class movie {

    int id;
    String title;
    String director;
    int release_year;
    double rating;
    int is_rented;

    public movie(int id, String title, String director, int release_year, double rating, int is_rented) {
        this.id = id;
        this.title = title;
        this.director = director;
        this.release_year = release_year;
        this.rating = rating;
        this.is_rented = is_rented;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getRelease_year() {
        return release_year;
    }

    public void setRelease_year(int release_year) {
        this.release_year = release_year;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getIs_rented() {
        return is_rented;
    }

    public void setIs_rented(int is_rented) {
        this.is_rented = is_rented;
    }
    

}
