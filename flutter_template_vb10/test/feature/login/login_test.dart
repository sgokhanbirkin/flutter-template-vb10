// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {
    print('Here');
  });

  test('User Login Fail Test', () {
    const isUserLogin = true;
    expect(isUserLogin, isTrue);
  });

  group("User Login Full Test", () {
    //Mark : Test Case 1
    test('User Login Fail Test', () {
      const isUserLogin = true;
      expect(isUserLogin, isTrue);
    });
    //Mark : Test Case 2
    test('User Login Fail Test', () {
      const isUserLogin = true;
      expect(isUserLogin, isTrue);
    });
    //Mark : Test Case 3
    test('User Login Fail Test', () {
      const isUserLogin = true;
      expect(isUserLogin, isTrue);
    });
  });

  //MARK: - Test Case
}
