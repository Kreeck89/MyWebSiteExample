package service;

import dataSql.Database;
import model.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CourseService {

    private static final String URL_COURSES = "SELECT * FROM web.courses";

    public List<Course> getCourses() {
        List<Course> courseList = new ArrayList<>();
        try (Connection connection = Database.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(URL_COURSES)) {
            connection.setAutoCommit(false);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Course course = new Course();
                course.setId(resultSet.getInt("id"));
                course.setName(resultSet.getString("name"));
                courseList.add(course);
            }
            connection.commit();
            Collections.reverse(courseList);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courseList;
    }
}
