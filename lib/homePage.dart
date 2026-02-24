import 'package:flutter/material.dart';
import 'package:application/mainPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                    ),
                    SizedBox(height: 20),
                    Row(
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
                    ),
                    SizedBox(height: 24),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage('assets/images/Banner_1.png'),
                              fit: BoxFit.cover,
                              opacity: 0.8,
                            ),
                          ),
                        ),

                        Positioned(
                          child: Padding(
                            padding: const EdgeInsetsGeometry.symmetric(
                              vertical: 13,
                              horizontal: 24,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Акция',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Купи один и получи один бесплатно',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(5, 5),
                                          color: Color.fromRGBO(17, 17, 17, 1),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 24,
                      spacing: 15,
                      children: <Widget>[
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: ProductCard(
                            cardId: 1,
                            cardName: 'Флэт Уайт',
                            cardCoffeType: 'Эспрессо',
                            cardPrice: 3.53,
                            cardImage: 'assets/images/3.png',
                            cardDescription:
                                'Насыщенный эспрессо с нежной молочной пенкой. Идеальный баланс крепости и мягкости для бодрого утра.',
                            rating: 4.6,
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: ProductCard(
                            cardId: 2,
                            cardName: 'Кофе Мокко',
                            cardCoffeType: 'Бархатистая пена',
                            cardPrice: 4.53,
                            cardImage: 'assets/images/2.png',
                            cardDescription:
                                'Свежеобжаренная арабика с нотами шоколада и карамели. Плотная крема и шелковистый вкус без горечи.',
                            rating: 4.9,
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: ProductCard(
                            cardId: 3,
                            cardName: 'Американо',
                            cardCoffeType: 'Взбитые сливки',
                            cardPrice: 4.53,
                            cardImage: 'assets/images/2.png',
                            cardDescription:
                                'Согревающий напиток с бархатистой текстурой и легкой сладостью. Маленькое удовольствие для больших свершений.',
                            rating: 5.0,
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: ProductCard(
                            cardId: 2,
                            cardName: 'Латте',
                            cardCoffeType: 'Эспрессо',
                            cardPrice: 3.53,
                            cardImage: 'assets/images/3.png',
                            cardDescription:
                                '100% арабика высокогорных районов Колумбии. Мягкий вкус с цитрусовыми нотками и долгим шоколадным послевкусием. Обжарка под заказ.',
                            rating: 4.4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
              Stack(
                children: [
                  Container(
                    width: 140,
                    height: 128,
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
                          Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 14,
                          ),
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
              ),

              SizedBox(height: 8),
              Text(
                widget.cardName,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                widget.cardCoffeType,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(162, 162, 162, 1),
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${widget.cardPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Добавлено в корзину'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        } else {
                          int check = orderList.indexWhere(
                            (item) => item['id'] == widget.cardId,
                          );
                          if (check >= 0) {
                            orderList[check]["quantity"] += 1;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Товар уже есть в корзине'),
                                duration: Duration(seconds: 1),
                              ),
                            );
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Добавлено в корзину'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          }
                        }
                      },
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
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('О напитке'),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          int check = favoriteList.indexWhere(
                            (item) => item['id'] == widget.cardId,
                          );
                          if (check >= 0) {
                            favoriteList.removeAt(check);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Удалено из избранного'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          } else {
                            favoriteList.add({
                              'id': widget.cardId,
                              'image': widget.cardImage,
                              "name": widget.cardName,
                              "coffeType": widget.cardCoffeType,
                              "cardImage": widget.cardImage,
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Добавлено в избранное'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          }
                        });
                      },
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
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(widget.cardImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cardName,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
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
                                  Icon(
                                    Icons.star_rounded,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    widget.rating.toStringAsFixed(1),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Divider(
                          color: Color.fromRGBO(227, 227, 227, 1),
                          thickness: 1,
                        ),
                      ),

                      // SizedBox(height: 16),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Описание',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
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
                      ),
                      SizedBox(height: 16),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Размер',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(12),
                                        side: BorderSide(
                                          color: Color.fromRGBO(
                                            227,
                                            227,
                                            227,
                                            1,
                                          ),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Text('S'),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  flex: 1,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(12),
                                        side: BorderSide(
                                          color: Color.fromRGBO(
                                            227,
                                            227,
                                            227,
                                            1,
                                          ),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Text('M'),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  flex: 1,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(12),
                                        side: BorderSide(
                                          color: Color.fromRGBO(
                                            227,
                                            227,
                                            227,
                                            1,
                                          ),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Text('L'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
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
                                  '\$ ${widget.cardPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
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
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Добавлено в корзину'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                } else {
                                  int check = orderList.indexWhere(
                                    (item) => item['id'] == widget.cardId,
                                  );
                                  if (check >= 0) {
                                    orderList[check]["quantity"] += 1;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Товар уже есть в корзине',
                                        ),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
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
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Добавлено в корзину'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  }
                                }
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size(150, 55),
                                maximumSize: const Size(210, 55),
                                backgroundColor: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    12,
                                  ),
                                ),
                              ),
                              child: Text(
                                'В корзину',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
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
