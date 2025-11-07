import 'package:flutter/material.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({super.key});

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final List<_MeditationCategory> _categories = const [
    _MeditationCategory(
      name: 'Relaxation',
      description:
          'Relaxation meditation melts stress and invites your body into deep rest.',
      icon: Icons.spa,
    ),
    _MeditationCategory(
      name: 'Sleep',
      description:
          'Sleep meditation eases you into restful nights and peaceful dreams.',
      icon: Icons.nights_stay,
    ),
    _MeditationCategory(
      name: 'Focus',
      description: 'Focus meditation helps improve attention and calm.',
      icon: Icons.center_focus_strong,
    ),
    _MeditationCategory(
      name: 'Gratitude',
      description:
          'Gratitude meditation nurtures appreciation and positive emotion.',
      icon: Icons.favorite,
    ),
    _MeditationCategory(
      name: 'Breathing',
      description:
          'Breathing meditation guides you through mindful inhales and exhales.',
      icon: Icons.air,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Meditation'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D8F97), Color(0xFF6C4CB5), Color(0xFF162A6C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'AI-Powered Calm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Experience personalized meditation with AI-generated voice and ambient sounds crafted to help you relax wherever you are.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'Select a Meditation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: _categories
                      .map(
                        (category) => _MeditationCategoryCard(
                          category: category,
                          onTap: () => _showSessionSheet(context, category),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 36),
                const Text(
                  'Meditation Classes (Paid Sessions)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Join Meditation Classes',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Schedule meditation sessions with certified trainers. Choose from flexible plans and pay per session.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                _ClassesSection(onBook: _onBookClass),
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '“Take a deep breath. Calmness begins the moment you decide to pause.”',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSessionSheet(BuildContext context, _MeditationCategory category) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(sheetContext).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              category.description,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _startSession(sheetContext, category),
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start Session'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startSession(BuildContext context, _MeditationCategory category) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Starting ${category.name} session with AI-generated ambient audio...',
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _onBookClass(String planName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Booking flow for $planName coming soon!'),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

class _MeditationCategoryCard extends StatelessWidget {
  const _MeditationCategoryCard({required this.category, required this.onTap});

  final _MeditationCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: (MediaQuery.of(context).size.width - 56) / 2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(category.icon, color: Colors.white, size: 36),
            const SizedBox(height: 12),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClassesSection extends StatelessWidget {
  const _ClassesSection({required this.onBook});

  final void Function(String planName) onBook;

  @override
  Widget build(BuildContext context) {
    final classOptions = [
      _ClassOption(
        title: 'One-Day Class',
        description: 'Single guided session for quick relaxation.',
        icon: Icons.event_available,
      ),
      _ClassOption(
        title: 'Regular Plan',
        description: 'Daily or weekly sessions for habit building.',
        icon: Icons.repeat,
      ),
      _ClassOption(
        title: 'Online Video Sessions',
        description: 'Attend virtual meditation classes at your convenience.',
        icon: Icons.videocam,
      ),
    ];

    return Column(
      children: classOptions
          .map(
            (option) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(option.icon, color: Colors.white, size: 32),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              option.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              option.description,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.85),
                                fontSize: 15,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ElevatedButton(
                                onPressed: () => onBook(option.title),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF1D8F97),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: const Text('Book Now'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _MeditationCategory {
  const _MeditationCategory({
    required this.name,
    required this.description,
    required this.icon,
  });

  final String name;
  final String description;
  final IconData icon;
}

class _ClassOption {
  const _ClassOption({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}
