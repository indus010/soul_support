import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'pages/schedule_session_page.dart';
import 'pages/assesment_page.dart';
import 'pages/expert_connect_page.dart';
import 'pages/meditation_page.dart';

void main() {
  runApp(const SoulSupportApp());
}

class SoulSupportApp extends StatelessWidget {
  const SoulSupportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soul Support',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: _Palette.primary,
        scaffoldBackgroundColor: _Palette.bg,
        appBarTheme: const AppBarTheme(
          backgroundColor: _Palette.primary,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: _Palette.text)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: _Palette.primary,
        ),
      ),
      routes: {
        '/': (_) => const SplashScreen(),
        '/onboarding': (_) => const OnboardingPage(),
        '/dashboard': (_) => const DashboardPage(),
        '/profile': (_) => const ProfilePage(),
        '/about': (_) => const AboutPage(),
        '/terms': (_) => const TermsPage(),
        '/privacy': (_) => const PrivacyPage(),
        '/contact': (_) => ContactPage(),
        '/history': (_) => const HistoryCenterPage(),
        '/schedule': (_) => const ScheduleSessionPage(),
        '/assessment': (_) => const AIAssessmentPage(),
        '/expert-connect': (_) => const ExpertConnectPage(),
        '/meditation': (_) => const MeditationPage(),
      },
      initialRoute: '/',
    );
  }
}

/* ---------- Palette ---------- */
class _Palette {
  static const primary = Color(
    0xFF8B5FBF,
  ); // Calm lavender - promotes tranquility
  static const accent = Color(0xFF4AC6B7); // Soft teal - mental clarity
  static const bg = Color(0xFFFDFBFF); // Serene white background
  static const cardBg = Color(0xFFFFFFFF); // Pure white for readability
  static const text = Color(0xFF1A1B41); // Deep indigo - gentle contrast
  static const subtext = Color(0xFF6B6B8E); // Muted purple - secondary info
  static const soft = Color(0xFFF0EBFF); // Light lavender - gentle highlighting
  static const border = Color(0xFFF5F3FF); // Barely purple - subtle dividers
}

