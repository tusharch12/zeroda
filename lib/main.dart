import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zeroda/providers/bottomNavigationPro.dart';
import 'package:zeroda/screens/orders/orders_screen.dart';
import 'package:zeroda/screens/watchlist/watchlist_screen.dart';

import 'screens/bids_screen.dart';
import 'screens/portofolio/portfolio_screen.dart';
import 'screens/profile_screen.dart';

void main() {
   runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider); // Watch the provider

    // List of screens to navigate
    final screens = const [
      WatchList(),
      Orders(),
      Portfolio(),
      Profile(),
    ];

    return Scaffold(
      body: screens[currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // fixedColor:Colors.black ,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(color: Colors.blue), // Set selected label color to blue
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        currentIndex: currentIndex, 
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index; // Update the provider state
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border_outlined), label: 'Watchlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined,), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.badge_outlined,), label: 'Portfolio'),
          BottomNavigationBarItem(icon: Icon(Icons.person,), label: 'Profile'),
        ],
      ),
    );
  }
}

