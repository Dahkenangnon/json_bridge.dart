# json_bridge.dart

[![GitHub Repo stars](https://img.shields.io/github/stars/dahkenangnon/json_bridge.dart?label=github%20stars)](https://github.com/dahkenangnon/json_bridge.dart)
[![pub version](https://img.shields.io/pub/v/json_bridge.dart)](https://pub.dev/packages/json_bridge.dart)
[![GitHub last commit](https://img.shields.io/github/last-commit/dahkenangnon/json_bridge.dart)](https://github.com/dahkenangnon/json_bridge.dart)
![JSONBridge workflow](https://github.com/Dahkenangnon/json_bridge.dart/actions/workflows/build.yaml/badge.svg)


A powerful, flexible and easy to use JSON file manager for Dart and flutter app.

---

## Getting Started

### 1. Add the dependency

```yaml
dependencies:
  # Please replace [latest_version] with the latest version.
  json_bridge: ^latest_version
```

### 2. Import the package

```dart
import 'package:json_bridge/json_bridge.dart';
```

### 3. Initialize the package

```dart

    // Omit dir to use your flutter application document directory
  JSONBridge jsonBridge = JSONBridge()..init(fileName: 'config', dir: 'test');
```

### 4. Use the package

#### 4.1. Write a map into the json file

Note that using the `write` method will overwrite the entire file.

If you want to add a key/value pair or new json object, consider using the `set` method

```dart
  jsonBridge.write({
    'name': 'John Doe',
    'age': 25,
    'address': {
      'street': 'Main Street',
      'city': 'New York',
      'country': 'USA'
    }
  });
```

The result will be:

```json
{
  "name": "John Doe",
  "age": 25,
  "address": {
    "street": "Main Street",
    "city": "New York",
    "country": "USA"
  }
}
```

#### 4.2. Clear all content of the json file and delete it

```dart
  jsonBridge.clear();
```

#### 4.3. Read the entire content of the json file

```dart
  Map<String, dynamic> dataFromJsonBridge = jsonBridge.read();
```

Your `dataFromJsonBridge` variable will contain the entire content of the json file as a `Map<String, dynamic>`
and should look like in map form:

```dart
{
  "name": "John Doe",
  "age": 25,
  "address": {
    "street": "Main Street",
    "city": "New York",
    "country": "USA"
  }
}
```

#### 4.4. Add new JSON object

```dart
jsonBridge.set('preferences', {
    'dark': true,
    'receive_notification': false,
    'show_update_notification': true,
});
```

Your json file should now contain:

```json
{
  "name": "John Doe",
  "age": 25,
  "address": {
    "street": "Main Street",
    "city": "New York",
    "country": "USA"
  },
  "preferences": {
    "dark": true,
    "receive_notification": false,
    "show_update_notification": true
  }
}
```

#### 4.5. Update a nested key/value pair

Let's say, we want to update the dark mode preference to false

```dart
jsonBridge.set('preferences.dark', false);
```

Your json file should now contain:

```json
{
  "name": "John Doe",
  "age": 25,
  "address": {
    "street": "Main Street",
    "city": "New York",
    "country": "USA"
  },
  "preferences": {
    "dark": false,
    "receive_notification": false,
    "show_update_notification": true
  }
}
```

#### 4.6. Get a value
    
Everywhere you need to provide a key, you can use a dot separated string to access nested keys.
If your key is not found, the method will return null.

If your key contains invalid character, an error will be thrown.


```dart
String name = jsonBridge.get('name');
// name = 'John Doe'

int age = jsonBridge.get('age');
// age = 25

String street = jsonBridge.get('address.street');
// street = 'Main Street'

String city = jsonBridge.get('address.city');
// city = 'New York'

String country = jsonBridge.get('address.country');
// country = 'USA'

bool dark = jsonBridge.get('preferences.dark');
// dark = false

bool receiveNotification = jsonBridge.get('preferences.receive_notification');
// receiveNotification = false

bool showUpdateNotification = jsonBridge.get('preferences.show_update_notification');
// showUpdateNotification = true
```

#### 4.7. Delete a key

```dart
jsonBridge.delete('preferences.show_update_notification');
```
Your json file should now contain:

```json
{
  "name": "John Doe",
  "age": 25,
  "address": {
    "street": "Main Street",
    "city": "New York",
    "country": "USA"
  },
  "preferences": {
    "dark": false,
    "receive_notification": false
  }
}
```

#### 4.8. Check if a key exists

```dart
bool exists = jsonBridge.exists('preferences.dark');
// exists = true

bool exists = jsonBridge.exists('iKnowThisKeyDoesNotExist');
// exists = false
```


## API

Below, the full list of methods available in **JSONBridge**.

Once again, everywhere you see a key, you can use dot separated keys to access nested keys.

| *Method Name*       | *Description*                           |
| ---------------    | ------------------------------------- |
| void init({required String fileName, String? dir})        | Init the bridge by creating the json file. Should be call before any other method        |
| Map<String, dynamic> read()        | Reads the JSON file and returns a Map.         |
| void write(Map<String, dynamic> data)         | Write a map into the json file. It override all previous content         |
| void clear()         | Delete completly the json file         |
| void set(String key, dynamic value)        | Add or update a key         |
| void delete(String key)         | Delete a key from the json file         |
| dynamic get(String key)        | Get a value from the json file         |
| bool has(String key)        | Check if a key exists in the JSON file.         |


## Why should you give a try ?

>
> :point_right: It allows you to store and retrieve data from a JSON file.
>
> :point_right: The JSON file is stored in the application document directory or a dir you provide.
>
> :point_right: **JSONBridge** support manipulating nested keys with dot separated.
>
> :point_right: Use **JSONBridge** to store user preferences, settings, data, etc.
>
> :point_right: Use **JSONBridge** to build the next big and powerfull noSQL database for dart and flutter apps.
> 
> :point_right: Use **JSONBridge** to store any data in a JSON file within your application.
>
> :point_right: Use **JSONBridge** to check if user is using your app for the first time.
>
> :point_right: Use **JSONBridge** to track user activity and show him the last seen screen when he restart the app.
>
> Usecases are endless, use your imagination.

Platform supported:

| Support | Android | iOS | Linux | macOS | Windows |
| :--- | :---: | :---: | :---: | :---: | :---: |
| JSONBridge | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ |




## Support

Please email to **dah.kenangnon (at) gmail (dot) com** if you have any questions or comments or business support.

## Contributing

Contributions are welcome and are greatly appreciated! Every little bit helps, and credit will always be given. Please see the [contribution guidelines](CONTRIBUTING.md) and [code of conduct](CODE_OF_CONDUCT.md) for more details.

Fire up now and enjoy! :rocket:

## Copyright & License

This project is licensed under the BSD-3-Clause License - see the [LICENSE](LICENSE) file for details.

Maintained by [Justin Dah-kenangnon](https://Dahkenangnon.com) with ❤️