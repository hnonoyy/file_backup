package rentalbook.vo;

import java.sql.Date;

public record User(String userId, String password, String nickname,String gender, Date registerdAt) {

}
