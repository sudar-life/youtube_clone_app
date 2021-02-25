import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/src/components/video_widget.dart';
import 'package:youtube_clone_app/src/controller/youtube_search_controller.dart';

class YoutubeSearch extends GetView<YoutubeSearchController> {
  const YoutubeSearch({Key key}) : super(key: key);

  Widget _searchHistory() {
    return ListView(
      children: List.generate(controller.history.length, (index) {
        return ListTile(
          onTap: () {
            controller.submitSearch(controller.history[index]);
          },
          leading: SvgPicture.asset(
            "assets/svg/icons/wall-clock.svg",
            width: 20,
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text("${controller.history[index]}"),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        );
      }),
    );
  }

  Widget _searchResultView() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: List.generate(
            controller.youtubeVideoResult.value.items.length, (index) {
          return GestureDetector(
            onTap: () {
              //page route
              Get.toNamed(
                  "/detail/${controller.youtubeVideoResult.value.items[index].id.videoId}");
            },
            child: VideoWidget(
                video: controller.youtubeVideoResult.value.items[index]),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/svg/icons/back.svg"),
          onPressed: () {
            Get.back();
          },
        ),
        title: TextField(
          onSubmitted: (key) {
            controller.submitSearch(key);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.youtubeVideoResult.value.items.length > 0
            ? _searchResultView()
            : _searchHistory(),
      ),
    );
  }
}
