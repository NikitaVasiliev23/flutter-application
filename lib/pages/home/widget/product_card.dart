import 'package:flutter/material.dart';
import 'package:application/pages/main/main_page.dart';

class ProductCard extends StatefulWidget {
  final int cardId;
  final String cardName;
  final String cardCoffeType;
  final double cardPrice;
  final String cardImage;
  final String cardDescription;
  final double rating;

  const ProductCard({
    required this.cardId,
    required this.cardName,
    required this.cardCoffeType,
    required this.cardPrice,
    required this.cardImage,
    required this.cardDescription,
    required this.rating,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void _addOrder(BuildContext context) {
    if (orderList.isEmpty) {
      orderList.add({
        'id': widget.cardId,
        'image': widget.cardImage,
        "name": widget.cardName,
        "coffeType": widget.cardCoffeType,
        "cardPrice": widget.cardPrice,
        "cardImage": widget.cardImage,
        "quantity": 1,
      });
      _showSnackBar(context, 'Добавлено в корзину');
    } else {
      int check = orderList.indexWhere((item) => item['id'] == widget.cardId);
      if (check >= 0) {
        orderList[check]["quantity"] += 1;
        _showSnackBar(context, 'Товар уже есть в корзине');
      } else {
        orderList.add({
          'id': widget.cardId,
          'image': widget.cardImage,
          "name": widget.cardName,
          "coffeType": widget.cardCoffeType,
          "cardPrice": widget.cardPrice,
          "cardImage": widget.cardImage,
          "quantity": 1,
        });
        _showSnackBar(context, 'Добавлено в корзину');
      }
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 1)),
    );
  }

  void _toggleFavorite(BuildContext context) {
    setState(() {
      int check = favoriteList.indexWhere(
        (item) => item['id'] == widget.cardId,
      );
      if (check >= 0) {
        favoriteList.removeAt(check);
        _showSnackBar(context, 'Удалено из избранного');
      } else {
        favoriteList.add({
          'id': widget.cardId,
          'image': widget.cardImage,
          "name": widget.cardName,
          "coffeType": widget.cardCoffeType,
          "cardImage": widget.cardImage,
        });
        _showSnackBar(context, 'Добавлено в избранное');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showProductDetail(context),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        width: 156,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageMiniCard(widget: widget),

              SizedBox(height: 8),

              TextMiniCard(widget: widget),

              SizedBox(height: 8),

              BottomMiniCard(
                price: widget.cardPrice,
                addToCart: () => _addOrder(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProductDetail(BuildContext context) {
    String selectedSize = 'M';

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('О напитке'),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () => _toggleFavorite(context),
                      icon: Icon(
                        favoriteList.any((item) => item['id'] == widget.cardId)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            favoriteList.any(
                              (item) => item['id'] == widget.cardId,
                            )
                            ? Colors.deepOrange
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageProductDetail(widget: widget),

                      SizedBox(height: 16),

                      TitleDetailCard(widget: widget),

                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Divider(
                          color: Color.fromRGBO(227, 227, 227, 1),
                          thickness: 1,
                        ),
                      ),

                      DescriptionCard(widget: widget),

                      SizedBox(height: 16),

                      SizeCoffeeButtons(
                        onSizeSelected: (size) {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                      ),

                      SizedBox(height: 16),

                      BottomDitaleCard(
                        price: widget.cardPrice,
                        addToCart: () => _addOrder(context),
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

class ImageMiniCard extends StatelessWidget {
  const ImageMiniCard({super.key, required this.widget});

  final ProductCard widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 140,
          constraints: BoxConstraints(
            minHeight: 128,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(widget.cardImage),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          top: 8,
          right: 8,
          child: Container(
            child: Row(
              children: [
                Icon(Icons.star_rounded, color: Colors.amber, size: 14),
                Text(
                  widget.rating.toStringAsFixed(1),
                  style: TextStyle(
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

class TextMiniCard extends StatelessWidget {
  const TextMiniCard({super.key, required this.widget});

  final ProductCard widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.cardName,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        //
        Text(
          widget.cardCoffeType,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(162, 162, 162, 1),
          ),
        ),
      ],
    );
  }
}

class BottomMiniCard extends StatelessWidget {
  final double price;
  final VoidCallback addToCart;

  const BottomMiniCard({required this.price, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$ ${price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: addToCart,
            icon: Icon(Icons.add),
            color: Colors.white,
            splashRadius: 14,
            style: IconButton.styleFrom(
              fixedSize: Size(32, 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageProductDetail extends StatelessWidget {
  const ImageProductDetail({super.key, required this.widget});

  final ProductCard widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 200,
      ),
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(widget.cardImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class TitleDetailCard extends StatelessWidget {
  const TitleDetailCard({super.key, required this.widget});

  final ProductCard widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.cardName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            widget.cardCoffeType,
            style: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(162, 162, 162, 1),
            ),
          ),

          SizedBox(height: 10),

          Container(
            child: Row(
              children: [
                Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                SizedBox(width: 5),
                Text(
                  widget.rating.toStringAsFixed(1),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({super.key, required this.widget});

  final ProductCard widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Описание',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            widget.cardDescription,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(162, 162, 162, 1),
            ),
          ),
        ],
      ),
    );
  }
}

class SizeCoffeeButtons extends StatefulWidget {
  final Function(String selectedSize) onSizeSelected;

  const SizeCoffeeButtons({required this.onSizeSelected});

  @override
  State<SizeCoffeeButtons> createState() => _SizeCoffeeButtonsState();
}

class _SizeCoffeeButtonsState extends State<SizeCoffeeButtons> {
  String _selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Размер',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
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

    void _selected(BuildContext context) {
      setState(() {
        _selectedSize = size;
        widget.onSizeSelected(size);
      });
    }

    return TextButton(
      onPressed: () {
        _selected(context);
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
          side: BorderSide(
            color: isSelected
                ? Colors.deepOrange
                : Color.fromRGBO(227, 227, 227, 1),
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

class BottomDitaleCard extends StatelessWidget {
  final double price;
  final VoidCallback addToCart;

  const BottomDitaleCard({required this.price, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Цена',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(144, 144, 144, 1),
                ),
              ),
              Text(
                '\$ ${price.toStringAsFixed(2)}',
                style: TextStyle(
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
              minimumSize: Size(150, 55),
              maximumSize: const Size(210, 55),
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
            ),
            child: Text('В корзину', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
