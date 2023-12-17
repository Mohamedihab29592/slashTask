import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperCard extends StatefulWidget {
  const SwiperCard({super.key,  required this.images});

  final List<String> images;

  @override
  State<SwiperCard> createState() => _SwiperCardState();
}

int currentIndex = 0;
SwiperController swiperController = SwiperController();

class _SwiperCardState extends State<SwiperCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: Swiper(
            controller: swiperController,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                widget.images[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: widget.images.length,
            viewportFraction: 0.8,
            scale: 0.9,
            onIndexChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: buildSwiperItem(widget.images, index),
            );
          }),
        ),
      ],
    );
  }

  Widget buildSwiperItem(List<String> images, int index) {
    return InkWell(
      onTap: () {
        swiperController.move(index);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: currentIndex == index ? Colors.green : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: Image.asset(
          images[index],
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

