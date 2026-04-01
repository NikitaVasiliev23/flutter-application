import 'package:application/l10n/app_localizations.dart';
import 'package:application/pages/main/main_page.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.orderPageTitle), centerTitle: true),
      body: orderList.isEmpty
          ? const ScreenNoOrder()
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
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.orderEmptyText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            AppLocalizations.of(context)!.orderEmptySubtext,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ScreenOrder extends StatefulWidget {
  final List<Map<String, dynamic>> orderList;
  final VoidCallback onUpdate;

  const ScreenOrder({
    required this.orderList,
    required this.onUpdate,
    super.key,
  });

  @override
  State<ScreenOrder> createState() => _ScreenOrderState();
}

enum OrderType { pickup, delevery }

class _ScreenOrderState extends State<ScreenOrder> {
  OrderType orderTypeView = OrderType.pickup;
   String _deliveryAdress ='';

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    _deliveryAdress = AppLocalizations.of(context)!.defaultAdress;
  }

  double calculateTotal() {
    double totalPrice = 0;
    for (final item in widget.orderList) {
      totalPrice += item['cardPrice'] * item['quantity'];
    }
    return totalPrice;
  }

  Future<void> _showEditAddressDialog() {
    String tempAddress = _deliveryAdress;

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.alertText),
        content: TextField(
          decoration:  InputDecoration(
            hintText: AppLocalizations.of(context)!.alertHintText,
            border: const OutlineInputBorder(),
          ),
          onChanged: (value) => tempAddress = value,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child:  Text(AppLocalizations.of(context)!.buttonCancel),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _deliveryAdress = tempAddress);
              Navigator.pop(context);
            },
            child:  Text(AppLocalizations.of(context)!.buttonSave),
          ),
        ],
      ),
    );
  }

  Widget editAdress(OrderType orderTypeView) {
    if (orderTypeView == OrderType.delevery) {
      return ElevatedButton.icon(
        onPressed: _showEditAddressDialog,

        label: Text(AppLocalizations.of(context)!.editAdress),
        icon: const Icon(Icons.edit_square),

        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 12),
          elevation: 0,
          minimumSize: const Size(120, 26),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.black, width: 1),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  void _reducedQuantity(Map<String, dynamic> item) {
    setState(() {
      if (item['quantity'] > 1) {
        item['quantity'] -= 1;
      } else {
        widget.orderList.remove(item);
      }
    });

    widget.onUpdate();
  }

  void _increaseQuantity(Map<String, dynamic> item) {
    setState(() {
      item['quantity'] += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SegmentedButtonWidget(
                currentType: orderTypeView,
                onTypeChanged: (newType) {
                  setState(() {
                    orderTypeView = newType;
                  });
                },
              ),

              const SizedBox(height: 24),

              _EditAdressWidget(
                address: _deliveryAdress,
                onEditAddress: editAdress(orderTypeView),
              ),

              const Padding(
                padding: EdgeInsets.all(16),
                child: Divider(
                  color: Color.fromRGBO(227, 227, 227, 1),
                  thickness: 1,
                ),
              ),

              _ShowOrderProduct(
                onReduced: _reducedQuantity,
                onIncrease: _increaseQuantity,
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Divider(
                  color: Color.fromRGBO(227, 227, 227, 1),
                  thickness: 1,
                ),
              ),

              _PaymantDetails(
                orderType: orderTypeView,
                totalPrice: calculateTotal(),
                deliveryPrice: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymantDetails extends StatelessWidget {
  final OrderType orderType;
  final double totalPrice;
  final double deliveryPrice;

  const _PaymantDetails({
    required this.orderType,
    required this.totalPrice,
    required this.deliveryPrice,
  });

  double get finalPrice {
    return orderType == OrderType.delevery
        ? totalPrice + deliveryPrice
        : totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          AppLocalizations.of(context)!.paymentDetails,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 16),

        _priceRow(AppLocalizations.of(context)!.price, totalPrice),
        if (orderType == OrderType.delevery) ...[
          const SizedBox(height: 8),
          _priceRow(AppLocalizations.of(context)!.delevery, deliveryPrice),
        ],

        const SizedBox(height: 30),

        _TotalPriceRow(totalPrice: finalPrice,),

        const SizedBox(height: 16),

        const _ButtonToPay(),
      ],
    );
  }

  Widget _priceRow(String label, double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        Text(
          '\$ ${price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

}

class _ButtonToPay extends StatelessWidget {
  const _ButtonToPay();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 55),
      ),
      child: Text(AppLocalizations.of(context)!.buttonPuy),
    );
  }
}

class _EditAdressWidget extends StatelessWidget {
  final String address;
  final Widget onEditAddress;

  const _EditAdressWidget({required this.address, required this.onEditAddress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Text(
          AppLocalizations.of(context)!.adress,
          style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(address, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 12),

        onEditAddress,
      ],
    );
  }
}

class _SegmentedButtonWidget extends StatelessWidget {
  final OrderType currentType;
  final Function(OrderType) onTypeChanged;

  const _SegmentedButtonWidget({
    required this.currentType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
          foregroundColor: Colors.black,
          selectedBackgroundColor: Colors.deepOrange,
          selectedForegroundColor: Colors.white,
        ),
        segments:  <ButtonSegment<OrderType>>[
          ButtonSegment<OrderType>(
            value: OrderType.pickup,
            label: Text(AppLocalizations.of(context)!.pickup),
          ),
          ButtonSegment<OrderType>(
            value: OrderType.delevery,
            label: Text(AppLocalizations.of(context)!.delevery),
          ),
        ],
        selected: <OrderType>{currentType},
        onSelectionChanged: (newSelection) {
          onTypeChanged(newSelection.first);
        },
      ),
    );
  }
}

class _ShowOrderProduct extends StatelessWidget {
  final Function(Map<String, dynamic>) onReduced;
  final Function(Map<String, dynamic>) onIncrease;

  const _ShowOrderProduct({
    required this.onReduced,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: orderList.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
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
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['coffeType'],
                      style: const TextStyle(
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
                    onPressed: () => onReduced(item),
                    icon: const Icon(Icons.remove_circle_outline),
                    padding: EdgeInsets.zero,
                  ),
                  Text('${item['quantity']}'),
                  IconButton(
                    onPressed: () => onIncrease(item),
                    icon: const Icon(Icons.add_circle_outline),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _TotalPriceRow extends StatelessWidget {
  final double totalPrice;

  const _TotalPriceRow({required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(
          Icons.account_balance_wallet_outlined,
          color: Colors.deepOrange,
        ),
        const SizedBox(width: 10),
        Column(
          children: [
             Text(AppLocalizations.of(context)!.total,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '\$ ${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.deepOrange,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
