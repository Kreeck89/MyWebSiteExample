package service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class SecurityService {

    public String codePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }

    public boolean checkPassword(String password, String codedPassword) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.matches(password, codedPassword);
    }
}
