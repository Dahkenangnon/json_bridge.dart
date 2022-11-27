# json_bridge.dart
>
> **JSONBridge** is a simple wrapper around a JSON file
>
> It allows you to store and retrieve data from a JSON file.
>
> The JSON file is stored in the application document directory.
>
> But you can also specify a directory and a file name when calling the init method.
>
> **JSONBridge** is a singleton
>
> **JSONBridge** support manipulating nested keys with dot separated.
>
> 



:warning: Still under dev :computer:

## API

| Method Name        | Description                           |
| ---------------    | ------------------------------------- |
| void init({required String fileName, String? dir})        | Init the bridge by creating the json file. Should be call before any other method        |
| Map<String, dynamic> read()        | Reads the JSON file and returns a Map.         |
| void write(Map<String, dynamic> data)         | Write a map into the json file. It override all previous content         |
| void clear()         | Delete completly the json file         |
| void set(String key, dynamic value)        | Add or update a key         |
| void delete(String key)         | Delete a key from the json file         |
| dynamic get(String key)        | Get a value from the json file         |
| bool has(String key)        | Check if a key exists in the JSON file.         |


NB: Everywhere you see a key, you can use dot separated keys to access nested keys.

