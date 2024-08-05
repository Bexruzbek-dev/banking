import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const HistoryCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Check if the date field is a Timestamp or a DateTime
    DateTime date;
    if (data['date'] is DateTime) {
      date = data['date'];
    } else if (data['date'] is Timestamp) {
      date = (data['date'] as Timestamp).toDate();
    } else {
      // Handle other cases or throw an error
      throw Exception('Invalid date format');
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${data['fromCard']} → ${data['toCard']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  DateFormat('MMM d, y').format(date),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Amount: ${data['amount']}',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 8),
            Text(
              DateFormat('h:mm a').format(date),
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
