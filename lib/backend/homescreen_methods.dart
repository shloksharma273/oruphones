import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreenMethods {
  static final HomeScreenMethods _instance = HomeScreenMethods._internal();
  factory HomeScreenMethods() => _instance;
  HomeScreenMethods._internal();

  /// Fetch FAQs (GET request to /faq)
  Future<dynamic> fetchFaqs() async {
    final String url = "http://40.90.224.241:5000/faq";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Assuming the response is JSON.
        return jsonDecode(response.body);
      } else {
        print("Failed to fetch FAQs: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching FAQs: $e");
      return null;
    }
  }

  /// Fetch Products (POST request to /filter)
  /// [filter] is a Map containing filter options. For example:
  /// {
  ///   "filter": {
  ///     "condition": ["Like New", "Fair"],
  ///     "make": ["Samsung"],
  ///     "storage": ["16 GB", "32 GB"],
  ///     "ram": ["4 GB"],
  ///     "warranty": ["Brand Warranty", "Seller Warranty"],
  ///     "priceRange": [40000, 175000],
  ///     "verified": true,
  ///     "sort": {},
  ///     "page": 1
  ///   }
  /// }
  Future<dynamic> fetchProducts(Map<String, dynamic> filter) async {
    final String url = "http://40.90.224.241:5000/filter";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(filter),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Failed to fetch products: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching products: $e");
      return null;
    }
  }

  /// Like/Unlike a Product (POST request to /favs)
  /// [listingId] is the ID of the product listing.
  /// [isFav] indicates whether to mark as favorite (true) or remove from favorites (false).
  /// [csrfToken] must be provided in the header.
  Future<bool> likeProduct(String listingId, bool isFav, String csrfToken) async {
    final String url = "http://40.90.224.241:5000/favs";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "X-Csrf-Token": csrfToken,
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "listingId": listingId,
          "isFav": isFav,
        }),
      );
      if (response.statusCode == 200) {
        print("Product like/unlike action successful.");
        return true;
      } else {
        print("Failed to like product: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error liking product: $e");
      return false;
    }
  }

  /// Fetch Brands (GET request to /makeWithImages)
  Future<dynamic> fetchBrands() async {
    final String url = "http://40.90.224.241:5000/makeWithImages";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Failed to fetch brands: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching brands: $e");
      return null;
    }
  }

  /// Fetch Filters (GET request to /showSearchFilters)
  Future<dynamic> fetchFilters() async {
    final String url = "http://40.90.224.241:5000/showSearchFilters";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Failed to fetch filters: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching filters: $e");
      return null;
    }
  }
}
