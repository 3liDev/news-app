import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/models/news_model.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class Science extends GetWidget {
  @override
  NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          // ignore: missing_required_param
          future: controller.getData(category: 'science'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              NewsModel data = snapshot.data;
              return ListView.builder(
                  itemCount: data.articles.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: Image.network(
                              data.articles[index].urlToImage.toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            data.articles[index].title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            data.articles[index].description,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.grey),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
