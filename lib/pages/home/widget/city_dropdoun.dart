import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CityDropdounWidget extends StatelessWidget {
  const CityDropdounWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.dropdownText,
          style: const TextStyle(
            color: Color.fromRGBO(162, 162, 162, 1),
            fontSize: 12,
          ),
        ),
        const _CityDropdoun(),
      ],
    );
  }
}

class _CityDropdoun extends StatefulWidget {
  const _CityDropdoun();

  @override
  State<_CityDropdoun> createState() => _CityDropdounState();
}

class _CityDropdounState extends State<_CityDropdoun> {
  String dropdownValues = '';

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    dropdownValues = AppLocalizations.of(context)!.dropdownCity1;
  }
  

  @override
  Widget build(BuildContext context) {
    
    final localizations = AppLocalizations.of(context)!;

    final List<String> city = localizations.cityList.split('|');

    return DropdownButton(
      value: dropdownValues,
      underline: Container(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      dropdownColor: const Color.fromRGBO(17, 17, 17, 1),
      icon: const Icon(Icons.arrow_drop_down_rounded, color: Colors.white),
      items: city.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (value) {
        setState(() {
          dropdownValues = value!;
        });
      },
    );
  }
}
