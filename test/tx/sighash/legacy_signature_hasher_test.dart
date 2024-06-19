import 'package:coinslib/coinlib.dart';
import '../../vectors/tx.dart';
import 'signature_hasher_tester.dart';

void main() {

  signatureHasherTester(
    "LegacySignatureHasher",
    (Transaction tx, int inputN, SigHashVector vec) => LegacySignatureHasher(
      tx: tx,
      inputN: inputN,
      scriptCode: Script.fromAsm(vec.scriptCodeAsm),
      hashType: vec.type,
    ).hash,
    (SigHashVector vec) => vec.hash,
  );

}
