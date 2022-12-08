import 'dart:typed_data';
import '../utils/script.dart' as bscript;
import '../utils/constants/op.dart';

bool inputCheck(List<dynamic> chunks) {
  return chunks.length == 2 &&
      bscript.isCanonicalScriptSignature(chunks[0]) &&
      bscript.isCanonicalPubKey(chunks[1]);
}

bool outputCheck(Uint8List script) {
  final buffer = bscript.compile(script);
  return buffer.length == 25 &&
      buffer[0] == ops['OP_DUP'] &&
      buffer[1] == ops['OP_HASH160'] &&
      buffer[2] == 0x14 &&
      buffer[23] == ops['OP_EQUALVERIFY'] &&
      buffer[24] == ops['OP_CHECKSIG'];
}
