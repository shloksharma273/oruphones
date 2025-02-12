import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oruphones/constants/app_images.dart';
import 'package:oruphones/constants/app_icons.dart';
import 'package:oruphones/homescreen_widgets/custom_appbar.dart';
import 'package:oruphones/widgets/custom_floating_action_button.dart';
import 'package:oruphones/widgets/homescreen_options_tiles.dart';
import '../constants/app_colors.dart';
import '../widgets/home_screen_bottom_tiles.dart';
import '../widgets/home_screen_crousel.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // primary: false,
      backgroundColor: AppColors.BGColor,
      appBar: CustomAppbar(),
      floatingActionButton: CustomFloatingActionButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HomeScreenOptionsTiles(
                            onPressed: () {}, title: "Sell Your Phone"),
                        SizedBox(width: 10),
                        HomeScreenOptionsTiles(onPressed: () {}, title: "Sort"),
                        SizedBox(width: 10),
                        HomeScreenOptionsTiles(onPressed: () {}, title: "Filters"),
                        SizedBox(width: 10),
                        HomeScreenOptionsTiles(
                            onPressed: () {}, title: "Nearby Deals"),
                        SizedBox(width: 10),
                        HomeScreenOptionsTiles(
                            onPressed: () {}, title: "Deals In 250 Km"),
                        SizedBox(width: 10),
                        HomeScreenOptionsTiles(
                            onPressed: () {}, title: "Verified Deals"),
                        SizedBox(width: 10),
                        HomeScreenOptionsTiles(
                            onPressed: () {}, title: "Deals in 50 Km"),
                        SizedBox(width: 10),
                        HomeScreenOptionsTiles(onPressed: () {}, title: "Apple"),
                        SizedBox(width: 10),
                        HomeScreenOptionsTiles(onPressed: () {}, title: "Samsung"),
                        SizedBox(width: 10),
                        HomeScreenOptionsTiles(
                            onPressed: () {}, title: "Under Warranty"),
                        SizedBox(width: 10),
                        HomeScreenOptionsTiles(onPressed: () {}, title: "Like New"),
                        SizedBox(width: 10),
                        HomeScreenOptionsTiles(
                            onPressed: () {}, title: "Refurbished Phones"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two columns
                      childAspectRatio: 0.55, // Adjust this ratio as needed
                      crossAxisSpacing: 0.1, // Horizontal spacing between cards
                      mainAxisSpacing: 0.1, // Vertical spacing between cards
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard();
                    },
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Frequently Asked Questions',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 10,),
                  // FaqTiles(),
                  ExpansionTile(
                    title: Text('Why should you buy used phones on ORUPhones?', style: GoogleFonts.poppins(color: Colors.black)),
                    backgroundColor: Colors.white,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Buying used phones can be a great way to save money while still getting a high-quality device. OnlPhones offers a wide selection of used phones, so you can find the perfect one for your needs.', style: GoogleFonts.poppins(color: Colors.black)),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('How to sell phone on OruPhones?',style: GoogleFonts.poppins(color: Colors.black)),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "You can sell used phones online through ORUphones in 3 easy steps \n \n Step 1: Add your Device \n Click on the Sell Now button available at the top right corner of the ORUphones homepage, select your location, enter the mobile details on the listing page, and enter your expected price for the device. \n \n Step 2: Device Verification \nAfter listing your device, we recommend you verify your device to sell it quickly. To verify your device, download the ORUphones app on the device you want to sell. Follow the simple instructions in the app & perform diagnostics to complete the verification process. After verification, a verified badge will be displayed along with your listing. \n \n Step 3: Get Cash \nYou will start receiving offers for your listing. If the offer is right, you can arrange a meet-up with the buyer at a secure location. The buyer will go through a buyer verification process on the ORUphones app & if satisfied you can conclude the deal and get instant payment from the buyer directly.", style: GoogleFonts.poppins(color: Colors.black),),
                      ),
                    ],
                  ),

                ],
              ),
            ),

            Container(
              color: Colors.yellow[700],
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Notified About Our\n Latest Offers and Price Drops',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 20, // Adjusted size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your email here',
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(width: 1),
                        ElevatedButton(
                          onPressed: () {
                            // Handle send action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          child: const Text(
                            'Send',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 800,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Download App',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center, // Center alignment
                          children: [
                            Image.asset(AppImages.pplaystoreQR),
                            const SizedBox(width: 10),
                            Image.asset(AppImages.appleQR),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Invite a Friend',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(AppImages.footer),
                    const SizedBox(height: 10), // Add spacing
                    Column(
                      children: [
                        Text(
                          'Or Share',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10), // Ensure spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, // Center alignment
                          children: [
                            Image.asset(AppImages.instagram),
                            const SizedBox(width: 20),
                            Image.asset(AppImages.telegram),
                            const SizedBox(width: 20),
                            Image.asset(AppImages.x),
                            const SizedBox(width: 20),
                            Image.asset(AppImages.whatsapp),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),




          ],
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
