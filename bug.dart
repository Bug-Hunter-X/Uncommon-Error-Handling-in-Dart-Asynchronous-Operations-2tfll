```dart
import 'dart:async';

Future<void> fetchData() async {
  try {
    // Simulate an asynchronous operation that might fail
    await Future.delayed(Duration(seconds: 2));
    // Throw an exception to simulate a network error or other issues
    throw Exception('Failed to fetch data');
  } on TimeoutException catch (e) {
    print('Timeout error: ${e.message}');
    // Handle timeout specifically 
    // Consider retrying or implementing exponential backoff
  } on SocketException catch (e) {
    print('Socket error: ${e.message}');
    // Handle socket errors (network issues) specifically
  } on Exception catch (e) {
    print('An error occurred: ${e.message}');
    // Handle other exceptions generally
  } catch (e) {
    print('An unexpected error occurred: $e');
  } finally {
    print('Fetching data completed'); // Always executed
  }
}

void main() async {
  await fetchData();
}
```