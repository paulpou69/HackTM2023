// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;

class CFAPI {
  final Uri host;
  const CFAPI(this.host);

  Uri uriFor(String path) => host.replace(path: path);
  Future<dynamic> register(
      {required String accountType,
      required String walletAddress,
      required String name,
      String? contractAddress}) async {
    final payload = {
      "account_type": accountType,
      "wallet_address": walletAddress,
      "name": name,
      "contract_address": contractAddress,
    };
    final data = await http.post(
      uriFor('/auth/register/'),
      body: json.encode(payload),
    );
    final result = jsonDecode(data.body);

    return result;
  }

  Future<dynamic> login({
    required String walletAddress,
  }) async {
    final payload = {
      "address": walletAddress,
    };
    final data = await http.post(
      uriFor('/auth/login/'),
      body: json.encode(payload),
    );
    final result = jsonDecode(data.body);
    return result;
  }

  Future<dynamic> getCertifiedMaterials({required String address}) async {
    final payload = {
      'contract_address': address,
    };
    final data = await http.post(
      uriFor('/details/certified/'),
      body: json.encode(payload),
    );
    final result = jsonDecode(data.body);
    return result;
  }
}
