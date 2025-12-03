import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit/homepage.dart';
import 'login.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // Firebase will emit events when user logs in/out
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While Firebase checks auth status
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Colors.pinkAccent),
            ),
          );
        }

        if (snapshot.hasData) {
          // ✅ User is logged in → go to HomePage
          return WikiHomePage();
        }

        // ❌ User NOT logged in → show landing screen
        return _LandingScreen();
      },
    );
  }
}

// 🎨 Your original landing screen
class _LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mix.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Main content
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(23, 4, 4, 4),
            title: const Text(
              'Fruit Carousel',
              style: TextStyle(
                fontFamily: 'anime',
                fontSize: 24,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.login, color: Colors.white),
                tooltip: 'Sign In',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
          body: Stack(
            children: [
              // Tilted fruit images
              Positioned(
                top: -500,
                left: -200,
                child: Transform.rotate(
                  angle: -0.3,
                  child: Image.asset(
                    'assets/images/strawberry.png',
                    width: 600,
                  ),
                ),
              ),
              Positioned(
                bottom: -180,
                right: -310,
                child: Transform.rotate(
                  angle: 0.2,
                  child: Image.asset(
                    'assets/images/watermelon.png',
                    width: 520,
                  ),
                ),
              ),

              // Center content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo with orbiting dot
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.6),
                                width: 2,
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/logo.png',
                            width: 100,
                            color: Colors.white,
                          ),
                          _OrbitingDot(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Headline
                    Text(
                      'Refresh Your Day with Fruit Soda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'anime',
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: const Offset(2, 2),
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Tagline
                    const Text(
                      'Bursting with fruity flavors, fizz, and fun!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(179, 255, 255, 255),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // CTA Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(
                              milliseconds: 600,
                            ),
                            pageBuilder: (_, __, ___) => WikiHomePage(),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 18,
                        ),
                        backgroundColor: const Color.fromARGB(
                          69,
                          255,
                          255,
                          255,
                        ),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        elevation: 10,
                        shadowColor: const Color.fromARGB(
                          255,
                          255,
                          0,
                          85,
                        ).withOpacity(0.5),
                      ),
                      child: const Text("🍓 Explore Flavors"),
                    ),

                    const SizedBox(height: 40),

                    // Fruit icons row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFruitIcon("🍉"),
                        _buildFruitIcon("🍍"),
                        _buildFruitIcon("🍓"),
                        _buildFruitIcon("🥭"),
                        _buildFruitIcon("🫐"),
                        _buildFruitIcon("🍋"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Fruit icon builder
  Widget _buildFruitIcon(String fruit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: Text(fruit, style: const TextStyle(fontSize: 30)),
      ),
    );
  }
}

// Orbiting dot widget
class _OrbitingDot extends StatefulWidget {
  @override
  State<_OrbitingDot> createState() => _OrbitingDotState();
}

class _OrbitingDotState extends State<_OrbitingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.pinkAccent.withOpacity(0.6),
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
