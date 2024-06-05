import 'package:flutter/services.dart';

class NameInputFormatter extends TextInputFormatter{
  int spaceCount = 0;
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    // String newText=newValue.text;
    // if(newText.isEmpty) {
    //   return const TextEditingValue(text: '');
    // }
    //   StringBuffer formattedText=StringBuffer();
    //   int noOfSpaces=0;
    //   if(newText[0]!=' '){
    //     formattedText.write(newText[0]);
    //   }
    //   for(int i=1;i<newText.length;i++){
    //     if(newText[i]==' '){
    //       if(i+1<newText.length&&newText[i+1]==' '){
    //         i++;
    //       }
    //       noOfSpaces++;
    //       if(noOfSpaces<4){
    //         formattedText.write(newText[i]);
    //       }
    //     }
    //     else {
    //       formattedText.write(newText[i]);
    //     }
    //   }
    //   return TextEditingValue(text: formattedText.toString());
    // Check if the new value is empty, if so, reset the space count
    if (newValue.text.isEmpty) {
      spaceCount = 0;
      return newValue;
    }

    // Check if the new value has a space as the first character
    if (newValue.text[0] == ' ') {
      // If there was no space in the old value, discard the space
      if (oldValue.text.isEmpty || oldValue.text[0] != ' ') {
        return oldValue;
      }
    }

    // Check if there are more than 3 spaces in the new value
    if (newValue.text.length > 1 && newValue.text.contains(' ')) {
      // If there are more than 3 spaces, discard the change
      if (newValue.text.split(' ').length - 1 > 3) {
        return oldValue;
      }
    }

    // If none of the above conditions are met, allow the change
    return newValue;
    }

  }

