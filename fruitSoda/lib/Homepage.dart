import 'package:flutter/material.dart';

class WikiHomePage extends StatefulWidget {
  @override
  _WikiHomePageState createState() => _WikiHomePageState();
}

class _WikiHomePageState extends State<WikiHomePage> {
  // Nutrition information for each fruit (calories, sugar)
  final List<Map<String, dynamic>> fruits = [
    {
      'name': 'Watermelon',
      'description': '.',
      'image': 'assets/images/logo.png',
      'glass': 'assets/images/watermelon.png',
      'background': 'assets/images/watermelon_bg.png',
      'icon': "🍉",
      'color': Colors.red[100],
      'calories': '45',
      'sugar': '9g',
      'size': '330ml', // Added dynamic size
      'rating': '4.8/5', // Added dynamic rating
    },
    {
      'name': 'Pineapple',
      'description': '.',
      'image': 'assets/images/logo.png',
      'glass': 'assets/images/pineapple.png',
      'background': 'assets/images/pineapple_bg.png',
      'icon': '🍍',
      'color': Colors.yellow[100],
      'calories': '50',
      'sugar': '12g',
      'size': '500ml', // Different size
      'rating': '4.6/5', // Different rating
    },
    {
      'name': 'Strawberry',
      'description': '.',
      'image': 'assets/images/logo.png',
      'glass': 'assets/images/straw.png',
      'background': 'assets/images/strawberry_bg.png',
      'icon': '🍓',
      'color': Colors.pink[100],
      'calories': '40',
      'sugar': '10g',
      'size': '250ml',
      'rating': '4.9/5',
    },
    {
      'name': 'Mango',
      'description': '.',
      'image': 'assets/images/logo.png',
      'glass': 'assets/images/mango.png',
      'background': 'assets/images/mango_bg.png',
      'icon': '🥭',
      'color': Colors.orange[100],
      'calories': '55',
      'sugar': '13g',
      'size': '1L',
      'rating': '4.7/5',
    },
    {
      'name': 'Blueberry',
      'description': '.',
      'image': 'assets/images/logo.png',
      'glass': 'assets/images/blueberry.png',
      'background': 'assets/images/cyan1.png',
      'icon': '🫐',
      'color': Colors.blue[100],
      'calories': '42',
      'sugar': '11g',
      'size': '330ml',
      'rating': '4.5/5',
    },
    {
      'name': 'Lemon',
      'description': '.',
      'image': 'assets/images/logo.png',
      'glass': 'assets/images/lemon.png',
      'background': 'assets/images/lemon_bg.png',
      'icon': '🍋',
      'color': Colors.yellow[100],
      'calories': '38',
      'sugar': '8g',
      'size': '750ml',
      'rating': '4.2/5',
    },
    {
      'name': 'cherry',
      'description': '.',
      'image': 'assets/images/logo.png',
      'glass': 'assets/images/cherry.png',
      'background': 'assets/images/cherry_bg.png',
      'icon': '🍒',
      'color': Colors.yellow[100],
      'calories': '38',
      'sugar': '8g',
      'size': '750ml',
      'rating': '4.2/5',
    },
  ];

  int selectedIndex = 0;
  bool isProductsHovered = false;
  bool isWhereToBuyHovered = false;
  bool isAboutHovered = false;
  bool isContactHovered = false;

