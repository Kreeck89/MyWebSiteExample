package service;

import com.fasterxml.jackson.databind.ObjectMapper;
import dataSql.Database;
import lombok.Getter;
import lombok.Setter;
import model.Lesson;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class LessonService {

    @Getter
    @Setter
    private static int num = 1;
    private static String URL_LESSONS_ID;
    private static final String JSON_PATH = "/Users/kreeck/IdeaProjects/MyWebSiteExample/src/main/resources/data/lesson.json";

    public List<Lesson> getFromDataJson() {
        List<Lesson> lessons = new ArrayList<>();
        List<Lesson> lessonById = new ArrayList<>();
        ObjectMapper mapper = new ObjectMapper();
        try {
            lessons = mapper.readValue(new File(JSON_PATH), mapper.getTypeFactory()
                    .constructCollectionType(List.class, Lesson.class));
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (num == 1) {
            return lessons;
        } else {
            for (Lesson elem : lessons) {
                if (elem.getCourseId() == num) {
                    lessonById.add(elem);
                }
            }
        }
        return lessonById;
    }

    /**
     * Load from distance database all Lessons and save to lesson.json file;
     * And when database was updated you need start this method.
     */
    public void init() {
        List<Lesson> lessonList = new ArrayList<>();
        URL_LESSONS_ID = "SELECT * FROM web.lessons";
        try (Connection connection = Database.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(URL_LESSONS_ID)) {
            connection.setAutoCommit(false);
            ResultSet resultSet = preparedStatement.executeQuery();
            writeValue(lessonList, resultSet);
            connection.commit();
            for (Lesson elem : lessonList) {
                System.out.println(elem.getName());
            }
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.writeValue(new File(JSON_PATH), lessonList);
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * @return List<Lesson> from database Hurocu with JDBC postgresql.
     */
    public List<Lesson> getLessons() {
        List<Lesson> lessons = new ArrayList<>();
        if (num != 1) {
            URL_LESSONS_ID = "SELECT * FROM web.lessons WHERE course_id = ?";
            try (Connection connection = Database.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(URL_LESSONS_ID)) {
                connection.setAutoCommit(false);
                preparedStatement.setInt(1, num);
                ResultSet resultSet = preparedStatement.executeQuery();
                writeValue(lessons, resultSet);
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            URL_LESSONS_ID = "SELECT * FROM web.lessons";
            try (Connection connection = Database.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(URL_LESSONS_ID)) {
                connection.setAutoCommit(false);
                ResultSet resultSet = preparedStatement.executeQuery();
                writeValue(lessons, resultSet);
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lessons;
    }

    private void writeValue(List<Lesson> lessons, ResultSet resultSet) throws SQLException {
        while (resultSet.next()) {
            Lesson lesson = new Lesson();
            lesson.setId(resultSet.getInt("id"));
            lesson.setCourseId(resultSet.getInt("course_id"));
            lesson.setName(resultSet.getString("name"));
            lesson.setAbout(resultSet.getString("about"));
            lesson.setPrice(resultSet.getString("price"));
            lesson.setImage(resultSet.getString("image"));
            lessons.add(lesson);
        }
        Comparator<Lesson> comparator = new Comparator<Lesson>() {
            @Override
            public int compare(Lesson o1, Lesson o2) {
                return o1.getId() - o2.getId();
            }
        };
        Collections.sort(lessons, comparator);
    }

    public List<Lesson> getAllLessonsForModerate() {
        List<Lesson> lessons = new ArrayList<>();
        URL_LESSONS_ID = "SELECT * FROM web.lessons";
        try (Connection connection = Database.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(URL_LESSONS_ID)) {
            ResultSet result = preparedStatement.executeQuery();
            writeValue(lessons, result);

            Comparator<Lesson> comparator = new Comparator<Lesson>() {
                @Override
                public int compare(Lesson o1, Lesson o2) {
                    return o1.getId() - o2.getId();
                }
            };
            Collections.sort(lessons, comparator);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lessons;
    }

    public void createLesson(Lesson lesson) {
        URL_LESSONS_ID = "INSERT INTO web.lessons (course_id, name, about, price, image) VALUES (?,?,?,?,?)";
        try (Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(URL_LESSONS_ID)) {
            connection.setAutoCommit(false);
            preparedStatement.setInt(1, lesson.getCourseId());
            preparedStatement.setString(2, lesson.getName());
            preparedStatement.setString(3, lesson.getAbout());
            preparedStatement.setString(4, lesson.getPrice());
            preparedStatement.setString(5, lesson.getImage());
            preparedStatement.execute();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateLesson(Lesson lesson) {
        URL_LESSONS_ID = "UPDATE web.lessons SET course_id=?, name=?, about=?, price=?, image=? WHERE id=?";
        try (Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(URL_LESSONS_ID)) {
            connection.setAutoCommit(false);
            preparedStatement.setInt(1, lesson.getCourseId());
            preparedStatement.setString(2, lesson.getName());
            preparedStatement.setString(3, lesson.getAbout());
            preparedStatement.setString(4, lesson.getPrice());
            preparedStatement.setString(5, lesson.getImage());
            preparedStatement.setInt(6, lesson.getId());
            preparedStatement.execute();
            connection.commit();
            System.out.println(lesson);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteLesson(int id) {
        URL_LESSONS_ID = "DELETE FROM web.lessons WHERE id = ?";
        try (Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(URL_LESSONS_ID)) {
            connection.setAutoCommit(false);
            preparedStatement.setInt(1, id);
            preparedStatement.execute();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
