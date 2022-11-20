import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/view/bottom_navigation_bar/health.dart';
import 'package:news_app/view/bottom_navigation_bar/science.dart';
import 'package:news_app/view/bottom_navigation_bar/sports.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class HomePage extends GetWidget {
  @override
  NewsController controller = Get.put(NewsController());

  List<Widget> screens = [Sports(), Health(), Science()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        centerTitle: true,
      ),
      bottomNavigationBar: GetX<NewsController>(builder: (controller) {
        return BottomNavigationBar(
            selectedItemColor: Colors.green,
            currentIndex: controller.currentIndex.value,
            onTap: (value) {
              controller.currentIndex.value = value;
            },
            items: const [
              BottomNavigationBarItem(
                  label: 'sports', icon: Icon(Icons.sports)),
              BottomNavigationBarItem(
                  label: 'health', icon: Icon(Icons.health_and_safety)),
              BottomNavigationBarItem(
                  label: 'science', icon: Icon(Icons.science)),
            ]);
      }),
      body: GetX<NewsController>(builder: (controller) {
        return screens[controller.currentIndex.value];
      }),
    );
  }
}
