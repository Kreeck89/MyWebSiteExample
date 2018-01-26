package servlet;

import model.User;
import service.SecurityService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        user.setName(req.getParameter("name"));
        user.setSurname(req.getParameter("surname"));
        user.setEmail(req.getParameter("email"));

        String password = req.getParameter("password");
        SecurityService securityService = new SecurityService();
        String encodedPassword = securityService.codePassword(password);
        user.setPassword(encodedPassword);

        user.setPhone(req.getParameter("phone"));
        user.setImage(req.getParameter("ava"));

        UserService userService = new UserService();
        userService.registerUser(user);

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
