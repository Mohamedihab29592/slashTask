import 'package:flutter/material.dart';

class SizeWidget extends StatefulWidget {
  const SizeWidget({super.key,  required this.length, required this.sizes, required this.onSizeSelected});

  final int length;
  final List<String> sizes;
  final void Function(String) onSizeSelected;


  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  int selectedIndex = 0;

  String get selectedSize => selectedIndex >= 0 && selectedIndex < widget.sizes.length
      ? widget.sizes[selectedIndex]
      : '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.length,
              (index) {
            List<String> sizes = widget.sizes;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onSizeSelected(sizes[index]);
                });
              },
              child: Container(
                width: 70,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: index == selectedIndex ? Colors.green : Colors.grey.shade800,
                ),
                child: Center(
                  child: Text(
                    sizes[index],
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
