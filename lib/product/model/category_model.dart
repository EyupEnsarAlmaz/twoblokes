import 'package:twoblokes/product/model/subcategory_model.dart';

class Category {
  final String name;
  final List<SubCategory> subCategories;

  Category({
    required this.name,
    required this.subCategories,
  });
}
