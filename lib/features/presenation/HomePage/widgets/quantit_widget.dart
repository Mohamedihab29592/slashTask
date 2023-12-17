import 'package:flutter/material.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key,required this.maxQuantity, required this.isStock});
  final int maxQuantity;
  final bool isStock;

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 1;


  void incrementQuantity() {
    if (quantity < widget.maxQuantity&& widget.isStock ) {
      setState(() {
        quantity++;
      });
    }
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Quantity"),
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.white, size: 13),
                onPressed: decrementQuantity,
              ),
              Container(
                width: 0.5,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Align(
                alignment: Alignment.center,
                child: Text(widget.isStock?'$quantity':'0',
                    style: const TextStyle(
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                    )),
              ),
              const SizedBox(width: 10),
              Container(
                width: 0.5,
                color: Colors.white,
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white, size: 13),
                onPressed: incrementQuantity,
              ),
            ],
          ),
        )
      ],
    );
  }
}
