import 'package:flutter/material.dart';

class AddToCartButton extends StatefulWidget {
   const AddToCartButton({super.key,required this.isStock});
   final bool isStock ;

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: widget.isStock? Colors.green:Colors.grey,
        ),
        child: widget.isStock? const Text('Add to Cart'): const Text('Out of Stock'),
      ),
    );
  }
}
