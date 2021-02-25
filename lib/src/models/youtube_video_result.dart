import 'package:youtube_clone_app/src/models/video.dart';

class YoutubeVideoResult {
  int totalResults;
  int resultsPerPage;
  String nextPagetoken;
  List<Video> items;

  YoutubeVideoResult(
      {this.totalResults, this.resultsPerPage, this.nextPagetoken, this.items});

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResult(
          totalResults: json["pageInfo"]["totalResults"],
          resultsPerPage: json["pageInfo"]["resultsPerPage"],
          nextPagetoken: json["nextPageToken"] ?? "",
          items: List<Video>.from(
              json["items"].map((data) => Video.fromJson(data))));
}
