import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onSearchChange;
  final Function() sortPriseer;
  final String searchQuery;

  const SearchBarWidget({
    required this.sortPriseer,
    required this.onSearchChange,
    required this.searchQuery,
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  void _clearSearch() {
    _controller.clear();
    widget.onSearchChange('');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchBar(
            controller: _controller,
            hintText: AppLocalizations.of(context)!.searchBarText,
            hintStyle: WidgetStateProperty.all(
              const TextStyle(color: Colors.white),
            ),
            leading: const Icon(Icons.search, color: Colors.white),
            backgroundColor: WidgetStateProperty.all(
              const Color.fromRGBO(17, 17, 17, 1),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
            ),

            textStyle: WidgetStateProperty.all(
              const TextStyle(color: Colors.white),
            ),
            onChanged: widget.onSearchChange,
            onSubmitted: widget.onSearchChange,
            trailing: widget.searchQuery.isEmpty
                ? null
                : [
                    IconButton(
                      onPressed: _clearSearch,
                      icon: const Icon(Icons.clear),
                      color: Colors.white,
                    ),
                  ],
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: widget.sortPriseer,
            icon: const Icon(Icons.filter_list, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
