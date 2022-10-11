import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sellon/constant.dart';
import 'package:sellon/core/api_client.dart';
import 'package:sellon/models/category.dart';
import 'package:sellon/widget/home/categories_list.dart';
import 'package:sellon/widget/label_input.dart';
import 'package:sellon/widget/search_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.shade100,
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: defaultPadding,
            ),
            SearchBar(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on_outlined,
                        color: primaryColor,
                      ),
                      Text("Jl. Pegangsaan Timur NO 56 Jakarta",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            CategoryList(),
            Container(
              margin: EdgeInsets.symmetric(vertical: defaultPadding/2),
              child: Text("Explore",style: Theme.of(context).textTheme.headline5,),
            )
          ],
        ));
  }
}


