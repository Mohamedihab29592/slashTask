import '../domain/models/product_model.dart';
import '../domain/models/product_property_value.dart';
import '../domain/models/product_variations.dart';

class DummyDataGenerator {
  static Product generateDummyProduct() {
    return Product(
      id: 1,
      name: 'Lightning T-Shirt',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
      brandId: 101,
      brandName: 'Libra Sports',
      brandLogoUrl: 'assets/logo.jpg',
      rating: 4.5,
      variations: [
        ProductVariation(
          id: 1001,
          productId: 1,
          price: 295,
          quantity: 4,
          inStock: true,
          productVarientImages: ['assets/item1.jpg','assets/item2.jpg','assets/item3.jpg',],
          productPropertiesValues: [
            ProductPropertyAndValue(property: 'Color', value: '#000000'),


            ProductPropertyAndValue(property: 'Size', value: 'Small',),
            ProductPropertyAndValue(property: 'Size', value: 'Medium',),
            ProductPropertyAndValue(property: 'Size', value: 'Large',),


          ],
        ),
        ProductVariation(
          id: 1002,
          productId: 2,
          price: 295,
          quantity: 0,
          inStock: true,
          productVarientImages: ['assets/item4.jpg','assets/item5.jpg','assets/item6.jpg',],
          productPropertiesValues: [
            ProductPropertyAndValue(property: 'Color', value: '#FF0000'),
            ProductPropertyAndValue(property: 'Size', value: 'Small',),
            ProductPropertyAndValue(property: 'Size', value: 'Medium',),
            ProductPropertyAndValue(property: 'Size', value: 'Large',),


          ],
        ),
        ProductVariation(
          id: 1003,
          productId: 3,
          price: 295,
          quantity: 2,
          inStock: true,
          productVarientImages: ['assets/item7.jpg','assets/item8.jpg','assets/item9.jpg',],
          productPropertiesValues: [
            ProductPropertyAndValue(property: 'Color', value: '#FFFFFF'),
            ProductPropertyAndValue(property: 'Size', value: 'Small',),
            ProductPropertyAndValue(property: 'Size', value: 'Medium',),
            ProductPropertyAndValue(property: 'Size', value: 'Large',),

          ],
        ),

      ],
      availableProperties: [
        ProductProperty(name: 'Color', values: ['#000000',  '#FFFFFF']),
        ProductProperty(name: 'Size', values: ['Small',  'Large']),


      ],
    );
  }


}
