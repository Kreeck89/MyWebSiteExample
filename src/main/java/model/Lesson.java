package model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Lesson {

    private int id;
    private int courseId;
    private String name;
    private String about;
    private String price;
    private String image;
}
