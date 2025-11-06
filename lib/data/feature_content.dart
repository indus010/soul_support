import '../pages/feature_detail_page.dart';

/// Comprehensive content repository for all Soul Support features
/// with rich examples, demo data, and structured sections
class FeatureContent {
  static List<FeatureSection> getContent(String featureName) {
    return _contentMap[featureName] ?? _getDefaultContent(featureName);
  }

  static final Map<String, List<FeatureSection>> _contentMap = {
    'Schedule': [
      FeatureSection(
        heading: '🗓️ Welcome to Your Wellness Schedule',
        paragraphs: [
          'Your mental wellness journey thrives on consistency and mindful planning. The Schedule feature helps you organize counselling sessions, self-care reminders, and wellness activities—all in one intuitive calendar view.',
          'Never miss an important moment. Stay on track with smart notifications and seamless scheduling designed to support your journey to better mental health.',
        ],
      ),
      FeatureSection(
        heading: '🗓️ Calendar Overview',
        paragraphs: [
          'Get a visual snapshot of your entire month at a glance. Our interactive calendar highlights upcoming sessions, personal reminders, and wellness milestones.',
          'Tap any date to see detailed information or add new events. Color-coded entries help you distinguish between therapy sessions, group activities, and personal self-care time.',
        ],
      ),
      FeatureSection(
        heading: '📅 Upcoming Sessions',
        paragraphs: [
          'Stay prepared with a clear list of your scheduled appointments:',
        ],
        bullets: [
          '10 Nov, 2025 – 11:00 AM – Mindfulness Session with Dr. Neha Sharma',
          '12 Nov, 2025 – 6:00 PM – Stress Release Workshop (Group)',
          '15 Nov, 2025 – 9:30 AM – Personal Growth Counselling',
          '18 Nov, 2025 – 2:00 PM – Art Therapy Session',
          '22 Nov, 2025 – 10:00 AM – Monthly Check-in with Dr. Sharma',
        ],
      ),
      FeatureSection(
        heading: '🔔 Smart Reminders',
        paragraphs: [
          'Preparation is key to getting the most from your wellness sessions. Our smart reminder system sends timely notifications so you can arrive calm, focused, and ready.',
          'Enable "Notify me 30 mins before session" to receive gentle alerts. Use this time to review session notes, practice breathing exercises, or simply set your intention for the meeting.',
        ],
        chips: ['30-min alerts', 'Custom timing', 'Do Not Disturb mode'],
      ),
      FeatureSection(
        heading: '➕ Add New Event',
        paragraphs: [
          'Create personalized reminders for meditation, journaling, exercise, or any self-care activity that matters to you.',
          'Simply tap "Add New Event," choose a date and time, set your preferred notification, and let Soul Support keep you accountable to your wellness goals.',
        ],
      ),
      FeatureSection(
        heading: '💚 Stay Consistent, Stay Well',
        paragraphs: [
          'Your wellness journey thrives when you stay consistent. Let Soul Support keep you mindful and on track—one session at a time.',
          'Remember: every step you take towards scheduling your well-being is a step towards a healthier, happier you.',
        ],
      ),
    ],
    'History Center': [
      FeatureSection(
        heading: '📚 Your Wellness Journey Records',
        paragraphs: [
          'Access your complete interaction history with Soul Support. Review past conversations, session records, and payment transactions—all organized for easy reference.',
          'Your history is private, secure, and always available when you need it.',
        ],
      ),
      FeatureSection(
        heading: '💬 Chat History',
        paragraphs: [
          'Browse previous conversations with counsellors and support staff:',
        ],
        bullets: [
          '5 Nov, 2025 – Chat with Dr. Neha Sharma (45 mins)',
          '1 Nov, 2025 – Crisis Support Chat (23 mins)',
          '28 Oct, 2025 – Follow-up Discussion (30 mins)',
          '22 Oct, 2025 – Initial Consultation (60 mins)',
        ],
      ),
      FeatureSection(
        heading: '📞 Call Logs',
        paragraphs: ['Review your phone and video session history:'],
        bullets: [
          '3 Nov, 2025 – Video Call with Dr. Sharma (50 mins)',
          '30 Oct, 2025 – Phone Consultation (25 mins)',
          '25 Oct, 2025 – Emergency Support Call (15 mins)',
        ],
      ),
      FeatureSection(
        heading: '💳 Payment Records',
        paragraphs: ['Track all your transactions and billing history:'],
        bullets: [
          '5 Nov, 2025 – Session Payment – ₹1,200 (Paid)',
          '1 Nov, 2025 – Monthly Subscription – ₹2,500 (Paid)',
          '22 Oct, 2025 – Initial Consultation – ₹800 (Paid)',
        ],
        chips: ['Download receipts', 'Export to PDF', 'Tax statements'],
      ),
    ],
    'Insights & Reports': [
      FeatureSection(
        heading: '📊 Understand Your Progress',
        paragraphs: [
          'Track your mental wellness journey with comprehensive insights and visual reports. See patterns in your mood, identify triggers, and celebrate your growth over time.',
          'Data-driven insights help you and your counsellor make informed decisions about your care plan.',
        ],
      ),
      FeatureSection(
        heading: '📈 Mood Analytics',
        paragraphs: [
          'Visualize your emotional patterns with interactive charts:',
        ],
        bullets: [
          'Weekly mood trends (Last 4 weeks)',
          'Daily emotional check-ins summary',
          'Stress level tracking over time',
          'Sleep quality correlation with mood',
          'Activity impact on well-being',
        ],
        chips: ['Weekly view', 'Monthly view', 'Custom range'],
      ),
      FeatureSection(
        heading: '📝 Session Summaries',
        paragraphs: ['Review key takeaways from your counselling sessions:'],
        bullets: [
          'Nov 10 Session: Identified work-related stress triggers, practiced grounding techniques',
          'Nov 3 Session: Discussed boundary-setting strategies, homework assigned',
          'Oct 28 Session: Progress on anxiety management, introduced mindfulness exercises',
        ],
      ),
      FeatureSection(
        heading: '🎯 Goal Tracking',
        paragraphs: ['Monitor progress towards your wellness goals:'],
        bullets: [
          'Daily Meditation: 18/30 days completed this month ✅',
          'Journaling Practice: 12/15 entries this month ✅',
          'Sleep Schedule: 85% consistency rate 🌙',
          'Social Connection: 3 meaningful conversations this week 💬',
        ],
      ),
      FeatureSection(
        heading: '📥 Export & Share',
        paragraphs: [
          'Generate detailed reports for yourself or your healthcare provider. Export data as PDF or share secure links with your counsellor for more personalized care.',
        ],
        chips: ['PDF export', 'Share with counsellor', 'Print reports'],
      ),
    ],
    'MindCare Booster': [
      FeatureSection(
        heading: '⚡ Quick Wellness Tools',
        paragraphs: [
          'Need immediate support? MindCare Booster offers instant access to evidence-based techniques for managing stress, anxiety, and difficult emotions.',
          'These tools are designed to help you feel better right now—use them anytime, anywhere.',
        ],
      ),
      FeatureSection(
        heading: '🧘 Breathing Exercises',
        paragraphs: [
          'Calm your nervous system with guided breathing techniques:',
        ],
        bullets: [
          'Box Breathing (4-4-4-4) – Reduce anxiety in 2 minutes',
          '4-7-8 Technique – Prepare for restful sleep',
          'Deep Belly Breathing – Release tension and stress',
          'Energizing Breath – Boost focus and alertness',
        ],
        chips: ['2-min sessions', 'Audio guidance', 'Custom timers'],
      ),
      FeatureSection(
        heading: '🎧 Calming Audio',
        paragraphs: ['Soothing soundscapes and guided meditations:'],
        bullets: [
          'Nature Sounds: Rain, Ocean Waves, Forest Ambience',
          'Guided Relaxation: Body Scan (10 mins)',
          'Sleep Stories: Peaceful narratives for bedtime',
          'Focus Music: Lo-fi beats for concentration',
        ],
      ),
      FeatureSection(
        heading: '✍️ Quick Journaling Prompts',
        paragraphs: ['Express your feelings with helpful prompts:'],
        bullets: [
          'What am I grateful for right now?',
          'What emotion am I feeling, and where do I feel it in my body?',
          'What would I tell a friend feeling this way?',
          'What small step can I take today to feel better?',
        ],
      ),
      FeatureSection(
        heading: '🌟 Positive Affirmations',
        paragraphs: [
          'Shift your mindset with empowering daily affirmations tailored to your wellness goals. Receive gentle reminders that you are capable, worthy, and supported.',
        ],
        chips: [
          'Daily notifications',
          'Custom affirmations',
          'Share favorites',
        ],
      ),
    ],
    'My Wellness Plan': [
      FeatureSection(
        heading: '📋 Your Personalized Care Roadmap',
        paragraphs: [
          'Work with your counsellor to build a comprehensive wellness plan tailored to your unique needs, goals, and circumstances.',
          'Your plan evolves with you—update it anytime as you grow and your priorities shift.',
        ],
      ),
      FeatureSection(
        heading: '🎯 Current Goals',
        bullets: [
          'Reduce work-related anxiety through boundary-setting',
          'Establish consistent sleep schedule (11 PM – 7 AM)',
          'Practice mindfulness meditation 10 mins daily',
          'Reconnect with 2 close friends each week',
          'Limit social media to 30 mins per day',
        ],
      ),
      FeatureSection(
        heading: '💊 Treatment Plan',
        paragraphs: [
          'Collaborative care strategies agreed upon with your provider:',
        ],
        bullets: [
          'Weekly therapy sessions (Cognitive Behavioral Therapy)',
          'Daily mood tracking and journaling',
          'Medication management (if prescribed by psychiatrist)',
          'Monthly progress reviews',
        ],
      ),
      FeatureSection(
        heading: '📚 Recommended Resources',
        bullets: [
          'Book: "The Anxiety Toolkit" by Alice Boyes',
          'App: Headspace for guided meditation',
          'Podcast: "The Happiness Lab" with Dr. Laurie Santos',
          'Article: Understanding triggers and coping mechanisms',
        ],
      ),
      FeatureSection(
        heading: '🔄 Progress Check-ins',
        paragraphs: [
          'Regular assessments help you and your counsellor evaluate what\'s working and adjust your plan as needed.',
        ],
        chips: ['Weekly reviews', 'Monthly summaries', 'Goal adjustments'],
      ),
    ],
    'Journal': [
      FeatureSection(
        heading: '✍️ Your Private Reflection Space',
        paragraphs: [
          'Journaling is a powerful tool for self-discovery, emotional processing, and mental clarity. Use this space to express your thoughts, track your moods, and explore your inner world.',
          'All entries are private and secure. Write freely, without judgment.',
        ],
      ),
      FeatureSection(
        heading: '📖 Recent Entries',
        bullets: [
          'Nov 5, 2025 – Feeling grateful today. Had a breakthrough in therapy about setting boundaries.',
          'Nov 3, 2025 – Struggled with work stress. Used breathing exercises and felt better.',
          'Oct 30, 2025 – Good sleep last night. Morning meditation helped start the day calm.',
          'Oct 28, 2025 – Anxious about upcoming presentation. Reminded myself of past successes.',
        ],
      ),
      FeatureSection(
        heading: '💭 Writing Prompts',
        paragraphs: ['Not sure where to start? Try these prompts:'],
        bullets: [
          'What brought me joy today?',
          'What challenge did I face, and how did I respond?',
          'What am I learning about myself right now?',
          'What do I need to let go of?',
          'What am I proud of this week?',
        ],
      ),
      FeatureSection(
        heading: '🎨 Mood Tracking',
        paragraphs: [
          'Tag each entry with your current mood and notice patterns over time:',
        ],
        chips: [
          'Happy',
          'Calm',
          'Anxious',
          'Sad',
          'Energized',
          'Tired',
          'Grateful',
        ],
      ),
      FeatureSection(
        heading: '🔒 Privacy & Security',
        paragraphs: [
          'Your journal is encrypted and accessible only to you. Optionally share specific entries with your counsellor to enhance your therapy sessions.',
        ],
      ),
    ],
    'Professional Guidance': [
      FeatureSection(
        heading: '👥 Connect with Expert Counsellors',
        paragraphs: [
          'Get personalized support from licensed mental health professionals who understand your unique challenges and goals.',
          'Our counsellors specialize in anxiety, depression, stress management, relationship issues, and more.',
        ],
      ),
      FeatureSection(
        heading: '🩺 Meet Our Therapists',
        bullets: [
          'Dr. Neha Sharma – Clinical Psychologist (CBT, Anxiety, Depression)',
          'Dr. Rajesh Kumar – Psychiatrist (Medication Management)',
          'Ms. Priya Desai – Licensed Counsellor (Relationships, Family)',
          'Dr. Amit Verma – Trauma Specialist (PTSD, Grief)',
        ],
      ),
      FeatureSection(
        heading: '📞 Session Options',
        paragraphs: ['Choose the format that works best for you:'],
        bullets: [
          'Video Call – Face-to-face from home',
          'Phone Call – Convenient audio sessions',
          'Chat Messaging – Text-based support',
          'In-Person – Office visits (select locations)',
        ],
        chips: ['50-min sessions', 'Flexible scheduling', 'Same-day slots'],
      ),
      FeatureSection(
        heading: '💰 Transparent Pricing',
        bullets: [
          'Initial Consultation: ₹800 (45 mins)',
          'Follow-up Sessions: ₹1,200 per session',
          'Monthly Unlimited: ₹4,500 (up to 4 sessions)',
          'Crisis Support: Available 24/7',
        ],
      ),
      FeatureSection(
        heading: '🎓 Qualifications',
        paragraphs: [
          'All counsellors are licensed, insured, and undergo continuous training. We verify credentials and prioritize your safety and confidentiality.',
        ],
      ),
    ],
    'Schedule Session': [
      FeatureSection(
        heading: '📅 Book Your Next Session',
        paragraphs: [
          'Ready to take the next step? Schedule a session with one of our expert counsellors at a time that works for you.',
          'Choose your preferred therapist, date, time, and session format—all in just a few taps.',
        ],
      ),
      FeatureSection(
        heading: '🔍 Find Your Counsellor',
        paragraphs: ['Browse by specialty, availability, or rating:'],
        bullets: [
          'Dr. Neha Sharma – ⭐ 4.9/5 – Next available: Nov 8, 2:00 PM',
          'Ms. Priya Desai – ⭐ 4.8/5 – Next available: Nov 9, 10:00 AM',
          'Dr. Amit Verma – ⭐ 4.9/5 – Next available: Nov 10, 4:00 PM',
        ],
      ),
      FeatureSection(
        heading: '🕐 Pick Your Time',
        paragraphs: [
          'Select from available slots that fit your schedule. Morning, afternoon, evening, and weekend options available.',
        ],
        chips: ['Morning slots', 'Evening slots', 'Weekend available'],
      ),
      FeatureSection(
        heading: '💬 Session Type',
        bullets: [
          'Video Call (most popular)',
          'Phone Call',
          'Chat Session',
          'In-Person (select locations)',
        ],
      ),
      FeatureSection(
        heading: '✅ Confirm & Prepare',
        paragraphs: [
          'After booking, you\'ll receive a confirmation email with session details and a calendar invite. You can reschedule up to 24 hours before your appointment.',
        ],
      ),
    ],
    'Mental Health': [
      FeatureSection(
        heading: '🧠 Understanding Mental Wellness',
        paragraphs: [
          'Mental health is just as important as physical health. Learn about common conditions, coping strategies, and resources to support your journey.',
          'Knowledge is power—understanding what you\'re experiencing is the first step toward healing.',
        ],
      ),
      FeatureSection(
        heading: '📚 Common Topics',
        bullets: [
          'Anxiety & Panic Disorders – Symptoms, causes, and treatment',
          'Depression – Recognizing signs and seeking help',
          'Stress Management – Healthy coping techniques',
          'Sleep Disorders – Tips for better rest',
          'Relationship Issues – Communication and boundaries',
          'Self-Esteem & Confidence – Building a positive self-image',
        ],
      ),
      FeatureSection(
        heading: '🎥 Educational Content',
        paragraphs: ['Explore articles, videos, and expert interviews:'],
        bullets: [
          'Video: "Understanding Anxiety" – Dr. Neha Sharma (12 mins)',
          'Article: "10 Evidence-Based Ways to Reduce Stress"',
          'Podcast: "Mental Health Myths Debunked"',
          'Infographic: "The Mind-Body Connection"',
        ],
      ),
      FeatureSection(
        heading: '🆘 Crisis Resources',
        paragraphs: ['If you\'re in crisis or need immediate help:'],
        bullets: [
          'National Suicide Prevention Lifeline: 1800-273-8255',
          'Crisis Text Line: Text HOME to 741741',
          'Soul Support 24/7 Emergency Chat',
        ],
        chips: ['24/7 support', 'Confidential', 'Free resources'],
      ),
    ],
    'Expert Connect': [
      FeatureSection(
        heading: '🌟 Direct Access to Specialists',
        paragraphs: [
          'Sometimes you need more than a regular therapy session. Expert Connect puts you in touch with specialized professionals for second opinions, complex cases, or specific expertise.',
          'Get answers from psychiatrists, clinical psychologists, trauma specialists, and more.',
        ],
      ),
      FeatureSection(
        heading: '👨‍⚕️ Our Expert Panel',
        bullets: [
          'Dr. Anjali Mehta – Psychiatrist (Medication, Diagnosis)',
          'Dr. Vikram Singh – Trauma & PTSD Specialist',
          'Dr. Kavita Rao – Eating Disorder Specialist',
          'Dr. Suresh Iyer – Addiction Counsellor',
          'Dr. Meera Patel – Child & Adolescent Psychologist',
        ],
      ),
      FeatureSection(
        heading: '💡 When to Use Expert Connect',
        bullets: [
          'Need a second opinion on diagnosis or treatment',
          'Experiencing complex or treatment-resistant symptoms',
          'Require specialized therapy (EMDR, DBT, etc.)',
          'Questions about medication options',
          'Seeking advanced assessment or testing',
        ],
      ),
      FeatureSection(
        heading: '📞 Consultation Process',
        paragraphs: [
          'Submit your request with details about your concern. Our team will match you with the most appropriate expert within 24-48 hours.',
        ],
        chips: ['48-hour response', 'Secure messaging', 'Insurance accepted'],
      ),
    ],
    'Meditation': [
      FeatureSection(
        heading: '🧘 Guided Mindfulness Practices',
        paragraphs: [
          'Meditation is a proven way to reduce stress, improve focus, and enhance emotional well-being. Our library of guided meditations is perfect for beginners and experienced practitioners alike.',
          'Start with just 5 minutes a day and build your practice over time.',
        ],
      ),
      FeatureSection(
        heading: '🎧 Meditation Library',
        bullets: [
          'Morning Mindfulness (10 mins) – Start your day centered',
          'Body Scan Relaxation (15 mins) – Release physical tension',
          'Loving-Kindness Meditation (12 mins) – Cultivate compassion',
          'Sleep Meditation (20 mins) – Drift into restful sleep',
          'Anxiety Relief (8 mins) – Calm racing thoughts',
          'Focus & Productivity (10 mins) – Enhance concentration',
        ],
      ),
      FeatureSection(
        heading: '📊 Track Your Practice',
        paragraphs: ['See your progress over time:'],
        bullets: [
          'Total meditation minutes: 340 mins this month',
          'Current streak: 12 days 🔥',
          'Longest streak: 18 days',
          'Favorite session: Loving-Kindness Meditation',
        ],
        chips: ['Daily reminders', 'Progress badges', 'Share achievements'],
      ),
      FeatureSection(
        heading: '🌱 Meditation Courses',
        paragraphs: ['Structured programs for deeper learning:'],
        bullets: [
          'Meditation for Beginners (7-day course)',
          'Managing Anxiety with Mindfulness (14 days)',
          'Sleep Better with Evening Meditation (10 days)',
          'Building Self-Compassion (21 days)',
        ],
      ),
    ],
    'Support Groups': [
      FeatureSection(
        heading: '🤝 Connect with Others on Similar Journeys',
        paragraphs: [
          'You\'re not alone. Support groups provide a safe, confidential space to share experiences, learn from others, and build meaningful connections.',
          'Our moderated groups are led by trained facilitators and follow community guidelines to ensure a respectful, supportive environment.',
        ],
      ),
      FeatureSection(
        heading: '👥 Available Groups',
        bullets: [
          'Anxiety Support Circle – Mondays, 7:00 PM (15 members)',
          'Depression Recovery Group – Wednesdays, 6:30 PM (12 members)',
          'LGBTQ+ Wellness Group – Thursdays, 8:00 PM (18 members)',
          'New Parents Support – Saturdays, 10:00 AM (10 members)',
          'Chronic Illness Coping – Fridays, 5:00 PM (8 members)',
        ],
      ),
      FeatureSection(
        heading: '📅 How It Works',
        bullets: [
          'Join a group that fits your needs',
          'Attend weekly video or chat sessions (60-90 mins)',
          'Share as much or as little as you\'re comfortable with',
          'Learn coping strategies from peers and facilitators',
          'Optional: Connect with members between sessions',
        ],
      ),
      FeatureSection(
        heading: '🔒 Privacy & Safety',
        paragraphs: [
          'All group sessions are confidential. Members agree to respect privacy and follow our community guidelines. Facilitators monitor discussions to ensure a safe space for everyone.',
        ],
        chips: ['Free to join', 'Moderated', 'All welcome'],
      ),
    ],
    'Advanced Care Support': [
      FeatureSection(
        heading: '🏥 Comprehensive Care Coordination',
        paragraphs: [
          'For complex mental health needs, Advanced Care Support provides coordinated services including psychiatric care, intensive therapy, crisis intervention, and care management.',
          'Our team works together to create a holistic treatment plan tailored to your unique situation.',
        ],
      ),
      FeatureSection(
        heading: '🩺 Services Included',
        bullets: [
          'Psychiatric evaluation and medication management',
          'Intensive outpatient therapy (multiple sessions per week)',
          'Crisis intervention and safety planning',
          'Care coordination with other healthcare providers',
          'Family therapy and support',
          'Substance abuse counselling',
        ],
      ),
      FeatureSection(
        heading: '👨‍⚕️ Multidisciplinary Team',
        paragraphs: ['Your care team may include:'],
        bullets: [
          'Psychiatrist – Diagnosis, medication',
          'Clinical Psychologist – Therapy, assessment',
          'Licensed Counsellor – Talk therapy, support',
          'Care Manager – Coordination, resources',
          'Peer Support Specialist – Lived experience guidance',
        ],
      ),
      FeatureSection(
        heading: '📋 Eligibility',
        paragraphs: [
          'Advanced Care Support is designed for individuals with moderate to severe mental health conditions, those requiring frequent monitoring, or anyone needing a higher level of care.',
        ],
        chips: [
          'Insurance accepted',
          'Sliding scale fees',
          'Financial aid available',
        ],
      ),
      FeatureSection(
        heading: '📞 Get Started',
        paragraphs: [
          'Contact our intake team for a confidential assessment. We\'ll help determine if Advanced Care Support is the right fit and guide you through enrollment.',
        ],
      ),
    ],
    'Recharge Room': [
      FeatureSection(
        heading: '🌈 Your Digital Sanctuary',
        paragraphs: [
          'Need a quick mental break? The Recharge Room offers calming visuals, soothing sounds, and interactive relaxation tools to help you reset and recharge.',
          'Perfect for a 5-minute break at work, a moment of peace during a busy day, or whenever you need to ground yourself.',
        ],
      ),
      FeatureSection(
        heading: '🎨 Relaxation Modes',
        bullets: [
          'Ocean Waves – Watch and listen to gentle waves (with animation)',
          'Forest Walk – Immersive nature soundscape with visuals',
          'Starry Night – Calming space scene with ambient music',
          'Rainy Day – Cozy rain sounds with window view',
          'Zen Garden – Interactive sand patterns and chimes',
        ],
      ),
      FeatureSection(
        heading: '🌀 Interactive Tools',
        bullets: [
          'Breathing Bubble – Follow the expanding circle to breathe',
          'Color Therapy – Tap to change soothing color palettes',
          'Relaxing Games – Simple, meditative puzzles',
          'Affirmation Cards – Tap for a positive message',
        ],
      ),
      FeatureSection(
        heading: '⏱️ Quick Sessions',
        paragraphs: ['Set a timer for your break:'],
        chips: ['2 minutes', '5 minutes', '10 minutes', 'Custom'],
      ),
      FeatureSection(
        heading: '💡 How to Use',
        paragraphs: [
          'Choose your favorite mode, put on headphones if possible, and let yourself relax. You can combine visuals with breathing exercises or simply watch and listen. There\'s no wrong way to recharge.',
        ],
      ),
    ],
    'Guidelines': [
      FeatureSection(
        heading: '📖 Soul Support Community Guidelines',
        paragraphs: [
          'Soul Support is a safe, inclusive, and supportive space for everyone on their mental wellness journey. Please read and follow these guidelines to help us maintain a positive environment.',
        ],
      ),
      FeatureSection(
        heading: '✅ Do',
        bullets: [
          'Treat everyone with respect and kindness',
          'Share your experiences honestly and authentically',
          'Respect confidentiality and privacy',
          'Use trigger warnings when discussing sensitive topics',
          'Report concerning behaviour to moderators',
          'Seek professional help if you\'re in crisis',
        ],
      ),
      FeatureSection(
        heading: '❌ Don\'t',
        bullets: [
          'Give medical advice or suggest stopping medication',
          'Share graphic details of self-harm or suicide methods',
          'Harass, bully, or discriminate against others',
          'Share others\' private information',
          'Promote products, services, or MLM schemes',
          'Use the platform for dating or romantic pursuits',
        ],
      ),
      FeatureSection(
        heading: '🔒 Privacy & Safety',
        paragraphs: [
          'Your safety is our priority. All interactions are monitored by trained moderators. Report any violations immediately.',
        ],
        chips: ['Report abuse', '24/7 moderation', 'Block users'],
      ),
      FeatureSection(
        heading: '⚖️ Consequences',
        paragraphs: [
          'Violations may result in warnings, temporary suspension, or permanent ban depending on severity. We want everyone to feel safe and supported.',
        ],
      ),
    ],
  };

  static List<FeatureSection> _getDefaultContent(String featureName) {
    return [
      FeatureSection(
        heading: featureName,
        paragraphs: [
          'Welcome to $featureName. This feature is designed to support your mental wellness journey.',
          'Explore the options available and reach out to our support team if you have questions.',
        ],
      ),
    ];
  }
}
