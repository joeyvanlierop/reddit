class PostData {
  final String thumbnail;
  final String title;
  final String subreddit;
  final int score;
  final int comments;
  final int age;

  PostData({
    this.thumbnail,
    this.title,
    this.subreddit,
    this.score,
    this.comments,
    this.age,
  });

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      thumbnail: json['thumbnail'],
      title: json['title'],
      subreddit: json['subreddit'],
      score: json['score'],
      comments: json['num_comments'],
      age: 1,
//      age: json['body'],
    );
  }
}
