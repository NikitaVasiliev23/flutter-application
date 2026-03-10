import 'package:flutter/material.dart';

import 'package:application/pages/home/widget/search_bar.dart';
import 'package:application/pages/home/widget/city_dropdoun.dart';
import 'package:application/pages/home/widget/promo_banner.dart';
import 'package:application/pages/home/widget/product_card.dart';

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
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),

              children: [
                CityDropdounWidget(),

                SizedBox(height: 20),

                SearchBarWidget(),

                SizedBox(height: 24),

                PromoBannerWidget(),

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
                        cardId: 4,
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
        ],
      ),
    );
  }
}
