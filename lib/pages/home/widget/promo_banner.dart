import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PromoBannerWidget extends StatelessWidget {
  const PromoBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 140),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/Banner_1.png'),
          fit: BoxFit.cover,
          opacity: 0.8,
        ),
      ),

      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_TagBanner(), SizedBox(height: 8), _TextBanner()],
        ),
      ),
    );
  }
}

class _TagBanner extends StatelessWidget {
  const _TagBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        AppLocalizations.of(context)!.promoBannerTag,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _TextBanner extends StatelessWidget {
  const _TextBanner();

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.promoBannerText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            offset: Offset(5, 5),
            color: Color.fromRGBO(17, 17, 17, 1),
            blurRadius: 5,
          ),
        ],
      ),
    );
  }
}
