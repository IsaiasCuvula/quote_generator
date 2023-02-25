import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

@immutable
class QuoteModel {
  static const items = [
    QuoteCard(
      backgroundColor: Colors.purple,
      quoteText: """Created By You Screen \nCreated By 
          You Screen \nCreated By You Screen
          """,
    ),
    QuoteCard(
      backgroundColor: Colors.green,
      quoteText: 'Created By You Screen',
    ),
    QuoteCard(
      backgroundColor: Colors.red,
      quoteText: 'Created By You Screen',
    ),
    QuoteCard(
      backgroundColor: Colors.orange,
      quoteText: """Created By You Screen Created By
          You Screen Created By You Screen Created By
          You Screen Created By You Screen
          Created By You Screen""",
    ),
    QuoteCard(
      backgroundColor: Colors.teal,
      quoteText: """Created By You Screen Created By
          You Screen Created By You Screen Created By
          You Screen Created By You Screen """,
    ),
    QuoteCard(
      backgroundColor: Colors.blueGrey,
      quoteText: 'Created By You Screen',
    ),
    QuoteCard(
      backgroundColor: Colors.pink,
      quoteText: 'Created By You Screen',
    ),
  ];
}
