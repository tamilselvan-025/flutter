import 'package:flutter/foundation.dart';

void main() {
  String longMessage = ' This is a very long message that might clutter the console with unnecessary information.';
  print(longMessage);
  if(kDebugMode){
    print(longMessage);
  }
  // Using debugPrint with default behavior
  debugPrint(longMessage); // This will output the entire message

  // Using debugPrint with maxLength parameter to limit the message length
  debugPrint(longMessage, wrapWidth: 20); // This will truncate the message to 20 characters


}