/* ---------- 1. SPLASH SCREEN ---------- */
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();

    // Navigate to onboarding after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8B5FBF), // Calm lavender
              Color(0xFF4AC6B7), // Soft teal
            ],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(
                          'assets/images/img.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Soul Support',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Because every mind deserves peace.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* ---------- 2. ONBOARDING PAGE ---------- */
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _slides = [
    {
      'title': 'Understand Your Emotions',
      'subtitle': 'Track your mood and reflect each day.',
      'icon': 'sentiment_satisfied_alt',
    },
    {
      'title': 'Connect Confidentially',
      'subtitle': 'Chat with verified counsellors anytime.',
      'icon': 'verified_user',
    },
    {
      'title': 'Grow Mindfully',
      'subtitle': 'Relax, journal, and recharge your soul.',
      'icon': 'self_improvement',
    },
  ];

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'sentiment_satisfied_alt':
        return Icons.sentiment_satisfied_alt;
      case 'verified_user':
        return Icons.verified_user;
      case 'self_improvement':
        return Icons.self_improvement;
      default:
        return Icons.favorite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFEDEBFF), Color(0xFFFBFAFF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _slides.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 20.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: _Palette.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _getIcon(_slides[index]['icon']!),
                              size: 60,
                              color: _Palette.primary,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            _slides[index]['title']!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: _Palette.text,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _slides[index]['subtitle']!,
                            style: const TextStyle(
                              fontSize: 15,
                              color: _Palette.subtext,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _slides.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? _Palette.primary
                          : _Palette.primary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _slides.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _Palette.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      _currentPage < _slides.length - 1
                          ? 'Next'
                          : 'Get Started',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

/* ---------- Dashboard Page ---------- */
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double _moodValue = 3; // 1-5
  int _walletMinutes = 45; // mock talk-time in minutes
  final String _username = 'Adi';

  Map<String, dynamic> profile = {
    'name': 'Adi',
    'email': '',
    'phone': '',
    'age': null,
    'gender': '',
    'preferences': '',
  };

  int calculateProfileCompletion() {
    int total = profile.keys.length;
    int filled = profile.values.where((v) {
      if (v == null) return false;
      if (v is String && v.trim().isEmpty) return false;
      return true;
    }).length;
    return ((filled / total) * 100).round();
  }

  Future<void> _openProfile() async {
    final updated = await Navigator.pushNamed(
      context,
      '/profile',
      arguments: profile,
    );
    if (updated is Map<String, dynamic>) {
      setState(() {
        profile = updated;
      });
    } else {
      setState(() {}); // refresh to update avatar/name shown in profile header
    }
  }

  void _openWallet() {
    showModalBottomSheet(
      context: context,
      builder: (_) => WalletSheet(
        minutes: _walletMinutes,
        onRecharge: (int add) {
          setState(() {
            _walletMinutes += add;
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  void _openChatbot() {
    if (_walletMinutes <= 0) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Low Talk-time'),
          content: const Text(
            "You're running low on talk-time. Recharge to continue sessions.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _openWallet();
              },
              child: const Text('Recharge'),
            ),
          ],
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ChatWithCounsellorPage()),
    );
  }

  String moodEmoji(double v) {
    final int val = v.round();
    const map = {1: '😢', 2: '😞', 3: '😐', 4: '🙂', 5: '😄'};
    return map[val] ?? '🙂';
  }

  @override
  Widget build(BuildContext context) {
    int profileCompletion = calculateProfileCompletion();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        titleSpacing: 0.0,
        title: const Text(
          'Soul Support',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Color.fromARGB(255, 79, 228, 33),
                ),
                if (_walletMinutes > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor: const Color.fromARGB(255, 240, 104, 13),
                      child: Text(
                        '${(_walletMinutes ~/ 10)}',
                        style: const TextStyle(
                          fontSize: 8,
                          color: Color.fromARGB(255, 230, 216, 216),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: _openWallet,
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 244, 16, 244),
              child: Text(
                _username.isNotEmpty ? _username[0].toUpperCase() : 'U',
              ),
            ),
            onPressed: _openProfile,
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: _buildDrawer(profileCompletion),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth > 600 ? screenWidth * 0.1 : 16,
                    vertical: 14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back, $_username! 🌞',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _Palette.text,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'How are you feeling today?',
                        style: TextStyle(color: _Palette.text),
                      ),
                      const SizedBox(height: 12),

                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: List.generate(5, (i) {
                                  final idx = i + 1;
                                  final colors = [
                                    [
                                      Color(0xFFFEE3E2),
                                      Color(0xFFFFB7B6),
                                    ], // Sad
                                    [
                                      Color(0xFFE8EAF2),
                                      Color(0xFFCED3E5),
                                    ], // Unhappy
                                    [
                                      Color(0xFFF5F3FF),
                                      Color(0xFFE9E5FF),
                                    ], // Neutral
                                    [
                                      Color(0xFFE2F5EA),
                                      Color(0xFFBFE5CE),
                                    ], // Happy
                                    [
                                      Color(0xFFFFECB8),
                                      Color(0xFFFFE08C),
                                    ], // Very Happy
                                  ][i];
                                  final emoji = [
                                    '😢',
                                    '😞',
                                    '😐',
                                    '🙂',
                                    '😄',
                                  ][i];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(
                                        () => _moodValue = idx.toDouble(),
                                      );
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text('Mood updated: $emoji'),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 2),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: colors,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: colors[0].withOpacity(
                                                  0.3,
                                                ),
                                                blurRadius: 8,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            emoji,
                                            style: const TextStyle(
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        if (_moodValue.round() == idx)
                                          Container(
                                            width: 6,
                                            height: 6,
                                            decoration: const BoxDecoration(
                                              color: _Palette.primary,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(height: 12),
                              Slider(
                                value: _moodValue,
                                min: 1,
                                max: 5,
                                divisions: 4,
                                label: moodEmoji(_moodValue),
                                onChanged: (v) =>
                                    setState(() => _moodValue = v),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mood: ${moodEmoji(_moodValue)}'),
                                  Text(
                                    'Today\'s note: ${_moodValue.round() >= 4 ? 'Feeling okay' : 'Need support'}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),
                      const SizedBox(height: 16),

                      // Moved "Upcoming" card directly below the mood box
                      Card(
                        color: const Color(0xFFDCD6FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 1,
                        child: SizedBox(
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Upcoming',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => _openFeature('View Plan'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text('View'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      const Text(
                        'QUICK ACCESS',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _Palette.text,
                        ),
                      ),
                      const Text(
                        'Essential Wellness Services',
                        style: TextStyle(fontSize: 16, color: _Palette.subtext),
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
                        crossAxisCount: screenWidth > 600 ? 3 : 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: screenWidth > 600 ? 1.2 : 1,
                        children: [
                          _QuickCard(
                            icon: Icons.calendar_today,
                            title: 'Schedule Session',
                            subtitle: 'Book Appointment',
                            iconColor: Colors.blue,
                            onTap: () => _openFeature('Schedule'),
                          ),
                          _QuickCard(
                            icon: Icons.psychology,
                            title: 'Mental Health',
                            subtitle: 'Take Assessment',
                            iconColor: _Palette.primary,
                            onTap: () => _openFeature('Mental Health'),
                          ),
                          _QuickCard(
                            icon: Icons.person_outline,
                            title: 'Expert Connect',
                            subtitle: 'Find Counsellor',
                            iconColor: const Color.fromARGB(255, 194, 35, 212),
                            onTap: () => _openFeature('Expert Connect'),
                          ),
                          _QuickCard(
                            icon: Icons.self_improvement,
                            title: 'Meditation',
                            subtitle: 'Start Session',
                            iconColor: Colors.teal,
                            onTap: () => _openFeature('Meditation'),
                          ),
                          _QuickCard(
                            icon: Icons.note_alt_outlined,
                            title: 'Wellness Journal',
                            subtitle: 'Track Progress',
                            iconColor: Colors.indigo,
                            onTap: () => _openFeature('Journal'),
                          ),
                          _QuickCard(
                            icon: Icons.groups_outlined,
                            title: 'Support Groups',
                            subtitle: 'Join Community',
                            iconColor: const Color.fromARGB(255, 23, 88, 157),
                            onTap: () => _openFeature('Support Groups'),
                          ),
                        ],
                      ),

                      // Reduced spacing between Quick Access and Advanced Care
                      const SizedBox(height: 8),
                      WellnessExtras(onOpenFeature: _openFeature),
                      const SizedBox(height: 12),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),

              Container(
                decoration: const BoxDecoration(
                  color: _Palette.cardBg,
                  border: Border(top: BorderSide(color: _Palette.border)),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _FooterItem(
                      icon: Icons.description,
                      label: 'T&C',
                      onTap: () => Navigator.pushNamed(context, '/terms'),
                    ),
                    _FooterItem(
                      icon: Icons.lock,
                      label: 'Privacy',
                      onTap: () => Navigator.pushNamed(context, '/privacy'),
                    ),
                    _FooterItem(
                      icon: Icons.rule,
                      label: 'Guidelines',
                      onTap: () => _openFeature('Guidelines'),
                    ),
                    _FooterItem(
                      icon: Icons.info_outline,
                      label: 'About',
                      onTap: () => Navigator.pushNamed(context, '/about'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            right: 18,
            child: FloatingChatWidget(onTap: _openChatbot),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(int profileCompletion) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 255, 250, 253),
        width:
            MediaQuery.of(context).size.width *
            (MediaQuery.of(context).size.width > 600 ? 0.3 : 0.85),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: _Palette.primary),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color.fromARGB(255, 246, 23, 190),
                    child: Text('A'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Adi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text('Profile Completion: $profileCompletion%'),
                        const SizedBox(height: 6),
                        LinearProgressIndicator(
                          value: profileCompletion / 100,
                          backgroundColor: Colors.grey[200],
                          color: _Palette.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _drawerTile('Dashboard', Icons.home, () => Navigator.pop(context)),
            _drawerTile('Connect with Counsellor', Icons.chat, _openChatbot),
            _drawerTile(
              'History Center',
              Icons.history,
              () => Navigator.pushNamed(context, '/history'),
            ),
            _drawerTile(
              'My Wellness Plan',
              Icons.insights,
              () => _openFeature('My Wellness Plan'),
            ),
            _drawerTile(
              'Reports & Analytics',
              Icons.bar_chart,
              () => _openFeature('Reports & Analytics'),
            ),
            _drawerTile(
              'My Journal',
              Icons.book,
              () => _openFeature('My Journal'),
            ),
            _drawerTile(
              'Schedule',
              Icons.calendar_today,
              () => _openFeature('Schedule'),
            ),
            _drawerTile(
              'Professional Guidance',
              Icons.medical_services,
              () => _openFeature('Professional Guidance'),
            ),
            const Divider(),
            _drawerTile(
              'Settings',
              Icons.settings,
              () {}, // Settings page removed, kept for future implementation
            ),
            _drawerTile(
              'About Us',
              Icons.info,
              () => Navigator.pushNamed(context, '/about'),
            ),
            _drawerTile(
              'Terms & Conditions',
              Icons.article,
              () => Navigator.pushNamed(context, '/terms'),
            ),
            _drawerTile(
              'Privacy Policy',
              Icons.lock,
              () => Navigator.pushNamed(context, '/privacy'),
            ),
            _drawerTile(
              'Contact & Feedback',
              Icons.contact_support,
              () => Navigator.pushNamed(context, '/contact'),
            ),
            _drawerTile('Logout', Icons.exit_to_app, () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out (demo)')),
              );
            }),
          ],
        ),
      ),
    );
  }

  ListTile _drawerTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: _Palette.primary),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      onTap: onTap,
    );
  }

  void _openFeature(String name) {
    // Navigate to the Schedule Session page instead of showing a modal
    if (name == 'Schedule') {
      Navigator.pushNamed(context, '/schedule');
      return;
    }

    // Navigate to AI Assessment page
    if (name == 'Mental Health' ||
        name == 'AI Assessment' ||
        name == 'Assessment') {
      Navigator.pushNamed(context, '/assessment');
      return;
    }

    // Navigate to Expert Connect page
    if (name == 'Expert Connect') {
      Navigator.pushNamed(context, '/expert-connect');
      return;
    }

    // Navigate to Meditation page
    if (name == 'Meditation') {
      Navigator.pushNamed(context, '/meditation');
      return;
    }

    final Map<String, String> featureContents = {
      'My Wellness Plan':
          'Personalized daily mental-wellness roadmap.\n\n'
          'Section 1: "Daily Tasks"\n'
          '• Meditation (10 min)\n'
          '• Drink 2 L Water\n'
          '• Gratitude Note\n\n'
          'Section 2: "Weekly Goals"\n'
          '• No social media after 10 PM\n'
          '• 3 Workout Days\n\n'
          'Progress bar shows completion percentage. "Add Custom Task" button available.',
      'Reports & Analytics':
          'Visual insights about your progress.\n\n'
          '• Graph: Mood Trends (7-day / 30-day)\n'
          '• Chart: Most completed wellness tasks\n'
          '• Counter: Total sessions attended\n'
          '• Insight card: "You felt better 4 times this week — great job!"\n\n'
          'See your journey through data, visualized simply.',
      'My Journal':
          'Safe personal space for emotional reflection.\n\n'
          '• Add new entry (title, text, tags)\n'
          '• List of past entries with dates\n'
          '• Search or filter by tags\n\n'
          'Your private space to record thoughts and feelings.',
      'Schedule':
          'Manage upcoming counselling sessions or self-care reminders.\n\n'
          '• Calendar view\n'
          '• List of upcoming appointments + reminders\n'
          '• "Add New Event" button\n'
          '• Option: "Notify me 30 mins before session"\n\n'
          'Never miss an important wellness moment.',
      'Professional Guidance':
          'Resource hub for expert mental-health content.\n\n'
          'Explore:\n'
          '• Articles\n'
          '• Podcasts\n'
          '• Videos\n\n'
          'Each with title, short description, and read/listen/watch button.',
      'Schedule session':
          'Book a counselling session for your convenient time.\n\n'
          'Select:\n'
          '• Date\n'
          '• Time slot\n'
          '• Session duration (30 / 45 / 60 mins)\n'
          '• Optional: choose counsellor or "auto assign"\n\n'
          'Confirms booking via email/notification. Syncs with counsellor\'s calendar.',
      'Mental Health':
          'AI-Based Assessment to help self-evaluate mental well-being.\n\n'
          'Answer 10–15 emotional health questions like:\n'
          '• "I\'ve been feeling anxious or restless lately."\n'
          '• "I have trouble concentrating."\n\n'
          'AI calculates score → categorizes results (Normal / Mild / Moderate / Severe).\n'
          'Generates recommendation or next step.',
      'Expert Connect':
          'Find and connect with counsellors based on your preferences.\n\n'
          'Filter by:\n'
          '• Male / Female counsellor\n'
          '• Expertise (Stress, Relationship, Career, Depression, etc.)\n'
          '• Rating or Language preference\n\n'
          'View counsellor profile & schedule session. AI suggests best counsellor match using your assessment.',
      'Meditation':
          'Guided relaxation using AI-generated meditation and ambient music.\n\n'
          'Categories:\n'
          '• Relaxation\n'
          '• Sleep\n'
          '• Focus\n'
          '• Gratitude\n'
          '• Breathing\n\n'
          'AI-generated voice and Mubert music provide guided experience.',
      'Journal':
          'Space for logging emotions and experiences.\n\n'
          '• Add entry → Title, Note, Mood emoji\n'
          '• View past entries\n'
          '• Option to mark as 3-day journal or weekly summary\n\n'
          'AI suggests writing prompts and provides tone feedback.',
      'Support Groups':
          'Engage with a safe and anonymous community.\n\n'
          'Choose groups:\n'
          '• Anxiety\n'
          '• Career Stress\n'
          '• Relationships\n'
          '• General Wellness\n\n'
          'Post thoughts anonymously. Comment and support other members.',
      'View Plan':
          'Quick view of your wellness journey.\n\n'
          '• Today\'s tasks and goals\n'
          '• Progress indicators\n'
          '• Next scheduled activities\n'
          '• Quick actions to start/complete tasks',
      'Insights & Reports':
          'Weekly mood trend snapshot + activity summary.\n\n'
          '• Your overall wellness looks balanced this week\n'
          '• Activity completion stats\n'
          '• Mood trend line\n'
          '• Recommended next steps based on your data',
      'MindCare Booster':
          'Quick 1–2 minute instant wellness activities.\n\n'
          'Choose from:\n'
          '• Deep breathing cue (animation + audio)\n'
          '• Short music burst (AI-generated calm sound)\n'
          '• Positive affirmation (text/voice)\n\n'
          '"Breathe in peace... exhale stress... you\'re doing great."',
      'Advanced Care Support':
          'Counsellor-guided pathway to specialized care.\n\n'
          'Appears when counsellor recommends doctor consultation:\n'
          '• View recommended specialist\n'
          '• See available appointment slots\n'
          '• Book consultation directly\n\n'
          'Private, professional, and supportive transition to deeper care.',
      'Recharge Room':
          'Your personal self-care space for relaxation.\n\n'
          'Choose your recharge mode:\n'
          '• Breathing: AI-guided deep breathing with animation\n'
          '• Music: Calming ambient or instrumental tracks\n'
          '• Affirmations: Spoken or written positive messages\n\n'
          'AI suggests duration based on your mood data.',
      'Guidelines': 'Community and usage guidelines will appear here.',
    };

    final content =
        featureContents[name] ??
        'This is a placeholder for "$name". Integrate actual feature here.';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.9,
        builder: (context, controller) => Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  child: Text(
                    content,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ---------- Small Widgets ---------- */

class _QuickCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? iconColor;
  final VoidCallback onTap;

  const _QuickCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _Palette.cardBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: _Palette.border, width: 1),
      ),
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _Palette.soft,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: iconColor ?? _Palette.accent,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _Palette.text,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: _Palette.subtext),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _FooterItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: _Palette.primary, size: 20),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

/* ---------- Wallet Bottom Sheet ---------- */
class WalletSheet extends StatefulWidget {
  final int minutes;
  final ValueChanged<int> onRecharge;
  const WalletSheet({required this.minutes, required this.onRecharge});
  @override
  State<WalletSheet> createState() => _WalletSheetState();
}

class _WalletSheetState extends State<WalletSheet> {
  // _money holds the selected cash amount (e.g. 100, 200, 300)
  int _money = 100;
  final TextEditingController _customCtrl = TextEditingController();

  // Conversion: 1 money unit = 0.1 minute. We use minutes = money ~/ 10 so
  // ₹100 -> 10 minutes, ₹200 -> 20 minutes, etc. (assumption; adjust if needed)
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Wallet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text('Add cash to your wallet:'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [100, 200, 300].map((e) {
              final selected = _money == e;
              return ChoiceChip(
                label: Text('₹$e'),
                selected: selected,
                onSelected: (_) => setState(() {
                  _money = e;
                  _customCtrl.clear();
                }),
                selectedColor: _Palette.primary,
              );
            }).toList(),
          ),

          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _customCtrl,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: _Palette.primary,
                  decoration: const InputDecoration(
                    hintText: 'Custom amount (e.g. 150)',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                  onChanged: (v) {
                    final parsed = int.tryParse(v) ?? 0;
                    if (parsed > 0) setState(() => _money = parsed);
                  },
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  _customCtrl.clear();
                  setState(() => _money = 100);
                },
                child: const Text('Reset'),
              ),
            ],
          ),

          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final minutesToAdd = (_money ~/ 10).clamp(1, 1000000);
                widget.onRecharge(minutesToAdd);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _Palette.primary,
              ),
              child: Text('Recharge ₹$_money'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _customCtrl.dispose();
    super.dispose();
  }
}

