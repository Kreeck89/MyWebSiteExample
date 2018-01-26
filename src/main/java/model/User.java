package model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class User {

    private int id;
    private String name;
    private String surname;
    private String email;
    private String password;
    private String phone;
    private String image;
    private String role;
}
