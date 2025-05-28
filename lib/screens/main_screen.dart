import 'package:flutter/material.dart';
import '../theme.dart'; // For AppTheme colors

// Import other screen files that are part of the BottomNavigationBar
import 'home_screen.dart';
import 'learn_screen.dart';
import 'review_screen.dart';
import 'community_screen.dart';
import 'profile_screen.dart';

// Main Screen with Navigation
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    const HomeScreen(),
    const LearnScreen(),
    const ReviewScreen(),
    const CommunityScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Consider using AppTheme.cardColor or similar for theming
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.primaryBlue,
          unselectedItemColor: AppTheme.textSecondary,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined),
              activeIcon: Icon(Icons.school),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.refresh_outlined),
              activeIcon: Icon(Icons.refresh),
              label: 'Review',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              activeIcon: Icon(Icons.people),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// Custom App Drawer
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // User Profile Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.primaryBlue, AppTheme.primaryBlue.withOpacity(0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'John Doe', // This should ideally come from a provider
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Level 5 • 1,250 XP', // This should ideally come from a provider
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Navigation Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildDrawerItem(context, Icons.home, 'Home', () {
                    // Example: Navigate or close drawer
                    Navigator.pop(context); 
                    // Potentially navigate to home if not already there,
                    // or use a callback to MainScreen to switch tab.
                  }),
                  _buildDrawerItem(context, Icons.school, 'Learn', () {Navigator.pop(context);}),
                  _buildDrawerItem(context, Icons.refresh, 'Review', () {Navigator.pop(context);}),
                  _buildDrawerItem(context, Icons.people, 'Community', () {Navigator.pop(context);}),
                  _buildDrawerItem(context, Icons.person, 'Profile', () {Navigator.pop(context);}),
                  _buildDrawerItem(context, Icons.leaderboard, 'Leaderboard', () {Navigator.pop(context);}),
                  _buildDrawerItem(context, Icons.store, 'Store', () {Navigator.pop(context);}),
                  const Divider(),
                  _buildDrawerItem(context, Icons.settings, 'Settings', () {Navigator.pop(context);}),
                  _buildDrawerItem(context, Icons.help, 'Help & Support', () {Navigator.pop(context);}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.textPrimary), // Use theme color
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.textPrimary)), // Use theme text style
      onTap: onTap,
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}
