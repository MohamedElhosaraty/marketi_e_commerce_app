import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
  });

  final Function(String)? onChanged;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText ?? "Search",
        hintStyle: const TextStyle(color: Colors.black12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        prefixIcon: prefixIcon ??
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                'AppAssets.searchIcon',
                width: 16,
                height: 16,
              ),
            ),
      ),
    );
  }
}
