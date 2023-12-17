import 'features/domain/models/product_model.dart';
// to check Stock Availability
bool isStockAvailable(String selectedColor, String selectedSize, List<ProductProperty> availableProperties) {
  return availableProperties.any((property) {
    if (property.name == 'Color' && property.values.contains(selectedColor)) {
      return availableProperties.any((property) {
        return property.name == 'Size' && property.values.contains(selectedSize);
      });
    }
    return false;
  });
}

