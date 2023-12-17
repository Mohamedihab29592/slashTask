import 'package:flutter/material.dart';

import '../../../../core/functions.dart';
import '../../../data/dummy_data.dart';
import '../../../domain/models/product_model.dart';
import '../widgets/add_cart_button.dart';
import '../widgets/color_item.dart';
import '../widgets/expaned_item.dart';
import '../widgets/quantit_widget.dart';
import '../widgets/size_widgets.dart';
import '../widgets/swipper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Product sampleProduct;
  String selectedColor = '';
  String selectedSize = '';
  int quantity = 0;

  void updateSelectedColor(String color) {
    setState(() {
      selectedColor = color;

      // Find the variation corresponding to the selected color
      int selectedIndex = sampleProduct.variations.indexWhere((variation) =>
          variation.productPropertiesValues.any(
                  (property) =>
              property.property == 'Color' && property.value == selectedColor));

      // Update selectedSize and quantity based on the new index
      selectedSize = sampleProduct.variations[selectedIndex].productPropertiesValues
          .firstWhere((property) => property.property == 'Size')
          .value;

      quantity = sampleProduct.variations[selectedIndex].quantity;
    });
  }

  @override
  void initState() {
    sampleProduct = DummyDataGenerator.generateDummyProduct();

    selectedColor = sampleProduct.variations[0].productPropertiesValues
        .firstWhere((property) => property.property == 'Color')
        .value;

    int selectedIndex = sampleProduct.variations.indexWhere((variation) =>
        variation.productPropertiesValues
            .any((property) => property.property == 'Color' && property.value == selectedColor));

    selectedSize = sampleProduct.variations[selectedIndex].productPropertiesValues
        .firstWhere((property) => property.property == 'Size')
        .value;

    quantity = sampleProduct.variations[selectedIndex].quantity;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
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
                        const SizedBox(height: 5),
                        Text(sampleProduct.brandName!),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              ColorItemWidget(
                onColorSelected: updateSelectedColor,
                length: sampleProduct.variations.length,
                colorValues: sampleProduct.variations
                    .map((variation) => variation.productPropertiesValues
                    .firstWhere((property) => property.property == 'Color')
                    .value)
                    .toList(),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [Text("Select Size"), Spacer(), Text("Select Chart")],
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              ExpandedItem(
                dec: sampleProduct.description,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  QuantityWidget(maxQuantity: quantity, isStock: isStockAvailable(
                    selectedColor,
                    selectedSize,
                    sampleProduct.availableProperties,


                  ),),
                  const Spacer(),

                  Text('Available $quantity in Stock')
                ],
              ),
              const SizedBox(height: 20),


              AddToCartButton(
                isStock: isStockAvailable(
                  selectedColor,
                  selectedSize,
                  sampleProduct.availableProperties,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
