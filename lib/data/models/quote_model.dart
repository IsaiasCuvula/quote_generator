import 'package:flutter/material.dart';
import 'package:quote_generator/presentation/widgets/widgets.dart';

@immutable
class QuoteModel {
  static const itemsFav = <QuoteCard>[];
  static const items = [
    QuoteCard(
      backgroundColor: Colors.purple,
      author: 'Isaias Cuvula',
      quoteText: """Created By You Screen \nCreated By 
          You Screen \nCreated By You Screen
          """,
    ),
    QuoteCard(
      backgroundColor: Colors.green,
      author: 'Isaias Cuvula',
      quoteText: 'Created By You Screen',
    ),
    QuoteCard(
      backgroundColor: Colors.red,
      author: 'Isaias Cuvula',
      quoteText: 'Created By You Screen',
    ),
    QuoteCard(
      backgroundColor: Colors.orange,
      author: 'Isaias Cuvula',
      quoteText: """Created By You Screen Created By
          You Screen Created By You Screen
          Created By You Screen""",
    ),
    QuoteCard(
      backgroundColor: Colors.teal,
      author: 'Isaias Cuvula',
      quoteText: """Created By You Screen Created By
          You Screen Created By You Screen Created By
          You Screen Created By You Screen """,
    ),
    QuoteCard(
      backgroundColor: Colors.blueGrey,
      author: 'Isaias Cuvula',
      quoteText: 'Created By You Screen',
    ),
    QuoteCard(
      backgroundColor: Colors.pink,
      author: 'Isaias Cuvula',
      quoteText: 'Created By You Screen Created By You Screen',
    ),
  ];
}
