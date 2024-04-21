import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_project/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.bell).existsSync(), isTrue);
    expect(File(Images.board).existsSync(), isTrue);
    expect(File(Images.hospital).existsSync(), isTrue);
    expect(File(Images.speech).existsSync(), isTrue);
  });
}
