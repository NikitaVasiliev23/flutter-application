import 'package:application/l10n/app_localizations.dart';
import 'package:application/pages/home/widget/category_butttons.dart';
import 'package:application/pages/home/widget/city_dropdoun.dart';
import 'package:application/pages/home/widget/product_card.dart';
import 'package:application/pages/home/widget/promo_banner.dart';
import 'package:application/pages/home/widget/search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'coffee';
  String searchQuery = '';
  bool isSortedByPrice = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final productList = [
      {
        'cardId': 1,
        'cardName': localizations.productCardName1,
        'cardCoffeType': localizations.productCardType1,
        'cardPrice': 3.53,
        'cardImage': 'assets/images/3.png',
        'cardDescription': localizations.productCardDescription1,
        'rating': 4.6,
        'category': 'coffee',
      },
      {
        'cardId': 2,
        'cardName': localizations.productCardName2,
        'cardCoffeType': localizations.productCardType2,
        'cardPrice': 4.53,
        'cardImage': 'assets/images/2.png',
        'cardDescription': localizations.productCardDescription2,
        'rating': 4.9,
        'category': 'coffee',
      },
      {
        'cardId': 3,
        'cardName': localizations.productCardName3,
        'cardCoffeType': localizations.productCardType3,
        'cardPrice': 4.53,
        'cardImage': 'assets/images/2.png',
        'cardDescription': localizations.productCardDescription3,
        'rating': 5.0,
        'category': 'coffee',
      },

      {
        'cardId': 4,
        'cardName': localizations.productCardName4,
        'cardCoffeType': localizations.productCardType4,
        'cardPrice': 3.53,
        'cardImage': 'assets/images/3.png',
        'cardDescription': localizations.productCardDescription4,
        'rating': 4.4,
        'category': 'coffee',
      },
      {
        'cardId': 5,
        'cardName': localizations.productCardName5,
        'cardCoffeType': localizations.productCardType5,
        'cardPrice': 3.57,
        'cardImage': 'assets/images/chocolate_cheesecake.jpg',
        'cardDescription': localizations.productCardDescription5,
        'rating': 4.4,
        'category': 'dessert',
      },
      {
        'cardId': 6,
        'cardName': localizations.productCardName6,
        'cardCoffeType': localizations.productCardType6,
        'cardPrice': 3.65,
        'cardImage': 'assets/images/chocolate_cake.jpg',
        'cardDescription': localizations.productCardDescription6,
        'rating': 4.4,
        'category': 'dessert',
      },
      {
        'cardId': 7,
        'cardName': localizations.productCardName7,
        'cardCoffeType': localizations.productCardType7,
        'cardPrice': 2.46,
        'cardImage': 'assets/images/chocolate_croissant.jpg',
        'cardDescription': localizations.productCardDescription7,
        'rating': 4.4,
        'category': 'dessert',
      },
      {
        'cardId': 8,
        'cardName': localizations.productCardName8,
        'cardCoffeType': localizations.productCardType7,
        'cardPrice': 2.46,
        'cardImage': 'assets/images/mojito_lemonade.jpg',
        'cardDescription': localizations.productCardDescription7,
        'rating': 4.4,
        'category': 'limonad',
      },
      {
        'cardId': 9,
        'cardName': localizations.productCardName9,
        'cardCoffeType': localizations.productCardType7,
        'cardPrice': 2.46,
        'cardImage': 'assets/images/Limonad-malina-myata.jpg',
        'cardDescription': localizations.productCardDescription7,
        'rating': 4.4,
        'category': 'limonad',
      },
      {
        'cardId': 10,
        'cardName': localizations.productCardName10,
        'cardCoffeType': localizations.productCardType7,
        'cardPrice': 2.46,
        'cardImage': 'assets/images/Limonad-mango-marakujya.jpg',
        'cardDescription': localizations.productCardDescription7,
        'rating': 4.4,
        'category': 'limonad',
      },
      {
        'cardId': 11,
        'cardName': localizations.productCardName11,
        'cardCoffeType': localizations.productCardType7,
        'cardPrice': 2.46,
        'cardImage': 'assets/images/chicken_sandwich.jpg',
        'cardDescription': localizations.productCardDescription7,
        'rating': 4.4,
        'category': 'sandwich',
      },
    ];


    List<Map<String, dynamic>> getFilterProducts() {
      List<Map<String, dynamic>> filterProducts = productList
          .where((product) => product['category'] == selectedCategory)
          .toList();

      if (searchQuery.isNotEmpty) {
        filterProducts = filterProducts.where((product) {
          final productName = product['cardName'].toString().toLowerCase();
          final queue = searchQuery.toLowerCase();

          final startsWith = productName.startsWith(queue);
          final startsWithWord = productName
              .split(' ')
              .any((word) => word.startsWith(queue));
          final contains = productName.contains(queue);

          final matchesSearch = startsWith || startsWithWord || contains;

          return matchesSearch;
        }).toList();
      }

      if (isSortedByPrice) {
        filterProducts.sort(
          (a, b) =>
              (a['cardPrice'] as double).compareTo(b['cardPrice'] as double)
        );
      }

      return filterProducts;
    }

    void updateCategory(String category) {
      setState(() {
        selectedCategory = category;
      });
    }

    void updateSearchQuery(String query) {
      setState(() {
        searchQuery = query;
      });
    }

    void sortPrise() {
      setState(() {
        isSortedByPrice = true;
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(17, 17, 17, 1),
                  Color.fromRGBO(49, 49, 49, 1),
                ],
                stops: [0, 1],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 3,
            ),
            color: Colors.white,
          ),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),

              children: [
                const CityDropdounWidget(),

                const SizedBox(height: 20),

                SearchBarWidget(
                  searchQuery: searchQuery,
                  onSearchChange: updateSearchQuery,
                  sortPriseer: sortPrise,
                ),

                const SizedBox(height: 24),

                const PromoBannerWidget(),

                const SizedBox(height: 24),

                CategoryButttons(
                  selectedCategory: selectedCategory,
                  onChangeCateory: updateCategory,
                ),

                const SizedBox(height: 24),

                Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 24,
                  spacing: MediaQuery.of(context).size.width * 0.04,

                  children: getFilterProducts().map((product) {
                    return FractionallySizedBox(
                      widthFactor: 0.47,
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: ProductCard(productData: product),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
