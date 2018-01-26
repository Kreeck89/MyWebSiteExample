package servlet;

import model.Lesson;
import service.LessonService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update")
public class UpdateLessonServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LessonService lessonService = new LessonService();
        Lesson lesson = new Lesson();
        lesson.setName(req.getParameter("name"));
        lesson.setCourseId(Integer.parseInt(req.getParameter("courseId")));
        lesson.setPrice(req.getParameter("price"));
        lesson.setImage(req.getParameter("image"));
        lesson.setAbout(req.getParameter("about"));
        lesson.setId(ModerateServlet.id);

        lessonService.updateLesson(lesson);
        lessonService.init();

        req.getRequestDispatcher("moderate.jsp").forward(req, resp);
    }
}
