import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:front/domain/model/trash_model.dart';
import 'package:front/util/qr_parser.dart';

void main() {
  test("Jsonの形を確認", () {
    final TrashModel trashModel = TrashModel(createdAt: DateTime.now());
    print(trashModel.toJson());
    //{trashId: %void%, trashBoxId: %void%, userId: %void%, count: 0, createdAt: 2022-12-14T19:21:05.867197}
    final json = jsonEncode(trashModel.toJson());
    print(json);
    final bytes = utf8.encode(json);
    print(bytes);
    final base64 = base64Encode(bytes);
    print(base64);
  });
  test("parse", () {
    final url =
        "https://trush-box.firebaseapp.com/#/slot/62a464a53844a625a3e20e2114c5ea05932056005fe32458418a2d2ea25f15348369320bb94f3b09b223d5b4ff7a0febe9d3a92a3656696afe2009ed639ae155409416274175ab11be7114547538504ce97f5cea042fdbb025534f056600ec4a58567e2f41f1e3c0c831f978cd7eaa298e27a95016f521251a6ac6a42c6ebcdf682f7876d530fe130ebc02167f67dd3efd2a4872577f5fc3f6909b9d64e8e9d5e17a58c8194ed37cc9df7ab6314984614563957835b0cd34526b91035693cf645454da79baedfbb1dbc80aa5da29da5c4447898eb2fce362cd73e489bbe3cb68c4bc8dffb02aa16d79686a958678909484e6c44c7398c9445278da606f4043d1";
    final parsed = qrParse(url);
    print(parsed);
  });
}
