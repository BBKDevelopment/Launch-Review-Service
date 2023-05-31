import 'dart:developer';

import 'package:launch_review/launch_review.dart';

/// An exception thrown when the launch review fails.
class LaunchReviewException implements Exception {}

/// {@template launch_review_service}
/// A service that provides review functionality by launching the related store.
///
/// This service uses the `launch_review` package.
///
/// ```dart
/// final lauchReviewService = LauchReviewService(
///  androidAppId: kAndroidAppId,
///  iOSAppId: kIOSAppId,
/// );
/// ```
/// {@endtemplate}
class LaunchReviewService {
  /// {@macro launch_review_service}
  const LaunchReviewService({
    String? androidAppId,
    String? iOSAppId,
  })  : _androidAppId = androidAppId,
        _iOSAppId = iOSAppId;

  final String? _androidAppId;
  final String? _iOSAppId;

  /// Launches the app store page for this app.
  ///
  /// Throws a [LaunchReviewException] if the launch review fails.
  Future<void> launch() async {
    try {
      await LaunchReview.launch(
        androidAppId: _androidAppId,
        iOSAppId: _iOSAppId,
      );
    } catch (_) {
      log('Failed to launch review!', name: 'LauchReviewService');
      throw LaunchReviewException();
    }
  }
}
