
import 'package:flutter/material.dart';
import 'package:sellon/constant.dart';
import 'package:sellon/core/api_client.dart';
import 'package:sellon/models/category.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<CategoryModel> listCategories = [];

  getData() async {
    listCategories = await ApiClient().fetchCategories();
    print(listCategories);
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: FutureBuilder<List<CategoryModel>>(
          future: ApiClient().fetchCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              List<CategoryModel> categories = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    width: 100,
                    child: Card(
                        elevation: 0.5,
                        shadowColor: Colors.grey.shade500,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0,
                            style: BorderStyle.none
                          ),
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding / 3),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(),
                              Image.network(
                                categories[index].image,
                                height: 30,
                                width: 30,
                              ),
                              Spacer(),
                              Text(
                                categories[index].name.length < 10
                                    ? categories[index].name
                                    : categories[index].name.substring(0, 9) +
                                        '...'.toString(),
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black45),
                              ),
                            ],
                          ),
                        )),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
