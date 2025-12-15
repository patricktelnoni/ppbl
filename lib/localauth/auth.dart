import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:io';


class PerformAppAuthentication {
  static final LocalAuthentication localAuth = LocalAuthentication();

  authenticateWithBiometric() async{
    final bool canAuthenticate = await localAuth.isDeviceSupported();
    if (!canAuthenticate) {
      return false;
    }
    final isAuthenticated  = await localAuth.authenticate(
        localizedReason: "Please use fingerprint to authenticate",
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          //biometricOnly: true,
        )
    );
    return isAuthenticated;
  }

}