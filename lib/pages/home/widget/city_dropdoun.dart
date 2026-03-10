import 'package:flutter/material.dart';

class CityDropdounWidget extends StatelessWidget {
  const CityDropdounWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Город',
          style: TextStyle(
            color: Color.fromRGBO(162, 162, 162, 1),
            fontSize: 12,
          ),
        ),
        CityDropdoun(),
      ],
    );
  }
}




class CityDropdoun extends StatefulWidget {
  const CityDropdoun({super.key});

  @override
  State<CityDropdoun> createState() => _CityDropdounState();
}

class _CityDropdounState extends State<CityDropdoun> {
  final List<String> _city = [
    'Москва',
    'Санкт-Петербург',
    'Казань',
    'Новосибирск',
    'Екатеринбург',
    'Нижний Новгород',
    'Сочи',
  ];

  String dropdownValues = 'Москва';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValues,
      underline: Container(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      dropdownColor: Color.fromRGBO(17, 17, 17, 1),
      icon: const Icon(Icons.arrow_drop_down_rounded, color: Colors.white),
      items: _city.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          dropdownValues = value!;
        });
      },
    );
  }
}