/* ---------- Chatbot Page (Full Implementation) ---------- */

class ChatWithCounsellorPage extends StatefulWidget {
  const ChatWithCounsellorPage({super.key});

  @override
  State<ChatWithCounsellorPage> createState() => _ChatWithCounsellorPageState();
}

class _ChatWithCounsellorPageState extends State<ChatWithCounsellorPage>
    with SingleTickerProviderStateMixin {
  String _currentFlow = 'questionnaire'; // 'questionnaire', 'actions', 'chat'

  int _currentQuestionIndex = 0;
  final List<Question> _questions = [
    Question(
      text: 'What type of concern are you experiencing?',
      options: [
        'Work stress',
        'Relationship issues',
        'Anxiety',
        'Family problems',
        'Others',
      ],
    ),
    Question(
      text: 'How long have you been feeling this way?',
      options: [
        'Less than a week',
        '1-2 weeks',
        '2-4 weeks',
        'More than a month',
        'Others',
      ],
    ),
    Question(
      text: 'What would help you most right now?',
      options: [
        'Someone to talk to',
        'Coping strategies',
        'Understanding my feelings',
        'Immediate support',
        'Others',
      ],
    ),
  ];

  final List<String?> _answers = [null, null, null];
  final TextEditingController _othersController = TextEditingController();
  bool _showOthersInput = false;

  bool _showGreeting = true;

  final List<ChatMessage> _chatMessages = [];
  final TextEditingController _chatInputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted && _showGreeting) {
        setState(() => _showGreeting = false);
      }
    });
  }

  @override
  void dispose() {
    _othersController.dispose();
    _chatInputController.dispose();
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _selectOption(int questionIndex, String option) {
    setState(() {
      _answers[questionIndex] = option;
      _showOthersInput = option == 'Others';
      if (option != 'Others') _othersController.clear();
    });

    if (option != 'Others') {
      Future.delayed(const Duration(milliseconds: 400), _moveToNextQuestion);
    }
  }

  void _moveToNextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _showOthersInput = false;
      });
    } else {
      setState(() => _currentFlow = 'actions');
    }
  }

  void _continueFromOthers() {
    if (_othersController.text.trim().isNotEmpty) {
      _answers[_currentQuestionIndex] = _othersController.text.trim();
      _moveToNextQuestion();
    }
  }

  void _startChat() {
    setState(() => _currentFlow = 'chat');
    Future.delayed(const Duration(milliseconds: 500), () {
      _addCounsellorMessage(
        "Hello! I'm here to support you. Thank you for sharing your concerns. How are you feeling right now?",
      );
    });
  }

  void _startCall() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.phone, color: _Palette.primary),
            SizedBox(width: 8),
            Text('Call Counsellor'),
          ],
        ),
        content: const Text(
          'A counsellor will call you shortly. Please make sure you\'re in a comfortable and private space.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Call initiated (demo mode)'),
                  backgroundColor: _Palette.primary,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _Palette.primary,
              foregroundColor: Colors.white,
            ),
            child: const Text('Start Call'),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final text = _chatInputController.text.trim();
    if (text.isEmpty) return;

    setState(() => _chatMessages.add(ChatMessage(text: text, isUser: true)));
    _chatInputController.clear();
    _scrollToBottom();

    Future.delayed(const Duration(milliseconds: 800), () {
      _addCounsellorMessage(_generateCounsellorResponse(text));
    });
  }

  void _addCounsellorMessage(String text) {
    setState(() => _chatMessages.add(ChatMessage(text: text, isUser: false)));
    _scrollToBottom();
  }

  String _generateCounsellorResponse(String userMessage) {
    final lowerMessage = userMessage.toLowerCase();
    final responses = [
      "I understand. It takes courage to share what you're going through. Can you tell me more about how this is affecting your daily life?",
      "Thank you for opening up. Your feelings are valid, and it's okay to feel this way. What would you like to focus on today?",
      "I hear you. Let's work through this together. Is there a specific moment or situation that triggers these feelings?",
      "You're not alone in this. Many people experience similar challenges. What coping strategies have you tried so far?",
      "I appreciate you sharing that with me. How do you feel when you think about seeking support?",
    ];

    if (lowerMessage.contains('stress') ||
        lowerMessage.contains('overwhelmed')) {
      return "Stress can be really challenging. Let's explore some relaxation techniques. Have you tried deep breathing or mindfulness exercises?";
    } else if (lowerMessage.contains('sad') ||
        lowerMessage.contains('depressed')) {
      return "I'm sorry you're feeling this way. Remember that your feelings matter. How long have you been feeling like this?";
    } else if (lowerMessage.contains('anxiety') ||
        lowerMessage.contains('worried')) {
      return "Anxiety can feel overwhelming, but there are ways to manage it. Can you identify what triggers your anxiety?";
    } else if (lowerMessage.contains('thank')) {
      return "You're very welcome. I'm here whenever you need support. Is there anything else you'd like to discuss?";
    }

    return responses[DateTime.now().millisecond % responses.length];
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildGreeting() {
    if (_showGreeting) {
      return FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _Palette.primary,
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.sentiment_satisfied_alt,
                  size: 60,
                  color: _Palette.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Hello! 👋',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'I\'m here to help you today',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildQuestionnaire() {
    if (_currentFlow != 'questionnaire') return const SizedBox.shrink();

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 24),
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _Palette.primary,
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.sentiment_satisfied_alt,
                  size: 45,
                  color: _Palette.primary,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: _Palette.primary,
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _questions[_currentQuestionIndex].text,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ..._questions[_currentQuestionIndex].options.map((option) {
                    final isSelected =
                        _answers[_currentQuestionIndex] == option;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () =>
                            _selectOption(_currentQuestionIndex, option),
                        borderRadius: BorderRadius.circular(16),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected ? _Palette.primary : _Palette.bg,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected
                                  ? _Palette.primary
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? _Palette.primary
                                        : Colors.grey[400]!,
                                    width: 2,
                                  ),
                                  color: isSelected
                                      ? _Palette.primary
                                      : Colors.transparent,
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  if (_showOthersInput) ...[
                    const SizedBox(height: 16),
                    TextField(
                      controller: _othersController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Please describe your concern...',
                        filled: true,
                        fillColor: _Palette.bg,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: _Palette.primary,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _continueFromOthers,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _Palette.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _questions.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentQuestionIndex == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentQuestionIndex >= index
                        ? _Palette.primary
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    if (_currentFlow != 'actions') return const SizedBox.shrink();

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _Palette.primary,
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.sentiment_satisfied_alt,
                  size: 60,
                  color: _Palette.primary,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Thank you for sharing!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'How would you like to connect?',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: _startChat,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _Palette.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.chat_bubble_outline, size: 28),
                      SizedBox(width: 12),
                      Text(
                        '🗨️ Chat with Us',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: _startCall,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: _Palette.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: _Palette.primary, width: 2),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.phone_outlined, size: 28),
                      SizedBox(width: 12),
                      Text(
                        '📞 Call with Us',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatInterface() {
    if (_currentFlow != 'chat') return const SizedBox.shrink();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: _chatMessages.length,
            itemBuilder: (context, index) =>
                _buildChatBubble(_chatMessages[index]),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _chatInputController,
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      filled: true,
                      fillColor: _Palette.bg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: _Palette.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChatBubble(ChatMessage message) {
    final isUser = message.isUser;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: _Palette.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.sentiment_satisfied_alt,
                size: 20,
                color: _Palette.primary,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isUser ? _Palette.primary : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(isUser ? 20 : 0),
                  bottomRight: Radius.circular(isUser ? 0 : 20),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  fontSize: 15,
                  color: isUser ? Colors.white : Colors.grey[800],
                  height: 1.4,
                ),
              ),
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 8),
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: _Palette.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 20,
                color: _Palette.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat with Counsellor',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        backgroundColor: _Palette.primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: _currentFlow == 'chat'
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _currentFlow = 'actions';
                    _chatMessages.clear();
                  });
                },
              )
            : null,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _showGreeting
            ? _buildGreeting()
            : _currentFlow == 'questionnaire'
            ? _buildQuestionnaire()
            : _currentFlow == 'actions'
            ? _buildActionButtons()
            : _buildChatInterface(),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  Question({required this.text, required this.options});
}

