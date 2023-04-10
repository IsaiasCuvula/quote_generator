import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/config/theme/theme.dart';
import 'package:quote_generator/translations/l10n.dart';

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
    final theme = Theme.of(context);
    return Container(
      height: Dimensions.sizeLargest,
      margin: Dimensions.kPaddingAllLarger,
      child: TextField(
        controller: searchController,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          contentPadding: Dimensions.kPaddingAllLarger,
          hintText: context.l10n.search_quote_hintText,
          alignLabelWithHint: true,
          prefixIcon: const Padding(
            padding: Dimensions.kPaddingSearchTextField,
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () => searchController.clear(),
            icon: const FaIcon(FontAwesomeIcons.xmark),
          ),
          border: OutlineInputBorder(
            borderRadius: Dimensions.kBorderRadiusAllLarge,
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: theme.colorScheme.onSecondary,
        ),
      ),
    );
  }
}
