package rentalbook.vo;

import java.sql.Date;

public record Feed(int no, String writerId, String title, String body, Date writedAt, int readCnt) {

}
