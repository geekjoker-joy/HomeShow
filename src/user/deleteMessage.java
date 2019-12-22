package user;

import util.C3P0JdbcUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "deleteMessage", urlPatterns = "/user/deleteMessage")
public class deleteMessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_s = request.getParameter("id");
        int id = Integer.parseInt(id_s);
        String query_m = "DELETE FROM t_Message WHERE `messageid` = ?";
        String query_r = "DELETE FROM t_Reply WHERE `messageid` = ?";
        Connection conn = null;
        PreparedStatement pstmt_m = null;
        PreparedStatement pstmt_r = null;
        try{
            conn = C3P0JdbcUtil.getConnection();
            pstmt_m = conn.prepareStatement(query_m);
            pstmt_m.setInt(1, id);
            pstmt_m.executeUpdate();
            System.out.println("delete Message success");
            pstmt_r = conn.prepareStatement(query_r);
            pstmt_r.setInt(1, id);
            pstmt_r.executeUpdate();
            System.out.println("delete reply success");
            request.getRequestDispatcher("/user/getMessage").forward(request,response);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            C3P0JdbcUtil.release(conn, pstmt_m, null);
//            C3P0JdbcUtil.release(null, pstmt_r, null);
        }
    }
}
