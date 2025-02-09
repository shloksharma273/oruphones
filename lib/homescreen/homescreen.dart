import 'package:flutter/material.dart';

void main() {
  runApp(const Homescreen());
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eru App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'eru',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Login',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40,
                child: SearchBar(
                  hintText: 'Search products or mobile models...',
                  leading: const Icon(Icons.search),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sell old phone Privacy'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Buy used phone Privacy'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Compare Phones'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('My Profile'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('App Ratings'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Advertise'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Register your store'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Get App Privacy'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get Your Old Phone',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Nearby',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sell Now'),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "What's on your mind?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildIconButton('Buy used phone', Icons.phone_android),
                  _buildIconButton('Sell used phone', Icons.sell),
                  _buildIconButton('Compare Phones', Icons.compare),
                  _buildIconButton('My Profile', Icons.person),
                  _buildIconButton('My Listings', Icons.list),
                  _buildIconButton('Store Nearby', Icons.store),
                  _buildIconButton('Service Health Check', Icons.health_and_safety),
                  _buildIconButton('Battery Health Check',
                      Icons.battery_charging_full),
                  _buildIconButton('User Notification', Icons.notifications),
                  _buildIconButton('Invite', Icons.person_add),
                  _buildIconButton('Lucky Draw', Icons.card_giftcard),
                  _buildIconButton('Order Priority', Icons.priority_high),
                  _buildIconButton('Promotion', Icons.campaign),
                  _buildIconButton('Use Reman', Icons.restore),
                  _buildIconButton('Certified Phones', Icons.verified),
                  _buildIconButton('My Negotiation', Icons.gavel),
                  _buildIconButton('My Favorites', Icons.favorite),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Brands',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Sell >',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildBrandButton('Apple'),
                  _buildBrandButton('MI'),
                  _buildBrandButton('Oneplus'),
                  _buildBrandButton('Vivo'),
                  _buildBrandButton('Motorola'),
                  _buildBrandButton('Samsung'),
                  _buildBrandButton('Sign Up'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best deals in india',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Frequently Asked Questions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ExpansionTile(
              title: const Text('Why should you buy used phones on OnlPhones?'),
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
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.facebook),
                        Icon(Icons.share),
                        Icon(Icons.sms),
                        Icon(Icons.text_decrease),
                      ],
                    ),
                  ],
                ),
              ),
            )
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
