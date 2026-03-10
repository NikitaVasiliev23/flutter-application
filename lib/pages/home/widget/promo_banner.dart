import 'package:flutter/material.dart';

class PromoBannerWidget extends StatelessWidget {
  const PromoBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 140),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage('assets/images/Banner_1.png'),
          fit: BoxFit.cover,
          opacity: 0.8,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TagBanner(), 
            SizedBox(height: 8),
            TextBanner()],
        ),
      ),
    );
  }
}

class TagBanner extends StatelessWidget {
  const TagBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Акция',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TextBanner extends StatelessWidget {
  const TextBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Купи один и получи один бесплатно',
      style: TextStyle(
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
