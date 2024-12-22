```dart
import 'dart:async';
import 'dart:io';

Future<void> fetchData() async {
  try {
    // Simulate an asynchronous operation that might fail
    await Future.delayed(Duration(seconds: 2));
    // Simulate a network error
    throw SocketException('Network Error');
  } on TimeoutException catch (e) {
    print('Timeout error: ${e.message}');
    // Retry mechanism for timeouts
    print('Retrying...');
    await Future.delayed(Duration(seconds: 2));
    try {
      // Attempt operation again
      await Future.delayed(Duration(seconds: 1));
      print('Data fetched successfully after retry');
    } catch (e) {
      print('Retry failed: $e');
    }
  } on SocketException catch (e) {
    print('Socket error: ${e.message}');
    // Handle network issues (e.g., display message, retry, offline mode)
  } on Exception catch (e) {
    print('An error occurred: ${e.message}');
    // Handle general exceptions appropriately
  } catch (e) {
    print('An unexpected error occurred: $e');
  } finally {
    print('Fetching data completed');
  }
}

void main() async {
  await fetchData();
}
```