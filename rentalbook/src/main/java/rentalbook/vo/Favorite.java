package rentalbook.vo;

import java.sql.Date;

public record Favorite(int no, String userId, int bookId, Date createdAt) {

}
