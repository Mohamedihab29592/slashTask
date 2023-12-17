import 'package:flutter/material.dart';

class ColorItemWidget extends StatefulWidget {
  final int length;
  final List<String> colorValues;
  final Function(String) onColorSelected;


  const ColorItemWidget({super.key, required this.length, required this.colorValues  ,  required this.onColorSelected,
  });

  @override
  State<ColorItemWidget> createState() => _ColorItemWidgetState();
}

class _ColorItemWidgetState extends State<ColorItemWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.length,
              (index) {
            List<String> colors = widget.colorValues;

            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.onColorSelected(colors[index]);

                  selectedIndex = index;
                });
              },
              child: Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(int.parse(colors[index].replaceAll('#', '0xFF'))),
                  border: Border.all(
                    color: index == selectedIndex ? Colors.green : Colors.grey,
                    width: 3,
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
