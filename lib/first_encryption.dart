import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;

class MyEncryptionDecryption {

  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  //This code below is for AES Encryption
  static encryptAES(text){
    final encrypted = encrypter.encrypt(text, iv: iv);

    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    return encrypted;
  }
  static decryptAES(text){
    final decrypted = encrypter.decrypt(text, iv: iv);
    print(decrypted.length);
    return decrypted;
  }

  //This code below is for Fernet Encryption
  static final keyfr = encrypt.Key.fromUtf8("put32charactershereeeeeeeeeeeee!");
  static final keyFernet = encrypt.Key.fromBase64(base64Url.encode(keyfr.bytes));
  static final fernet = encrypt.Fernet(keyFernet);
  static final encrypterFernet = encrypt.Encrypter(fernet);

  static encryptFernet(text){
    final encrypted = encrypterFernet.encrypt(text);
    return encrypted;
  }
  static decryptFernet(text){
    final decrypted = encrypterFernet.decrypt(text);
    return decrypted;
  }
}