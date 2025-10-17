import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class FileCrypto {
  static final _key = Key.fromUtf8('8b7c93e541a296d4c51f3a67d923ba04'); // 32 字符 ✅
  static final _iv = IV.fromUtf8('r4s2x9M1uVt6pB3w'); // 16 字符 ✅

  static String encryptContent(String content) {
    final encrypter = Encrypter(AES(_key, mode: AESMode.cbc, padding: 'PKCS7'));
    final encrypted = encrypter.encrypt(content, iv: _iv);
    return encrypted.base64;
  }

  static String decryptContent(String encrypted) {
    try {
      final encrypter = Encrypter(AES(_key, mode: AESMode.cbc, padding: 'PKCS7'));
      final decrypted = encrypter.decrypt(Encrypted.fromBase64(encrypted), iv: _iv);
      return decrypted;
    } catch (e) {
      return encrypted;
    }
  }


}

// lib/utils/encryptor.dart



class Encryptor {
  final String keyBase64;

  Encryptor(this.keyBase64);

  /// 加密 YAML 字符串
  String encryptYaml(String yamlContent) {
    final key = encrypt.Key.fromBase64(keyBase64);
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(yamlContent, iv: iv);
    final full = iv.bytes + encrypted.bytes;

    return base64Encode(full);
  }

  /// 解密 .enc 文件内容（Base64）
  String decryptEnc(String base64Content) {
    final raw = base64Decode(base64Content);
    final iv = encrypt.IV(Uint8List.fromList(raw.sublist(0, 16)));
    final encryptedBytes = raw.sublist(16);
    final key = encrypt.Key.fromBase64(keyBase64);
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    final decrypted = encrypter.decrypt(encrypt.Encrypted(Uint8List.fromList(encryptedBytes)), iv: iv);
    return decrypted;
  }
}
