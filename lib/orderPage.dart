import 'package:flutter/material.dart';
import 'package:application/mainPage.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Корзина'), centerTitle: true),
      body: orderList.isEmpty
          ? ScreenNoOrder()
          : ScreenOrder(
              orderList: orderList,
              onUpdate: () {
                setState(() {});
              },
            ),
    );
  }
}

class ScreenNoOrder extends StatelessWidget {
  const ScreenNoOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'В корзине пусто',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Добавьте понравившийся товар из меню',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ScreenOrder extends StatefulWidget {
  final List orderList;
  final VoidCallback onUpdate;

  const ScreenOrder({Key? key, required this.orderList, required this.onUpdate})
    : super(key: key);

  @override
  State<ScreenOrder> createState() => _ScreenOrderState();
}

enum OrderType { pickup, delevery }

class _ScreenOrderState extends State<ScreenOrder> {
  OrderType orderTypeView = OrderType.pickup;
  String _deliveryAdress = 'г. Москва, ул. Тверская, д. 15, кв. 42';

  double calculateTotal() {
    double totalPrice = 0;

    for (var item in widget.orderList) {
      totalPrice += (item['cardPrice'] * item['quantity']);
    }

    return totalPrice;
  }

  Widget editAdress(OrderType orderTypeView) {
    if (orderTypeView == OrderType.delevery) {
      return ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Укажите ваш адрес'),
                content: TextField(
                  onChanged: (String value) {
                    _deliveryAdress = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Отмена'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _deliveryAdress;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Сохранить'),
                  ),
                ],
              );
            },
          );
        },
        label: Text('Изменить адрес'),
        icon: Icon(Icons.edit_square),

        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          textStyle: TextStyle(fontSize: 12),
          elevation: 0,
          minimumSize: Size(120, 26),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.black, width: 1),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget priceWidget(OrderType orderTypeView) {
    if (orderTypeView == OrderType.delevery) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Детали оплаты',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Цена', style: TextStyle(fontSize: 14)),

              Text(
                '\$ ${calculateTotal().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Доставка', style: TextStyle(fontSize: 14)),
              Text(
                '\$ 1.0',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.deepOrange,
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    'Итого',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$ ${(calculateTotal() + 1).toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},

            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 55),
            ),
            child: Text('Оплатить'),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Детали оплаты',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Цена', style: TextStyle(fontSize: 14)),

              Text(
                '\$ ${calculateTotal().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 30),
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.deepOrange,
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    'Итого',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$ ${calculateTotal().toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},

            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 55),
            ),
            child: Text('Оплатить'),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: SegmentedButton<OrderType>(
                  showSelectedIcon: false,
                  style: SegmentedButton.styleFrom(
                    side: const BorderSide(
                      color: Color.fromRGBO(237, 237, 237, 1),
                      width: 4,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    backgroundColor: Color.fromRGBO(237, 237, 237, 1),
                    foregroundColor: Colors.black,
                    selectedBackgroundColor: Colors.deepOrange,
                    selectedForegroundColor: Colors.white,
                  ),
                  segments: const <ButtonSegment<OrderType>>[
                    ButtonSegment<OrderType>(
                      value: OrderType.pickup,
                      label: Text('Самовывоз'),
                    ),
                    ButtonSegment<OrderType>(
                      value: OrderType.delevery,
                      label: Text('Доставка'),
                    ),
                  ],
                  selected: <OrderType>{orderTypeView},
                  onSelectionChanged: (Set<OrderType> newSelection) {
                    setState(() {
                      orderTypeView = newSelection.first;
                    });
                  },
                ),
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Адрес',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(_deliveryAdress, style: TextStyle(fontSize: 14)),
                  SizedBox(height: 12),

                  editAdress(orderTypeView),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child: Divider(
                  color: Color.fromRGBO(227, 227, 227, 1),
                  thickness: 1,
                ),
              ),



              Column(
                children: orderList.map((item) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                item['coffeType'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(162, 162, 162, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (item['quantity'] > 1) {
                                    item['quantity'] -= 1;
                                  } else {
                                    widget.orderList.remove(item);
                                  }
                                });

                                widget.onUpdate();
                              },
                              icon: Icon(Icons.remove_circle_outline),
                              padding: EdgeInsets.zero,
                            ),
                            Text('${item['quantity']}'),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  item['quantity'] += 1;
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Divider(
                  color: Color.fromRGBO(227, 227, 227, 1),
                  thickness: 1,
                ),
              ),

              priceWidget(orderTypeView),
            ],
          ),
        ),
      ),
    );
  }
}
