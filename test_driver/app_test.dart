import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Todo App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.

    //login screen
    final usernameField = find.byValueKey('Email');
    final passwordField = find.byValueKey('Password');
    final signInButton = find.byValueKey('Sign in');


    late FlutterDriver driver;

    Future<bool> isPresent(SerializableFinder byValueKey,
        {Duration timeout = const Duration(seconds: 1)}) async {
      try {
        await driver.waitFor(byValueKey, timeout: timeout);
        return true;
      } catch (exception) {
        return false;
      }
    }

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('login', () async {
      // if (await isPresent(signOutButton)) {
      //   await driver.tap(signOutButton);
      // }

      await driver.tap(usernameField);
      await driver.enterText("tadas1@gmail.com");

      await driver.tap(passwordField);
      await driver.enterText("123456rghgj");

      await driver.tap(signInButton);
      await driver.waitFor(find.text("Featured"));
    });





  });
}