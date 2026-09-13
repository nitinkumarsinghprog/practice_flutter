import 'package:practice_flutter/models/product_model.dart';
import 'package:practice_flutter/services/api_service.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getProducts();
}

class ProductRepository implements IProductRepository {
  final ApiService apiService;

  ProductRepository(this.apiService);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await apiService.get("https://dummyjson.com/products");

    final List<ProductModel> products = (response.data["products"] as List)
        .map((product) => ProductModel.fromJson(product))
        .toList();

    return products;
  }
}
