import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class insert_data {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5433/moviedatabase";
        String username = "postgres";
        String password = "password";
        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            // Insert into BirthLocation
            String birthLocationSQL = "INSERT INTO public.\"BirthLocation\" (country, city, state) VALUES (?, ?, ?);";
            try (PreparedStatement pstmt = connection.prepareStatement(birthLocationSQL)) {
                pstmt.setString(1, "Canada");
                pstmt.setString(2, "Toronto");
                pstmt.setString(3, "Ontario");
                pstmt.executeUpdate();
            }

            // Insert into ShowTime
            String showTimeSQL = "INSERT INTO public.\"ShowTime\" (show_name, show_time, show_duration, \"id_Cinema_Ticket\", \"id_Movie\") VALUES (?, ?, ?, ?, ?);";
            try (PreparedStatement pstmt = connection.prepareStatement(showTimeSQL)) {
                pstmt.setString(1, "Evening Show");
                java.sql.Time showTime = java.sql.Time.valueOf("20:00:00");
                pstmt.setTime(2, showTime);
                pstmt.setInt(3, 120);
                pstmt.setInt(4, 1);
                pstmt.setInt(5, 1);
                pstmt.executeUpdate();
            }

            // Insert into University
            String universitySQL = "INSERT INTO public.\"University\" (name, is_private, color) VALUES (?, ?, ?);";
            try (PreparedStatement pstmt = connection.prepareStatement(universitySQL)) {
                pstmt.setString(1, "Ontario Tech University");
                pstmt.setBoolean(2, true);
                pstmt.setString(3, "Blue and White");
                pstmt.executeUpdate();
            }

            // Insert into Director
            String directorSQL = "INSERT INTO public.\"Director\" (first_name, surname, year_of_birth, \"id_BirthLocation\") VALUES (?, ?, ?, ?);";
            try (PreparedStatement pstmt = connection.prepareStatement(directorSQL)) {
                pstmt.setString(1, "Todd");
                pstmt.setString(2, "Phillips");
                pstmt.setInt(3, 1970);
                pstmt.setInt(4, 1);
                pstmt.executeUpdate();
            }

            // Insert into Actor
            String actorSQL = "INSERT INTO public.\"Actor\" (first_name, surname, year_of_birth, \"id_BirthLocation\", eye_color) VALUES (?, ?, ?, ?, ?);";
            try (PreparedStatement pstmt = connection.prepareStatement(actorSQL)) {
                pstmt.setString(1, "Joaquin");
                pstmt.setString(2, "Phoenix");
                pstmt.setInt(3, 1974);
                pstmt.setInt(4, 1);
                pstmt.setString(5, "Green");
                pstmt.executeUpdate();
            }

            // Insert into Department
            String departmentSQL = "INSERT INTO public.\"Department\" (\"id_University\", name) VALUES (?, ?);";
            try (PreparedStatement pstmt = connection.prepareStatement(departmentSQL)) {
                pstmt.setInt(1, 1);
                pstmt.setString(2, "Film Studies");
                pstmt.executeUpdate();
            }

            // Insert into Genre
            String genreSQL = "INSERT INTO public.\"Genre\" (type) VALUES (?);";
            try (PreparedStatement pstmt = connection.prepareStatement(genreSQL)) {
                pstmt.setString(1, "Drama");
                pstmt.executeUpdate();
            }

            // Insert into Cinema
            String cinemaSQL = "INSERT INTO public.\"Cinema\" (cinema_name, location, type) VALUES (?, ?, ?);";
            try (PreparedStatement pstmt = connection.prepareStatement(cinemaSQL)) {
                pstmt.setString(1, "Cineplex");
                pstmt.setString(2, "Downtown Toronto");
                pstmt.setString(3, "IMAX");
                pstmt.executeUpdate();
            }

            // Insert into Ticket
            String ticketSQL = "INSERT INTO public.\"Ticket\" (price, \"id_Cinema\") VALUES (?, ?);";
            try (PreparedStatement pstmt = connection.prepareStatement(ticketSQL)) {
                pstmt.setDouble(1, 15.50);
                pstmt.setInt(2, 1);
                pstmt.executeUpdate();
            }

            // Insert into Award
            String awardSQL = "INSERT INTO public.\"Award\" (award_name, \"id_Movie\") VALUES (?, ?);";
            try (PreparedStatement pstmt = connection.prepareStatement(awardSQL)) {
                pstmt.setString(1, "Best Actor");
                pstmt.setInt(2, 1);
                pstmt.executeUpdate();
            }

            // Insert into Category
            String categorySQL = "INSERT INTO public.\"Category\" (category_name, \"award_id_Award\", \"id_Movie_Award\") VALUES (?, ?, ?);";
            try (PreparedStatement pstmt = connection.prepareStatement(categorySQL)) {
                pstmt.setString(1, "Drama");
                pstmt.setInt(2, 1);
                pstmt.setInt(3, 1);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}