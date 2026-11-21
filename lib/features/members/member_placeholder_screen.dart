import 'package:flutter/material.dart';

class MemberPlaceholderScreen extends StatelessWidget {
  final int memberNumber;
  final String memberName;

  const MemberPlaceholderScreen({
    super.key,
    required this.memberNumber,
    required this.memberName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101A35),
        foregroundColor: Colors.white,
        title: Text(memberName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_outline_rounded,
              size: 90,
              color: Color(0xFF5577F7),
            ),
            const SizedBox(height: 20),
            Text(
              memberName,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Member $memberNumber',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Individual bio screen will be integrated here.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}