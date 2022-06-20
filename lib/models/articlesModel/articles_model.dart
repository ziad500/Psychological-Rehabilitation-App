class ArticlesModel {
  final String name;
  final String title;
  final String category;
  final String article;
  final String date;

  ArticlesModel(
      {required this.name,
      required this.category,
      required this.title,
      required this.article,
      required this.date});
  @override
  String toString() {
    return '{title: $title, article: $article,date: $date}';
  }
}
