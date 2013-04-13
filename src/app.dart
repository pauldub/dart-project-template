import 'dart:async';
import 'dart:html';
import 'package:web_ui/web_ui.dart';

// Import libraries

main() {
  init().then((_) => print("Ready!")).catchError(print);
}

Future init() {
  return new Future.delayed(Duration.ZERO, () {
		// App initialization
  })
  .catchError((e) => print("Problem in init: $e"));
}
