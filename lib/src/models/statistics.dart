class Statistics {
  Statistics({
    this.viewCount,
    this.likeCount,
    this.dislikeCount,
    this.favoriteCount,
    this.commentCount,
    this.subscriberCount,
  });

  String viewCount;
  String likeCount;
  String dislikeCount;
  String favoriteCount;
  String commentCount;
  String subscriberCount;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"],
        likeCount: json["likeCount"],
        dislikeCount: json["dislikeCount"],
        favoriteCount: json["favoriteCount"],
        commentCount: json["commentCount"],
        subscriberCount: json["subscriberCount"],
      );

  Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "likeCount": likeCount,
        "dislikeCount": dislikeCount,
        "favoriteCount": favoriteCount,
        "commentCount": commentCount,
      };
}
