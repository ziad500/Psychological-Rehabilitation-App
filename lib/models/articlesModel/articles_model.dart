class articlesModel {
  final String name;
  final String title;
  final String category;
  final String article;
  final String date;

  articlesModel(
      {required this.name,
      required this.category,
      required this.title,
      required this.article,
      required this.date});
  String toString() {
    return '{title: $title, article: $article,date: $date}';
  }
}
