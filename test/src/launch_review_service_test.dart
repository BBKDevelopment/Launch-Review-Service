import 'package:flutter_test/flutter_test.dart';
import 'package:launch_review_service/launch_review_service.dart';

void main() {
  late final LaunchReviewService sut;

  setUpAll(() {
    sut = const LaunchReviewService(
      androidAppId: 'androidAppId',
      iOSAppId: 'iOSAppId',
    );
  });

  group('LaunchReviewService', () {
    test('can be instantiated', () {
      expect(const LaunchReviewService(), isNotNull);
    });

    test('can throw LaunchReviewException when could not launch the store',
        () async {
      expect(() => sut.launch(), throwsA(isA<LaunchReviewException>()));
    });
  });
}
