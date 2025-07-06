import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'utils/performance_monitor.dart';
import 'utils/memory_optimizer.dart';

// Screens
import 'screens/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/food/food_screen.dart';
import 'screens/exercise/exercise_screen.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/more/more_screen.dart';
import 'screens/calendar/calendar_screen.dart';
import 'screens/health/health_assessment_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/community/community_screen.dart';

// Providers
import 'providers/auth_provider.dart';
import 'providers/health_provider.dart';
import 'providers/exercise_provider.dart';
import 'providers/nutrition_provider.dart';
import 'providers/theme_provider.dart';

// Constants
import 'constants/app_theme.dart';
import 'l10n/app_localizations.dart';

// Widgets
import 'widgets/animated_bottom_navigation.dart';
import 'widgets/simple_app_bar.dart';

void main() {
  // Initialize performance optimizations
  WidgetsFlutterBinding.ensureInitialized();

  // Enable performance monitoring in debug mode
  PerformanceMonitor.setEnabled(kDebugMode);

  // Enable memory optimization
  MemoryOptimizer.setEnabled(true);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.updateSystemTheme(
      WidgetsBinding.instance.platformDispatcher.platformBrightness,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HealthProvider()),
        ChangeNotifierProvider(create: (_) => ExerciseProvider()),
        ChangeNotifierProvider(create: (_) => NutritionProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'DOPYJO',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode == AppThemeMode.system
                ? ThemeMode.system
                : themeProvider.themeMode == AppThemeMode.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            locale: const Locale('en', 'US'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            initialRoute: '/main',
            routes: {
              '/splash': (context) => const SplashScreen(),
              '/login': (context) => const LoginScreen(),
              '/register': (context) => const RegisterScreen(),
              '/main': (context) => const MainNavigation(),
              '/dashboard': (context) => const DashboardScreen(),
              '/food': (context) => const FoodScreen(),
              '/exercise': (context) => const ExerciseScreen(),
              '/chat': (context) => const ChatScreen(),
              '/more': (context) => const MoreScreen(),
              '/calendar': (context) => const CalendarScreen(),
              '/health-assessment': (context) => const HealthAssessmentScreen(),
              '/profile': (context) => const ProfileScreen(),
              '/community': (context) => const CommunityScreen(),
            },
          );
        },
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // Cache screens to prevent rebuilding
  static const List<Widget> _screens = [
    DashboardScreen(),
    FoodScreen(),
    ExerciseScreen(),
    ChatScreen(),
    MoreScreen(),
  ];

  // Navigation items
  static const List<BottomNavigationItem> _navigationItems = [
    BottomNavigationItem(icon: Icons.dashboard, label: 'Dashboard'),
    BottomNavigationItem(icon: Icons.restaurant, label: 'Food'),
    BottomNavigationItem(icon: Icons.fitness_center, label: 'Exercise'),
    BottomNavigationItem(icon: Icons.chat, label: 'Chat'),
    BottomNavigationItem(icon: Icons.more_horiz, label: 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(),
      body: _screens[_currentIndex],
      bottomNavigationBar: AnimatedBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _navigationItems,
      ),
    );
  }
}
