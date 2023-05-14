import 'package:flutter/material.dart';
import 'package:flutter_web3/ethereum.dart';
import 'package:frontend/config/state_handler.dart';

class MetaMaskProvider extends ChangeNotifier {
  final StateHandler stateHandler;
  MetaMaskProvider(this.stateHandler);

  static const ethChain = 1;
  String currentAddress = '';
  var account = '';
  String authToken = '';
  int? currentChain;
  bool get isEnabled => ethereum != null;
  bool get isInOperatingChain => true;
  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  Future connect() async {
    if (isEnabled) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) currentAddress = accs.first;
      currentChain = await ethereum!.getChainId();
      notifyListeners();
    }
  }

  Future getToken() async {
    if (isConnected) {
      notifyListeners();
    }
  }

  reset() async {
    currentAddress = '';
    authToken = '';
    notifyListeners();
  }

  start() {
    if (isEnabled) {
      ethereum!.onAccountsChanged((accounts) {
        print(account);
        reset();
      });
      ethereum!.onChainChanged((accounts) {
        reset();
      });
    }
  }
}
