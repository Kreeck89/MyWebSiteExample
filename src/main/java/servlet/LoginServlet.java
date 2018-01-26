package servlet;

import model.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import service.SecurityService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserService userService = new UserService();
        User user = userService.getUser(email);
        if (user.getEmail() == null) {
            req.getRequestDispatcher("oops.jsp").forward(req, resp);
            return;
        }
        SecurityService securityService = new SecurityService();
        boolean b = securityService.checkPassword(password, user.getPassword());
        if (b) {
            HttpSession session = req.getSession();
            session.setAttribute("name", user.getName());
            session.setAttribute("surname", user.getSurname());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("phone", user.getPhone());
            session.setAttribute("image", user.getImage());
            session.setAttribute("role", user.getRole());
            String role = user.getRole();
            System.out.println(role);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("oops.jsp").forward(req, resp);
        }
    }
}
