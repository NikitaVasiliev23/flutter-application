import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryButttons extends StatefulWidget {
  final Function(String) onChangeCateory;
  final String selectedCategory;

  const CategoryButttons({
    required this.selectedCategory,
    required this.onChangeCateory,
    super.key,
  });

  @override
  State<CategoryButttons> createState() => _CategoryButttonsState();
}

class _CategoryButttonsState extends State<CategoryButttons> {
  void changeCategory(String category) {
    widget.onChangeCateory(category);
  }

  @override
  Widget build(BuildContext context) {


    final List categoryies = [
      {'id': 'coffee', 'name': AppLocalizations.of(context)!.categoryName1},
      {'id': 'dessert', 'name': AppLocalizations.of(context)!.categoryName2},
      {'id': 'limonad', 'name': AppLocalizations.of(context)!.categoryName3},
      {'id': 'sandwich', 'name': AppLocalizations.of(context)!.categoryName4},
    ];
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: categoryies.map((categor) {
        final isSelected = widget.selectedCategory == categor['id'];
        return GestureDetector(
          onTap: () => changeCategory( categor['id']),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected? Colors.deepOrange:Colors.white,
              borderRadius: BorderRadius.circular(6)
            ),
            child: Text(categor['name'], style: TextStyle(
              color: isSelected? Colors.white: Colors.black,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold: FontWeight.normal,
            ),),
          ),
        );
      }).toList(),
    );
  }
}
