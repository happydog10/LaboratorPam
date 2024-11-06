import 'package:flutter/material.dart';

void main() {
  runApp(WineApp());
}

class WineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WineHomePage(),
    );
  }
}

class WineHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              _buildCategoryFilters(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Wine', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('view all', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              _buildWineList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Icon(Icons.location_on, color: Colors.grey),
          SizedBox(width: 8),
          Text('Donnerville Drive ▼', style: TextStyle(color: Colors.black)),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Icon(Icons.shopping_cart, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for wines...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return Container(
      width: 450,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCategoryChip('Red wines', './assets/images/red.jpg'),
            _buildCategoryChip('White wines', './assets/images/white.jpg'),
            _buildCategoryChip('Demisec wines', './assets/images/demisec.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, String imageUrl) {
    return Column(
      children: [
        Image.asset(imageUrl, height: 50, width: 50),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildWineList() {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildWineCard(
          'Ocone Bozzovich Beneventano Bianco IGT',
          'Red wine (Green and Flinty)',
          '₹ 23,256,596',
          'Available',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT72ubhWhe0Gowjkj9e3NeczWPwxiAGw50PTQ&s',
          Colors.red[100]!,
        ),
        _buildWineCard(
          '2021 Petit Chablis - Passy Le Clou',
          'White wine (Green and Flinty)',
          '₹ 23,256,596',
          'Available',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRrORRabUAk5NhqpdkERyVdDK-oqlfbHGheA&s',
          Colors.green[100]!,
        ),
        _buildWineCard(
          'Philippe Fontaine Champagne Brut Rosé',
          'Sparkling wine (Green and Flinty)',
          '₹ 23,256,596',
          'Unavailable',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5kJQGPC24RwC2VbKyMwheTh-T8qSLsc4UzQ&s',
          Colors.orange[100]!,
        ),
        _buildWineCard(
          '2021 Cicada\'s Song Rosé',
          'Rose wine (Green and Flinty)',
          '₹ 23,256,596',
          'Available',
          'https://southern-napa-fine-wine-house.myshopify.com/cdn/shop/products/grassroots-wine-cicada-s-song-rose-28023400202303_600x.png?v=1616451553',
          Colors.blue[100]!,
        ),
      ],
    );
  }
  Widget _buildWineCard(String name, String type, String price, String availability, String imageUrl, Color cardColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the top
            children: [
              // Wrap the image in a SizedBox with a fixed width to prevent overflow
              SizedBox(
                width: 100, // Ensure the width is fixed
                child: Image.network(imageUrl, height: 100, fit: BoxFit.cover),
              ),
              SizedBox(width: 16),
              // Wrap the content in Expanded to ensure it doesn't overflow
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(type),
                    SizedBox(height: 8),
                    Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      availability,
                      style: TextStyle(color: availability == 'Available' ? Colors.green : Colors.red),
                    ),
                  ],
                ),
              ),
              // Align IconButton to the top of the card and constrain its width
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.red,
      onTap: (index) {},
    );
  }
}
