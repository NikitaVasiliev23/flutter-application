import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchBar(
            hintText: 'Найти кофе',
            hintStyle: MaterialStateProperty.all(
              TextStyle(color: Colors.white),
            ),
            leading: Icon(Icons.search, color: Colors.white),
            backgroundColor: MaterialStateProperty.all(
              Color.fromRGBO(17, 17, 17, 1),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
            ),
    
            textStyle: MaterialStateProperty.all(
              TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: 16),
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list, color: Colors.white),
          ),
        ),
      ],
    );
  }
}