  @override
  Widget build(BuildContext context) {
    final selectedFruit = fruits[selectedIndex];

    return Scaffold(
      body: Stack(
        children: [
          // ==================== BACKGROUND SECTION ====================
          // Background image that changes with selection
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(selectedFruit['background']),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Semi-transparent overlay for better text readability
          Container(color: Colors.black.withOpacity(0.2)),

          // ==================== MAIN CONTENT SECTION ====================
          SafeArea(
            child: Row(
              children: [
                // 🍉 LEFT SIDE: PRODUCT INFO AND MAIN CONTENT
                Expanded(
                  flex: 11,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ==================== TOP NAVIGATION SECTION ====================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Custom Logo and Brand Name
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  'FRUIT SODA',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      221,
                                      255,
                                      255,
                                      255,
                                    ),
                                    fontSize: 18,
                                    fontFamily: 'anime',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),

                            // Navigation Menu
                            Row(
                              children: [
                                _buildNavButton(
                                  "Products",
                                  isProductsHovered,
                                  70,
                                ),
                                SizedBox(width: 15),
                                _buildNavButton(
                                  "Contact",
                                  isWhereToBuyHovered,
                                  100,
                                ),
                                SizedBox(width: 15),
                                _buildNavButton("About", isAboutHovered, 60),
                                SizedBox(width: 15),
                                _buildNavButton("Cart", isContactHovered, 70),
                                SizedBox(width: 15),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 80),

                        // ==================== GLASS + FRUIT NAME SECTION ====================
                        Center(
                          child: SizedBox(
                            height:
                                MediaQuery.of(context).size.height *
                                0.50, // enough space for both
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior:
                                  Clip.none, // prevents text from being cut off
                              children: [
                                // Fruit name text (on top, below glass)
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    selectedFruit['name'].toUpperCase(),
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                          0.12, // balanced size
                                      fontWeight: FontWeight.normal,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                      letterSpacing: 2.0,
                                      fontFamily: 'anime',
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: const Color.fromARGB(
                                            255,
                                            69,
                                            44,
                                            4,
                                          ).withOpacity(0.7),
                                          offset: Offset(2.0, 2.0),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                // Glass image (placed behind)
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    selectedFruit['glass'],
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.55,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // ==================== DESCRIPTION SECTION ====================
                        // Product description
                        Text(
                          selectedFruit['description'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            height: 3,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 5.0,
                                color: Colors.black,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),

                        SizedBox(height: 2),

                        // ==================== PRICE AND BUY BUTTON SECTION ====================
                        // Price and Buy Now button (centered)
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\$?.99',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(
                                    216,
                                    255,
                                    255,
                                    255,
                                  ),
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('BUY NOW'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    40,
                                    52,
                                    3,
                                    20,
                                  ),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 16,
                                  ),
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Spacer(),

                        // ==================== NUTRITION INFO SECTION ====================
                        // Nutrition information that changes with selection (calories, sugar)
                        // ==================== NUTRITION INFO SECTION ====================
                        // Nutrition information that changes with selection (calories, sugar, size, rating)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildInfoItem(
                              'Calories',
                              '${selectedFruit['calories']}',
                            ),
                            _buildInfoItem(
                              'Sugar',
                              '${selectedFruit['sugar']}',
                            ),
                            _buildInfoItem(
                              'Size',
                              '${selectedFruit['size']}', // Now dynamic
                            ),
                            _buildInfoItem(
                              'Rating',
                              '${selectedFruit['rating']}', // Now dynamic
                            ),
                          ],
                        ),

                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),

                // ==================== RIGHT SIDE: FRUIT SELECTION WHEEL ====================
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 80,
                      diameterRatio: 10, // Slightly more curve
                      perspective: 0.003, // Deeper 3D effect
                      offAxisFraction: -0.2,
                      squeeze: 1.2,
                      physics: BouncingScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          final fruit = fruits[index];
                          final isSelected = index == selectedIndex;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: TweenAnimationBuilder<double>(
                              tween: Tween<double>(
                                begin: 0.9,
                                end: isSelected ? 1.15 : 0.9,
                              ),
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeOutExpo,
                              builder: (context, scale, child) {
                                return Transform.scale(
                                  scale: scale,
                                  child: Opacity(
                                    opacity: isSelected ? 1.0 : 0.5,
                                    child: Text(
                                      fruit['icon'],
                                      style: TextStyle(
                                        fontSize: isSelected ? 36 : 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(2, 2),
                                            blurRadius: 4,
                                            color: Colors.black.withOpacity(
                                              0.4,
                                            ),
                                          ),
                                          Shadow(
                                            offset: Offset(-1, -1),
                                            blurRadius: 2,
                                            color: Colors.white.withOpacity(
                                              0.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        childCount: fruits.length,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== HELPER METHOD: NAVIGATION BUTTONS ====================
  // Builds navigation buttons with hover effects
  Widget _buildNavButton(String text, bool isHovered, double width) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        if (text == "Products") isProductsHovered = true;
        if (text == "Where to buy") isWhereToBuyHovered = true;
        if (text == "About") isAboutHovered = true;
        if (text == "Contact") isContactHovered = true;
      }),
      onExit: (_) => setState(() {
        if (text == "Products") isProductsHovered = false;
        if (text == "Where to buy") isWhereToBuyHovered = false;
        if (text == "About") isAboutHovered = false;
        if (text == "Contact") isContactHovered = false;
      }),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
            height: 2,
            width: isHovered ? width : 0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  // ==================== HELPER METHOD: NUTRITION INFO ITEMS ====================
  // Builds nutrition information items (calories, sugar, etc.)
  Widget _buildInfoItem(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
