import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/common/l10n/l10n.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.searchController,
    required this.onChanged,
    required this.onSubmitted,
  }) : super(key: key);

  final TextEditingController searchController;
  final Function(String text) onChanged;
  final Function(String text) onSubmitted;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      height: Dimensions.sizeLargest,
      margin: Dimensions.kPaddingAllLarger,
      child: TextField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: searchController,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          contentPadding: Dimensions.kPaddingAllLarger,
          hintText: l10n.searchQuoteHintText,
          alignLabelWithHint: true,
          prefixIcon: const Padding(
            padding: Dimensions.kPaddingSearchTextField,
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
          suffixIcon: Consumer(builder: (ctx, ref, child) {
            return IconButton(
              onPressed: () {
                searchController.clear();
                ref
                    .read(searchQuoteProvider.notifier)
                    .clearSearchedQuotesEvent();
              },
              icon: const FaIcon(FontAwesomeIcons.xmark),
            );
          }),
          border: OutlineInputBorder(
            borderRadius: Dimensions.kBorderRadiusAllLarge,
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: context.colorScheme.onSecondary,
        ),
      ),
    );
  }
}
