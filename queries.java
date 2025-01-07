import java.sql.*;

public class queries {
    public static void main(String[] args) {
        // Database connection parameters
        String url = "jdbc:postgresql://localhost:5433/moviedatabase";
        String user = "postgres";
        String password = "hardstuck1";

        // Establish the connection
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            // directors born in Canada
            String query1 = "SELECT first_name || ' ' || surname AS full_name " +
                    "FROM \"Director\" " +
                    "JOIN \"BirthLocation\" ON \"Director\".\"id_BirthLocation\" = \"BirthLocation\".id " +
                    "WHERE \"BirthLocation\".country = 'Canada'";
            exQ(conn, query1);

            // movies directed by David Lynch
            String query2 = "SELECT \"Movie\".title " +
                    "FROM \"Director\" " +
                    "JOIN \"Movie\" ON \"Director\".\"id_Movie\" = \"Movie\".id " +
                    "WHERE \"Director\".first_name || ' ' || \"Director\".surname = ?";
            exParQ(conn, query2, "David Lynch");

            // all actors in a movie with budget more than 1m
            String query3 = "SELECT \"Actor\".first_name || ' ' || \"Actor\".surname AS full_name_1m_budget, " +
                    "\"Movie\".budget AS budget_USD, " +
                    "ROUND((\"Movie\".budget * 1.39)::numeric, 2) AS budget_CAD, " +
                    "ROUND((\"Movie\".budget * 1.39)::numeric, 2) AS budget_JPY, " +
                    "ROUND((\"Movie\".budget * 0.014)::numeric, 2) AS budget_RUB, " +
                    "ROUND((\"Movie\".budget * 0.012)::numeric, 2) AS budget_EUR, " +
                    "ROUND((\"Movie\".budget * 0.011)::numeric, 2) AS budget_CHF " +
                    "FROM \"MovieActor\" " +
                    "JOIN \"Movie\" ON \"MovieActor\".\"id_Movie\" = \"Movie\".id " +
                    "JOIN \"Actor\" ON \"MovieActor\".\"id_Actor\" = \"Actor\".id " +
                    "WHERE \"Movie\".budget >= ?";
            exParQ(conn, query3, 1000000);

            // directors with A or D surname
            String query4 = "SELECT \"Director\".first_name || ' ' || \"Director\".surname AS surname_A_D " +
                    "FROM \"Director\" " +
                    "WHERE \"Director\".surname LIKE ? OR \"Director\".surname LIKE ?";
            exParQ(conn, query4, "A%", "D%");

            String query5 = "SELECT \"Actor\".first_name || ' ' || \"Actor\".surname AS actor_name " +
                    "FROM \"Actor\"";
            exQWithCursor(conn, query5);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void exQ(Connection conn, String query) {
        try (Statement stmt = conn.createStatement();
             ResultSet resSet = stmt.executeQuery(query)) {
            ShowOutput(resSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void exParQ(Connection conn, String query, Object... params) {
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            try (ResultSet resSet = pstmt.executeQuery()) {
                ShowOutput(resSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void exQWithCursor(Connection conn, String query) {
        try (Statement stmt = conn.createStatement();
             ResultSet resSet = stmt.executeQuery(query)) {
            ShowOutput(resSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void ShowOutput(ResultSet resSet) throws SQLException {
        int columns = resSet.getMetaData().getColumnCount();
        while (resSet.next()) {
            for (int i = 1; i <= columns; i++) {
                System.out.print(resSet.getString(i) + "\t");
            }
            System.out.println();
        }
    }
}
