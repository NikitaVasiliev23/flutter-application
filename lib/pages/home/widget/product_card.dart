import 'package:application/l10n/app_localizations.dart';
import 'package:application/pages/main/main_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Map<String, dynamic> productData;
  const ProductCard({required this.productData, super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int get _cardId => widget.productData['cardId'] as int;
  String get _cardName => widget.productData['cardName'] as String;
  String get _cardCoffeType => widget.productData['cardCoffeType'] as String;
  double get _cardPrice => widget.productData['cardPrice'] as double;
  String get _cardImage => widget.productData['cardImage'] as String;
  String get _cardCategory => widget.productData['category'] as String;
  String get _cardDescription =>
      widget.productData['cardDescription'] as String;
  double get _rating => widget.productData['rating'] as double;
  String selectedSize = 'M';

  void _addOrder(BuildContext context, String size) {
    final localizations = AppLocalizations.of(context)!;

    final int check = orderList.indexWhere((item) => item['id'] == _cardId);
    if (check >= 0) {
      orderList[check]['quantity'] += 1;
      _showSnackBar(context, localizations.removedFromCart);
    } else {
      orderList.add({
        'id': _cardId,
        'image': _cardImage,
        'name': _cardName,
        'coffeType': _cardCoffeType,
        'cardPrice': _cardPrice,
        'cardImage': _cardImage,
        'quantity': 1,
        'size': size,
      });
      _showSnackBar(context, localizations.addedToCart);
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }

  void _toggleFavorite(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    setState(() {
      final int check = favoriteList.indexWhere(
        (item) => item['id'] == _cardId,
      );
      if (check >= 0) {
        favoriteList.removeAt(check);
        _showSnackBar(context, localizations.removedFromFavorites);
      } else {
        favoriteList.add({
          'id': _cardId,
          'image': _cardImage,
          'name': _cardName,
          'coffeType': _cardCoffeType,
          'cardImage': _cardImage,
        });
        _showSnackBar(context, localizations.addedToFavorites);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showProductDetail(context),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        constraints: const BoxConstraints(minWidth: 155),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ImageMiniCard(image: _cardImage, rating: _rating),

              const SizedBox(height: 8),

              _TextMiniCard(cardName: _cardName, cardCoffeType: _cardCoffeType),

              const SizedBox(height: 8),

              _BottomMiniCard(
                price: _cardPrice,
                addToCart: () => _addOrder(context, selectedSize),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProductDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(AppLocalizations.of(context)!.productDetailTitle),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () => _toggleFavorite(context),
                      icon: Icon(
                        favoriteList.any((item) => item['id'] == _cardId)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: favoriteList.any((item) => item['id'] == _cardId)
                            ? Colors.deepOrange
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ImageProductDetail(cardImage: _cardImage),

                      const SizedBox(height: 16),

                      _TitleDetailCard(
                        cardName: _cardName,
                        cardCoffeType: _cardCoffeType,
                        rating: _rating,
                      ),

                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Divider(
                          color: Color.fromRGBO(227, 227, 227, 1),
                          thickness: 1,
                        ),
                      ),

                      _DescriptionCard(cardDescription: _cardDescription),

                      const SizedBox(height: 16),

                      if (_cardCategory == 'coffee')
                        _SizeCoffeeButtons(
                          onSizeSelected: (size) {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                        ),

                      const SizedBox(height: 16),

                      _BottomDitaleCard(
                        price: _cardPrice,
                        addToCart: () => _addOrder(context, selectedSize),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _ImageMiniCard extends StatelessWidget {
  final String image;
  final double rating;

  const _ImageMiniCard({required this.image, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 128),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.star_rounded, color: Colors.amber, size: 14),
                const SizedBox(width: 2),
                Text(
                  rating.toStringAsFixed(1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TextMiniCard extends StatelessWidget {
  final String cardName;
  final String cardCoffeType;

  const _TextMiniCard({required this.cardName, required this.cardCoffeType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cardName,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        //
        Text(
          cardCoffeType,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(162, 162, 162, 1),
          ),
        ),
      ],
    );
  }
}

class _BottomMiniCard extends StatelessWidget {
  final double price;
  final VoidCallback addToCart;

  const _BottomMiniCard({required this.price, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$ ${price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: addToCart,
          icon: const Icon(Icons.add),
          color: Colors.white,
          splashRadius: 14,
          style: IconButton.styleFrom(
            fixedSize: const Size(32, 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.deepOrange,
          ),
        ),
      ],
    );
  }
}

class _ImageProductDetail extends StatelessWidget {
  final String cardImage;

  const _ImageProductDetail({required this.cardImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 200),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(cardImage), fit: BoxFit.cover),
      ),
    );
  }
}

class _TitleDetailCard extends StatelessWidget {
  final String cardName;
  final String cardCoffeType;
  final double rating;

  const _TitleDetailCard({
    required this.cardName,
    required this.cardCoffeType,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cardName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          cardCoffeType,
          style: const TextStyle(
            fontSize: 12,
            color: Color.fromRGBO(162, 162, 162, 1),
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
            const SizedBox(width: 5),
            Text(
              rating.toStringAsFixed(1),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

class _DescriptionCard extends StatelessWidget {
  final String cardDescription;

  const _DescriptionCard({required this.cardDescription});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.productDetailTextDescription,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          cardDescription,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(162, 162, 162, 1),
          ),
        ),
      ],
    );
  }
}

class _SizeCoffeeButtons extends StatefulWidget {
  final Function(String selectedSize) onSizeSelected;

  const _SizeCoffeeButtons({required this.onSizeSelected});

  @override
  State<_SizeCoffeeButtons> createState() => _SizeCoffeeButtonsState();
}

class _SizeCoffeeButtonsState extends State<_SizeCoffeeButtons> {
  String _selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.productDetailTextSize,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ['S', 'M', 'L'].map((size) {
            return Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: size == 'S' ? 0 : 15),
                child: _buildSizeCoffeButtom(size),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSizeCoffeButtom(String size) {
    final isSelected = _selectedSize == size;

    void selectSize() {
      setState(() {
        _selectedSize = size;
        widget.onSizeSelected(size);
      });
    }

    return TextButton(
      onPressed: selectSize,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
          side: BorderSide(
            color: isSelected
                ? Colors.deepOrange
                : const Color.fromRGBO(227, 227, 227, 1),
            width: 1,
          ),
        ),
      ),
      child: Text(
        size,
        style: TextStyle(color: isSelected ? Colors.deepOrange : Colors.black),
      ),
    );
  }
}

class _BottomDitaleCard extends StatelessWidget {
  final double price;
  final VoidCallback addToCart;

  const _BottomDitaleCard({required this.price, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.price,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(144, 144, 144, 1),
              ),
            ),
            Text(
              '\$ ${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: addToCart,
          style: TextButton.styleFrom(
            minimumSize: const Size(150, 55),
            maximumSize: const Size(210, 55),
            backgroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.productDetailButton,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
