import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LoggedPage extends StatefulWidget {
  const LoggedPage({super.key});

  @override
  State<LoggedPage> createState() => _LoggedPageState();
}

class _LoggedPageState extends State<LoggedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CachedNetworkImage(
          imageUrl: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? 'https://d3ebnpochj0915.cloudfront.net/logo_dev_white.png'
              : 'https://d3ebnpochj0915.cloudfront.net/logo_dev_black.png',
        ),
      ),
    );
  }
}
