import 'package:flutter/material.dart';

import '../../../../functions.dart';
import '../../../data/dummy_data.dart';
import '../../../domain/models/product_model.dart';
import '../../../domain/models/product_property_value.dart';
import '../widgets/add_cart_button.dart';
import '../widgets/color_item.dart';
import '../widgets/expaned_item.dart';
import '../widgets/quantit_widget.dart';
import '../widgets/size_widgets.dart';
import '../widgets/swipper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Product sampleProduct;
  String selectedColor = '';
  String selectedSize = '';

  void updateSelectedColor(String color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  void initState() {
    sampleProduct = DummyDataGenerator.generateDummyProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.title,
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            SwiperCard(
              images: sampleProduct.variations
                  .firstWhere(
                    (variation) => variation.productPropertiesValues.any(
                        (property) =>
                            property.property == 'Color' &&
                            property.value == selectedColor),
                    orElse: () => sampleProduct.variations.first,
                  )
                  .productVarientImages,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sampleProduct.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("EGP ${sampleProduct.variations[0].price.toString()}"),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: Image.asset(
                            sampleProduct.brandLogoUrl!,
                            fit: BoxFit.fill,
                            height: 50,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(sampleProduct.brandName!),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ColorItemWidget(
              onColorSelected: updateSelectedColor,
              length: sampleProduct.variations.length,
              colorValues: sampleProduct.variations
                  .map((variation) => variation.productPropertiesValues
                      .firstWhere((property) => property.property == 'Color',
                          orElse: () => ProductPropertyAndValue(
                              property: 'Color', value: '#FFFFFF'))
                      .value)
                  .toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [Text("Select Size"), Spacer(), Text("Select Chart")],
            ),
            const SizedBox(
              height: 20,
            ),
            SizeWidget(
              length: sampleProduct.variations.length,
              sizes: sampleProduct.variations
                  .expand((variation) => variation.productPropertiesValues
                      .where((property) => property.property == 'Size')
                      .map((property) => property.value))
                  .toSet()
                  .toList(),
              onSizeSelected: (size) {
                setState(() {
                  selectedSize = size;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ExpandedItem(
              dec: sampleProduct.description,
            ),
            const SizedBox(
              height: 30,
            ),
            const QuantityWidget(),
            const SizedBox(
              height: 20,
            ),
            AddToCartButton(
              isStock: isStockAvailable(
                selectedColor,
                selectedSize,
                sampleProduct.availableProperties,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ]),
        ),
      ),
    );
  }
}
