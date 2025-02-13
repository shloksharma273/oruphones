import 'package:flutter/material.dart';
import 'package:oruphones/backend/authentication_methods.dart';
import '../backend/homescreen_methods.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  dynamic faqs;
  dynamic products;
  dynamic brands;
  dynamic filters;
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  @override
  void initState() {
    super.initState();
    _loadHomeData();
  }

  Future<void> _loadHomeData() async {
    // Fetch FAQs
    final fetchedFaqs = await HomeScreenMethods().fetchFaqs();
    // Example filter map for products (you can update this as needed)
    final filter = {
      "filter": {
        "condition": ["Like New", "Fair"],
        "make": ["Samsung"],
        "storage": ["16 GB", "32 GB"],
        "ram": ["4 GB"],
        "warranty": ["Brand Warranty", "Seller Warranty"],
        "priceRange": [40000, 175000],
        "verified": true,
        "sort": {},
        "page": 1
      }
    };
    final fetchedProducts = await HomeScreenMethods().fetchProducts(filter);
    final fetchedBrands = await HomeScreenMethods().fetchBrands();
    final fetchedFilters = await HomeScreenMethods().fetchFilters();

    setState(() {
      faqs = fetchedFaqs;
      products = fetchedProducts;
      brands = fetchedBrands;
      filters = fetchedFilters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () async {
              // Example of liking a product.
              // Replace 'listingId' and 'csrfToken' with actual values.
              Map<String, dynamic>? userData = await authenticationMethods.loadUserData();
              print("User data before update: $userData");

              // Extract CSRF token from the stored user data
              String csrfToken = userData!['csrfToken'];
              bool result = await HomeScreenMethods().likeProduct(
                "example_listing_id",
                true,
                csrfToken,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(result ? "Action successful!" : "Action failed!")),
              );
            },
            child: const Text("Like Product"),
          ),
          // Display fetched FAQs, Products, Brands, or Filters as needed.
          // This is just an example.
          Text("FAQs: ${faqs ?? 'Loading...'}"),
          Text("Products: ${products ?? 'Loading...'}"),
          Text("Brands: ${brands ?? 'Loading...'}"),
          Text("Filters: ${filters ?? 'Loading...'}"),
        ],
      ),
    );
  }
}
