import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oruphones/constants/app_images.dart';
import 'package:oruphones/constants/app_icons.dart';
import 'package:oruphones/widgets/custom_floating_action_button.dart';
import 'package:oruphones/widgets/homescreen_options_tiles.dart';
import '../constants/app_colors.dart';
import '../widgets/home_screen_bottom_tiles.dart';
import '../widgets/home_screen_crousel.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // primary: false,
      backgroundColor: AppColors.BGColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:
            IconButton(onPressed: () {}, icon: Image.asset(AppIcons.hamburger)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppImages.logo, height: 40, width: 61),
            SizedBox(
              width: 76,
            ),
            Text(
              "India",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 4,
            ),
            Image.asset(AppIcons.location)
          ],
        ),
        actions: [
          SizedBox(
            height: 33,
            width: 80,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    padding: EdgeInsets.zero,
                    backgroundColor: AppColors.homeScreenButtonColor,
                    elevation: 0),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
        floatingActionButton: CustomFloatingActionButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: SearchBar(
                  hintText: 'Search products or mobile models...',
                  hintStyle: WidgetStatePropertyAll(TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey.shade400,
                      fontSize: 12)),
                  leading: const Icon(
                    Icons.search,
                    color: Color(0xffF6C018),
                  ),
                  shape: WidgetStateProperty.all(
                      const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  elevation: WidgetStatePropertyAll(0),
                  backgroundColor: WidgetStatePropertyAll(AppColors.BGColor),
                  side:
                      WidgetStatePropertyAll(BorderSide(color: AppColors.grey)),
                  trailing: [
                    Row(
                      children: [
                        Text(
                          "|",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 20),
                        ),
                        Icon(
                          Icons.mic_none_sharp,
                          color: Colors.grey.shade500,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HomeScreenOptionsTiles(
                        onPressed: () {}, title: "Sell Your Phone"),
                    SizedBox(width: 10),
                    HomeScreenOptionsTiles(
                        onPressed: () {}, title: "Buy Used Phone"),
                    SizedBox(width: 10),
                    HomeScreenOptionsTiles(
                        onPressed: () {}, title: "Compare Prices"),
                    SizedBox(width: 10),
                    HomeScreenOptionsTiles(
                        onPressed: () {}, title: "My Profile"),
                    SizedBox(width: 10),
                    HomeScreenOptionsTiles(
                        onPressed: () {}, title: "My Listing"),
                    SizedBox(width: 10),
                    HomeScreenOptionsTiles(onPressed: () {}, title: "Services"),
                    SizedBox(width: 10),
                    HomeScreenOptionsTiles(
                        onPressed: () {}, title: "Register your Store"),
                    SizedBox(width: 10),
                    HomeScreenOptionsTiles(
                        onPressed: () {}, title: "Get the App"),
                    SizedBox(width: 10),
                    HomeScreenOptionsTiles(
                        onPressed: () {}, title: "Sell Your Phone"),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              HomeScreenCrousel(),
              SizedBox(
                height: 16,
              ),
              Text(
                "What's on your mind?",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 18),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HomeScreenBottomTiles(
                      image: AppImages.cart,
                      onPressed: () {},
                      text: 'Buy Used Phones',
                    ),
                    HomeScreenBottomTiles(
                      image: AppImages.price_tag,
                      onPressed: () {},
                      text: 'Sell Used Phones',
                    ),
                    HomeScreenBottomTiles(
                      image: AppImages.price_tags,
                      onPressed: () {},
                      text: 'Compare Prices',
                    ),
                    HomeScreenBottomTiles(
                      image: AppImages.profile,
                      onPressed: () {},
                      text: 'My Profile',
                    ),
                    HomeScreenBottomTiles(
                      image: AppImages.docs,
                      onPressed: () {},
                      text: 'My Listings',
                    ),
                    HomeScreenBottomTiles(
                      image: AppImages.store,
                      onPressed: () {},
                      text: 'Open Store',
                    ),
                    HomeScreenBottomTiles(
                      image: AppImages.settings,
                      onPressed: () {},
                      text: 'Services',
                    ),
                    HomeScreenBottomTiles(
                      image: AppImages.health,
                      onPressed: () {},
                      text: 'Device Health Check',
                    ),
                    HomeScreenBottomTiles(
                      image: AppImages.battery,
                      onPressed: () {},
                      text: 'Battery Health Check',
                    ),
                    HomeScreenBottomTiles(
                      image: AppImages.sim,
                      onPressed: () {},
                      text: 'IMEI Verification',
                    ),
                    HomeScreenBottomTiles(
                      image: AppImages.phone,
                      onPressed: () {},
                      text: 'IMEI Verification',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Brands',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                    iconSize: 20,
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.apple,
                      width: 70,
                    ),
                    Image.asset(
                      AppImages.mi,
                      width: 70,
                    ),
                    Image.asset(
                      AppImages.samsung,
                      width: 70,
                    ),
                    Image.asset(
                      AppImages.vivo,
                      width: 70,
                    ),
                    Image.asset(
                      AppImages.realme,
                      width: 70,
                    ),
                    Image.asset(
                      AppImages.motorola,
                      width: 70,
                    ),
                    Image.asset(
                      AppImages.oppo,
                      width: 70,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF2F2F2),
                      ),
                      height: 64,
                      width: 64,
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "View all",
                                style: GoogleFonts.poppins(
                                    fontSize: 8, fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 8,
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 42,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best deals in india',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Sell')),
                  TextButton(onPressed: () {}, child: const Text('Videos')),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54JF-ZsH-Lw-izwZ-tGhuBqZ-YMOA4j-D3w&usqp=CAU',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Apple iPhone 13 Pro',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text('12 GB RAM - 256 GB ROM'),
                              Text('\u{20B9} 41,500'),
                              Row(
                                children: [
                                  Text('Yesterday in Mumbai'),
                                  Icon(Icons.location_on,
                                      size: 16, color: Colors.green),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Text(
                'Frequently Asked Questions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ExpansionTile(
                title:
                    const Text('Why should you buy used phones on OnlPhones?'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Buying used phones can be a great way to save money while still getting a high-quality device. OnlPhones offers a wide selection of used phones, so you can find the perfect one for your needs.'),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('How to sell phone on OnlPhones?'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Selling your phone on OnlPhones is easy! Just create a listing, set your price, and wait for buyers to contact you.'),
                  ),
                ],
              ),
              Container(
                color: Colors.yellow[700],
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                          'Get Notified About Our Latest Offers and Price Drops',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: null,
                        child: Text('Search'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Download App',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.qr_code),
                              Text(''),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.qr_code),
                              Text(''),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Invite a Friend',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.android),
                          Icon(Icons.apple),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Go Share',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.facebook),
                          Icon(Icons.share),
                          Icon(Icons.sms),
                          Icon(Icons.whatshot),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(String label, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(iconData),
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey[200],
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandButton(String brandName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(brandName),
      ),
    );
  }
}
