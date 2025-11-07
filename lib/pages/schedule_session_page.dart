import 'package:flutter/material.dart';

class ScheduleSessionPage extends StatefulWidget {
  const ScheduleSessionPage({super.key});

  @override
  State<ScheduleSessionPage> createState() => _ScheduleSessionPageState();
}

class _ScheduleSessionPageState extends State<ScheduleSessionPage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedCounsellor;

  final List<String> _counsellors = const [
    'Alex Johnson',
    'Priya Singh',
    'David Chen',
    'Maria Rodriguez',
  ];

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.teal),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.teal),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  void _saveSession() {
    if (_selectedDate == null ||
        _selectedTime == null ||
        _selectedCounsellor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a date, a time, and a counsellor.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Session with $_selectedCounsellor on '
          '${_formatDate(_selectedDate!)} at ${_selectedTime!.format(context)} saved!',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );

    setState(() {
      _selectedDate = null;
      _selectedTime = null;
      _selectedCounsellor = null;
    });
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Schedule Session'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plan your counselling session',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.teal.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Choose a convenient date, time, and counsellor to get started.',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 32),
            _FormCard(
              children: [
                _InputLabel(title: 'Date'),
                _SelectorButton(
                  label: _selectedDate != null
                      ? _formatDate(_selectedDate!)
                      : 'Select date',
                  icon: Icons.calendar_today,
                  onPressed: _pickDate,
                ),
                const SizedBox(height: 20),
                _InputLabel(title: 'Time'),
                _SelectorButton(
                  label: _selectedTime != null
                      ? _selectedTime!.format(context)
                      : 'Select time',
                  icon: Icons.access_time,
                  onPressed: _pickTime,
                ),
                const SizedBox(height: 20),
                _InputLabel(title: 'Counsellor'),
                DropdownButtonFormField<String>(
                  value: _selectedCounsellor,
                  decoration: _dropdownDecoration(),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.teal),
                  style: Theme.of(context).textTheme.bodyLarge,
                  items: _counsellors
                      .map(
                        (counsellor) => DropdownMenuItem(
                          value: counsellor,
                          child: Text(counsellor),
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _selectedCounsellor = value),
                ),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveSession,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Add New Event',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.teal.shade100),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.teal, width: 2),
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  const _FormCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _InputLabel extends StatelessWidget {
  const _InputLabel({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade800,
      ),
    );
  }
}

class _SelectorButton extends StatelessWidget {
  const _SelectorButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal.shade50,
        foregroundColor: Colors.teal.shade700,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Icon(icon),
        ],
      ),
    );
  }
}
