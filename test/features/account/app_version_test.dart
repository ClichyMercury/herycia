import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/mock_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => PackageInfo.setMockInitialValues(
        appName: 'Herycia',
        packageName: 'com.example.herycia',
        version: '1.1.0',
        buildNumber: '2',
        buildSignature: '',
      ));

  testWidgets('la version de l’app apparaît en bas du profil et dans « À propos »', (tester) async {
    final harness = MockApiHarness(await MockApiHarness.fixtures());
    await pumpFullApp(tester, harness, location: '/profile');
    await scrollTo(tester, find.byKey(const ValueKey('profile-version')));
    expect(find.text('Herycia 1.1.0 (2)'), findsOneWidget);

    await pumpFullApp(tester, harness, location: '/profile/about');
    expect(find.text('Version 1.1.0 (2)'), findsOneWidget);
  });
}
