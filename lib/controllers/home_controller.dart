import 'package:get/get.dart';
import '../model/home_model.dart';
import '../services/api_service.dart';

class HomeController extends GetxController {
  final ApiService apiService = ApiService();

  Rxn<HomeResponse> homeResponse = Rxn<HomeResponse>();

  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var isLiveStreamVisible = true.obs;

  var selectedCategoryId = 1.obs;
  var selectedCategorySlug = 'for-you'.obs;
  void selectCategory(Category category) {
    selectedCategoryId.value = category.id;
    selectedCategorySlug.value = category.slug;
  }

  var searchQuery = ''.obs;
  var isSearchActive = false.obs;
  void updateSearch(String value) {
    searchQuery.value = value;
  }
  void clearSearch() {
    searchQuery.value = '';
  }

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await apiService.getHomeData();

      homeResponse.value = response;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  List<SuggestedProduct> get filteredProducts {
    final products =
        homeResponse.value?.data.suggestedForYou ?? [];

    if (searchQuery.value.isEmpty) {
      return products;
    }

    return products.where((product) {
      final query = searchQuery.value.toLowerCase();

      return product.name.toLowerCase().contains(query) ||
          product.brand.toLowerCase().contains(query);
    }).toList();
  }
}