class ChatMessage {
  final String text;
  final bool isUser;
  ChatMessage({required this.text, required this.isUser});
}

/* ---------- Profile Page (with black headers; Account removed) ---------- */
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Map<String, dynamic> profile;
  bool _initialized = false;

  final _formKey = GlobalKey<FormState>();

  final _firstNameCtrl = TextEditingController();
  final _middleNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();
  String _gender = '';

  int _calcCompletion() {
    final fields = [
      _firstNameCtrl.text,
      _middleNameCtrl.text,
      _lastNameCtrl.text,
      _emailCtrl.text,
      _phoneCtrl.text,
      _ageCtrl.text,
      _gender,
    ];
    final filled = fields.where((s) => s.isNotEmpty).length;
    return ((filled / fields.length) * 100).round();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final args = ModalRoute.of(context)!.settings.arguments;
      profile = (args is Map<String, dynamic>)
          ? Map<String, dynamic>.from(args)
          : {};
      final fullName = profile['name'] ?? '';
      final nameParts = fullName.split(' ');
      _firstNameCtrl.text = nameParts.isNotEmpty ? nameParts[0] : '';
      _middleNameCtrl.text = nameParts.length > 2 ? nameParts[1] : '';
      _lastNameCtrl.text = nameParts.length > 1 ? nameParts.last : '';
      _emailCtrl.text = profile['email'] ?? '';
      _phoneCtrl.text = profile['phone'] ?? '';
      _ageCtrl.text = profile['age']?.toString() ?? '';
      _gender = profile['gender'] ?? '';
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _middleNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _ageCtrl.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      final fullName = [
        _firstNameCtrl.text,
        _middleNameCtrl.text,
        _lastNameCtrl.text,
      ].where((s) => s.isNotEmpty).join(' ');

      final updated = {
        'name': fullName,
        'email': _emailCtrl.text,
        'phone': _phoneCtrl.text,
        'age': int.tryParse(_ageCtrl.text),
        'gender': _gender,
      };
      Navigator.pop(context, updated);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Profile saved')));
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: _Palette.subtext),
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: _Palette.border),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: _Palette.primary),
      ),
      filled: true,
      fillColor: _Palette.cardBg,
    );
  }

  @override
  Widget build(BuildContext context) {
    final completion = _calcCompletion();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 220, 133, 245),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: const Color.fromARGB(255, 85, 68, 239),
              child: Text(
                _firstNameCtrl.text.isNotEmpty
                    ? _firstNameCtrl.text[0].toUpperCase()
                    : 'U',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _firstNameCtrl.text.isNotEmpty
                  ? [
                      _firstNameCtrl.text,
                      _middleNameCtrl.text,
                      _lastNameCtrl.text,
                    ].where((s) => s.isNotEmpty).join(' ')
                  : 'Your Name',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Profile Completion: $completion%',
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: LinearProgressIndicator(
                    value: completion / 100,
                    color: _Palette.primary,
                    backgroundColor: Colors.grey[300],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 4),
                      child: Text(
                        'Personal Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _firstNameCtrl,
                      decoration: _inputDecoration('First Name'),
                      validator: (v) => v == null || v.trim().isEmpty
                          ? 'Enter first name'
                          : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _middleNameCtrl,
                      decoration: _inputDecoration('Middle Name'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _lastNameCtrl,
                      decoration: _inputDecoration('Last Name'),
                      validator: (v) => v == null || v.trim().isEmpty
                          ? 'Enter last name'
                          : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _ageCtrl,
                      decoration: _inputDecoration('Age'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: _gender.isNotEmpty ? _gender : null,
                      items: ['Male', 'Female', 'Other']
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => _gender = v ?? ''),
                      decoration: _inputDecoration('Gender'),
                      dropdownColor: Colors.white,
                      style: const TextStyle(color: Colors.black),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 18, bottom: 4),
                      child: Text(
                        'Contact Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _emailCtrl,
                      decoration: _inputDecoration('Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) =>
                          v == null || v.trim().isEmpty ? 'Enter email' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phoneCtrl,
                      decoration: _inputDecoration('Phone Number'),
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _saveProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _Palette.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Save Changes'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------- About/Terms/Privacy/Contact pages ---------- */

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 109, 201, 243),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Our Vision', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text(
              'To bring mental peace and support through technology and empathy.',
            ),
            SizedBox(height: 12),
            Text('Our Approach', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text(
              'AI + professional counselling synergy for continuous wellbeing.',
            ),
            SizedBox(height: 12),
            Text('Our Team', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text(
              'Certified psychologists, clinical advisors, and wellness coaches.',
            ),
            SizedBox(height: 12),
            Text('Ethics', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text('Confidentiality, safety, and no forced disclosure.'),
            SizedBox(height: 12),
            Text('Contact Info', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text('support@example.com'),
            SizedBox(height: 20),
            Text('Location: Hyderabad, India'),
          ],
        ),
      ),
    );
  }
}

