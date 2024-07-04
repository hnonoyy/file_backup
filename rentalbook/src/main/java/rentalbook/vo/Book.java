package rentalbook.vo;

public record Book(int bookId, int categoryId, String categoryName, String title, String publisher, String description, int pages, String imageUrl, int rentalCnt ) {

}
