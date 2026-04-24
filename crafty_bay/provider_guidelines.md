# Provider Guidelines

Follow these rules when creating a new provider in the `crafty_bay` project to ensure consistency across the codebase.

## 1. Class Structure
- Every provider must extend `ChangeNotifier` from `package:flutter/foundation.dart`.
- The class name should follow the feature name: `[FeatureName]Provider`.

## 2. State Management
Maintain the following private variables for every asynchronous operation:
- **Loading State**: `bool _get[DataName]InProgress = false;`
- **Error Message**: `String? _errorMessage;`
- **Data**: The actual model or list of models (e.g., `ProductDetailsModel? _productDetails;`).

Expose these variables using public getters:
```dart
bool get get[DataName]InProgress => _get[DataName]InProgress;
String? get errorMessage => _errorMessage;
[ModelName]? get [dataName] => _[dataName];
```

## 3. Method Design
- Methods that perform network requests should return `Future<bool>` to indicate success or failure.
- Always use `notifyListeners()` to update the UI.

### Standard Method Template:
```dart
Future<bool> get[DataName]([Params]) async {
  bool isSuccess = false;

  _get[DataName]InProgress = true;
  notifyListeners();

  final NetworkResponse response = await getNetworkCaller().getRequest(
    Urls.[urlConstant],
  );

  if (response.isSuccess) {
    // Parse data from response.body
    _ [dataName] = [ModelName].fromJson(response.body!['data']);
    _errorMessage = null;
    isSuccess = true;
  } else {
    _errorMessage = response.errorMessage;
  }

  _get[DataName]InProgress = false;
  notifyListeners();

  return isSuccess;
}
```

## 4. Network Calls
- Use `getNetworkCaller()` from `app/set_up_network_client.dart`.
- Use URL constants from `app/urls.dart`.
- Handle `NetworkResponse` properties (`isSuccess`, `body`, `errorMessage`).

## 5. Imports
Ensure you import the necessary core and app-level files:
- `import 'package:flutter/foundation.dart';`
- `import 'package:crafty_bay/app/set_up_network_client.dart';`
- `import 'package:crafty_bay/app/urls.dart';`
- `import 'package:crafty_bay/core/network_caller/network_caller.dart';`
