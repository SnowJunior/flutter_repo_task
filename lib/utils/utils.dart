import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/web.dart';

CachedNetworkImage getCachedNetworkImage({
  required BuildContext context,
  required String imageUrl,
}) {
  final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  return CachedNetworkImage(
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    imageUrl: imageUrl,
    width: 60,
    height: 60,
    maxHeightDiskCache: (200 * devicePixelRatio).round(),
    maxWidthDiskCache: (200 * devicePixelRatio).round(),
    memCacheHeight: (200 * devicePixelRatio).round(),
    memCacheWidth: (200 * devicePixelRatio).round(),
    fit: BoxFit.cover,
  );
}

// capitalize word
String capitalize(String word) {
  if (word.isEmpty) return word;
  return word[0].toUpperCase() + word.substring(1);
}

String formatDate(String createdAt) {
  DateTime transactionDate = DateTime.parse(createdAt).toLocal();

  return DateFormat("MMM d, y").format(transactionDate);
}

void logThis(dynamic message, {LogFilter? filter}) {
  final Logger logger = Logger(
    filter: filter,
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      colors: true,
      printEmojis: true,
      lineLength: 120,
    ),
  );

  // only show logs if the mode is development
  if (kDebugMode) {
    logger.d(message);
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
}
