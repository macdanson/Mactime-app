class ApiUtil {
  // static const String baseUrl = 'https://clinicplusug.com/mobi/api/';
  static const String baseUrl = 'http://127.0.0.1:8001/api/';
  static const String allCategories = 'categories';
  static const String allPosts = 'posts';
  static const String allAuthors = 'authors';
  static String allCategoryPosts(String categoryID) {
    return baseUrl + allCategories + '/' + categoryID + '/posts';
  }
}
