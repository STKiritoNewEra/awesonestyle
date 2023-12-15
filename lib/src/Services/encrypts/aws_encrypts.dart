class AwsEncrypts {
  static String enCodeAscii(String text) {
    String mensajeCifrado = '';
    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);
      // Add an offset of 3 to the ASCII value of each character to encrypt
      int nuevoCharCode = (charCode + 3) % 256;
      mensajeCifrado += String.fromCharCode(nuevoCharCode);
    }
    return mensajeCifrado;
  }

  static String deCodeAscii(String text) {
    String mensajeDescifrado = '';
    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);
      // Restore the offset of 3 to the original ASCII value to decrypt
      int nuevoCharCode = (charCode - 3) % 256;
      mensajeDescifrado += String.fromCharCode(
          nuevoCharCode < 0 ? nuevoCharCode + 256 : nuevoCharCode);
    }
    return mensajeDescifrado;
  }
}
