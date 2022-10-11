import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sellon/constant.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(
          filled: true,
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 23,
              )),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding / 2,
              vertical: defaultPadding / 4),
          hintText: 'Search Product',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 4),
              borderSide:
                  BorderSide(width: 0, style: BorderStyle.none)),
          border: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none, width: 0),
              borderRadius: BorderRadius.circular(defaultPadding / 4))),
    );
  }
}