class TermsPage extends StatelessWidget {
  final String demoText =
      'Terms & Conditions content placeholder. Use the actual legal content you prepared here (T&C, crisis protocol, privacy exceptions, limitations of liability).';

  const TermsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 44, 205, 189),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(child: Text(demoText)),
      ),
    );
  }
}

class PrivacyPage extends StatelessWidget {
  final String demoText =
      'Privacy Policy placeholder. Explain how data is stored, shared, and emergency disclosure flow.';

  const PrivacyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 75, 214, 235),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(child: Text(demoText)),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  final _controller = TextEditingController();

  ContactPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact & Feedback',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 101, 217, 235),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Send us a message or request help.'),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: 'Write your message...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Message sent (demo)')),
                );
                _controller.clear();
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------- Wellness Extras (Updated with Blue Icons) ---------- */
class WellnessExtras extends StatelessWidget {
  final ValueChanged<String> onOpenFeature;
  const WellnessExtras({super.key, required this.onOpenFeature});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: _Palette.cardBg,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Advanced Care Support',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: _Palette.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: InkWell(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            title: const Text(
                              'Advanced Care Support',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'A calmer way to suggest higher-level help. Advanced Care Support offers structured steps toward personalised assistance: brief structured assessment, referral guidance to professionals, and clear next-steps if you need more support.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Our Personalized Care Program:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    '• One-on-one professional support\n'
                                    '• Structured assessment and guidance\n'
                                    '• Confidential referral network\n'
                                    '• Progress tracking and feedback\n'
                                    '• Flexible scheduling options',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      height: 1.5,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Reach out anytime – we\'re here to support your journey.',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                  foregroundColor: _Palette.primary,
                                ),
                                child: const Text(
                                  'Close',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 28,
                        backgroundColor: _Palette.soft,
                        child: Icon(
                          Icons.health_and_safety,
                          size: 28,
                          color: _Palette.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ), // Reduced spacing between Advanced Care and next cards
          // Responsive layout: side-by-side on wide screens, stacked on narrow screens
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 600;
              final leftCard = InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Text(
                        'Insights & Reports',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      content: const SingleChildScrollView(
                        child: Text(
                          'Weekly mood trend: Slight improvement from last week.\n\n'
                          'Track your emotional patterns, mood history, and progress over time. '
                          'Get personalized insights based on your interactions and activities.',
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            foregroundColor: _Palette.primary,
                          ),
                          child: const Text(
                            'Close',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: _Palette.border),
                  ),
                  elevation: 3,
                  color: const Color(
                    0xFFF5F9FF,
                  ), // Soft blue-white for Insights
                  child: SizedBox(
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E4D8C), // Classic navy blue
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF1E4D8C).withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.insights,
                            size: 48,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Insights & Reports',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );

              final rightCard = InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Text(
                        'MindCare Booster',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      content: const SingleChildScrollView(
                        child: Text(
                          'A quick emotional recharge tool – with AI-guided affirmations, '
                          'breathing cues, and calming music for instant relief.\n\n'
                          'Take a moment to reset your mind with personalized exercises '
                          'designed to boost your mood and reduce stress.',
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            foregroundColor: _Palette.primary,
                          ),
                          child: const Text(
                            'Close',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: _Palette.border),
                  ),
                  elevation: 3,
                  color: const Color(0xFFFFFAF5), // Warm white for MindCare
                  child: SizedBox(
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF8E44AD),
                                Color(0xFF2C3E50),
                              ], // Deep purple to slate
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF8E44AD).withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.bolt,
                              size: 52,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'MindCare Booster',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: leftCard),
                    const SizedBox(width: 12),
                    Expanded(child: rightCard),
                  ],
                );
              }

              // Mobile view - also side by side
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: leftCard),
                  const SizedBox(width: 12),
                  Expanded(child: rightCard),
                ],
              );
            },
          ),
          const SizedBox(
            height: 8,
          ), // Reduced spacing between card pair and Recharge Room
          Card(
            color: _Palette.cardBg,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recharge Room',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: _Palette.text,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _RechargePill(
                        icon: Icons.self_improvement,
                        label: 'Breathing',
                      ),
                      _RechargePill(icon: Icons.music_note, label: 'Music'),
                      _RechargePill(
                        icon: Icons.record_voice_over,
                        label: 'Affirmations',
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12), // Reduced bottom spacing
        ],
      ),
    );
  }
}

