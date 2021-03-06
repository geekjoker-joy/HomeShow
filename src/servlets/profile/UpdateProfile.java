package servlets.profile;

import bean.Profile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 修改简介内容
 */
@WebServlet("/updateContent")
public class UpdateProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 处理乱码
        req.setCharacterEncoding("utf-8");
        // 获取内容
        String content = req.getParameter("content");
        Integer id = Integer.parseInt(req.getParameter("id").trim());
        String title = req.getParameter("title");
        System.out.println("要保存的内容为：" + content);
        Profile profile = new Profile();
        profile.setId(id);
        profile.setContent(content);
        profile.setTitle(title);
        profile.updateProfile();
        String jumpPath = req.getParameter("jumpPath");
        System.out.println("跳转到: " + jumpPath);
        resp.sendRedirect(jumpPath);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
