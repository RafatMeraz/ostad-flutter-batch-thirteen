// Best Practice => Service Locator/Dependency Injection Manager

import '../core/network_caller/network_caller.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: () => {
      'Content-Type': 'application/json',
    },
    onUnauthorize: () {
      // Logout from app
      // Clear user data
      // Redirect to the sign in ui
    },
  );
}

// USES => getNetworkCaller().getRequest()