class _RechargePill extends StatelessWidget {
  final IconData icon;
  final String label;
  const _RechargePill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: _Palette.soft,
          child: Icon(icon, color: _Palette.primary, size: 26),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: _Palette.subtext)),
      ],
    );
  }
}

/* ---------- Floating Chatbot Widget ---------- */
class FloatingChatWidget extends StatelessWidget {
  final VoidCallback onTap;
  const FloatingChatWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: const BoxDecoration(
          color: Color(0xFF25D366),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: const Center(
          child: Icon(Icons.headset_mic, size: 28, color: Colors.white),
        ),
      ),
    );
  }
}

/* ---------- History Center Page ---------- */
class HistoryCenterPage extends StatefulWidget {
  const HistoryCenterPage({super.key});

  @override
  State<HistoryCenterPage> createState() => _HistoryCenterPageState();
}

class _HistoryCenterPageState extends State<HistoryCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> chatHistory = List.generate(
    8,
    (i) => {
      'name': 'Counsellor ${i + 1}',
      'lastMessage': 'Session ${i + 1} summary available.',
      'date': DateTime.now().subtract(Duration(days: i * 20)),
    },
  );

  final List<Map<String, dynamic>> callHistory = List.generate(
    6,
    (i) => {
      'with': 'Therapist ${i + 1}',
      'duration': '${15 + i * 5} mins',
      'date': DateTime.now().subtract(Duration(days: i * 25)),
    },
  );

  final List<Map<String, dynamic>> transactions = List.generate(10, (i) {
    DateTime date = DateTime.now().subtract(Duration(days: i * 15));
    bool expired = date.isBefore(
      DateTime.now().subtract(const Duration(days: 180)),
    );
    return {
      'id': '#TXN${1000 + i}',
      'amount': '${299 + (i * 50)} INR',
      'method': i % 2 == 0 ? 'UPI' : 'Card',
      'status': expired ? 'Expired' : 'Active',
      'date': date,
    };
  });

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History Center',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        foregroundColor: _Palette.primary,
        bottom: TabBar(
          controller: _tabController,
          labelColor: _Palette.primary,
          tabs: const [
            Tab(icon: Icon(Icons.chat_bubble_outline), text: 'Chat'),
            Tab(icon: Icon(Icons.call_outlined), text: 'Calls'),
            Tab(icon: Icon(Icons.payments_outlined), text: 'Payments'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildChatHistory(), _buildCallHistory(), _buildPayments()],
      ),
    );
  }

  Widget _buildChatHistory() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: chatHistory.length,
      itemBuilder: (context, index) {
        final item = chatHistory[index];
        return Card(
          color: _Palette.cardBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: _Palette.border),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: _Palette.primary,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              item['name'],
              style: const TextStyle(color: _Palette.text),
            ),
            subtitle: Text(item['lastMessage']),
            trailing: Text(
              '${item['date'].day}/${item['date'].month}/${item['date'].year}',
              style: const TextStyle(color: _Palette.subtext, fontSize: 12),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCallHistory() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: callHistory.length,
      itemBuilder: (context, index) {
        final call = callHistory[index];
        return Card(
          color: _Palette.cardBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: _Palette.border),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: _Palette.primary,
              child: Icon(Icons.call, color: Colors.white),
            ),
            title: Text(
              call['with'],
              style: const TextStyle(color: _Palette.text),
            ),
            subtitle: Text('Duration: ${call['duration']}'),
            trailing: Text(
              '${call['date'].day}/${call['date'].month}/${call['date'].year}',
              style: const TextStyle(color: _Palette.subtext, fontSize: 12),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPayments() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final txn = transactions[index];
        Color chipColor = txn['status'] == 'Expired'
            ? Colors.redAccent
            : Colors.green;
        return Card(
          color: _Palette.cardBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: _Palette.border),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: _Palette.soft,
              child: Icon(Icons.receipt_long, color: _Palette.primary),
            ),
            title: Text(
              txn['id'],
              style: const TextStyle(color: _Palette.text),
            ),
            subtitle: Text('${txn['method']} • ${txn['amount']}'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${txn['date'].day}/${txn['date'].month}/${txn['date'].year}',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 4),
                Chip(
                  label: Text(
                    txn['status'],
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  backgroundColor: chipColor,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
