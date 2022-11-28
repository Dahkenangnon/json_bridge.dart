// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:json_bridge/json_bridge.dart';

void main() {
  // Global reference to JSONBridge to avoid recreating it in each test
  JSONBridge bridge = JSONBridge()..init(fileName: 'config', dir: 'test');

  // Delete the file before each test
  bridge.clear();

  test('JSONBridge should be a singleton', () {
    expect(JSONBridge(), bridge);
  });

  test('JSONBridge should create a file', () {
    expect(bridge.read(), {});
  });

  test('JSONBridge should store a string', () {
    bridge.write({'name': 'John'});
    expect(bridge.read(), {'name': 'John'});
  });

  test('JSONBridge should store a number', () {
    bridge.write({'age': 42});
    expect(bridge.read(), {'age': 42});
  });

  test('JSONBridge should store a boolean', () {
    bridge.write({'isAlive': true});
    expect(bridge.read(), {'isAlive': true});
  });

  test('JSONBridge should store a list', () {
    bridge.write({
      'list': [1, 2, 3]
    });
    expect(bridge.read(), {
      'list': [1, 2, 3]
    });
  });

  test('JSONBridge should store a map', () {
    bridge.write({
      'map': {'a': 1, 'b': 2, 'c': 3}
    });
    expect(bridge.read(), {
      'map': {'a': 1, 'b': 2, 'c': 3}
    });
  });

  test('JSONBridge should store a list of maps', () {
    bridge.write({
      'listOfMaps': [
        {'a': 1, 'b': 2, 'c': 3},
        {'a': 4, 'b': 5, 'c': 6},
        {'a': 7, 'b': 8, 'c': 9}
      ]
    });
    expect(bridge.read(), {
      'listOfMaps': [
        {'a': 1, 'b': 2, 'c': 3},
        {'a': 4, 'b': 5, 'c': 6},
        {'a': 7, 'b': 8, 'c': 9}
      ]
    });
  });

  test('JSONBridge should store a map of lists', () {
    bridge.write({
      'mapOfLists': {
        'list1': [1, 2, 3],
        'list2': [4, 5, 6],
        'list3': [7, 8, 9]
      }
    });
    expect(bridge.read(), {
      'mapOfLists': {
        'list1': [1, 2, 3],
        'list2': [4, 5, 6],
        'list3': [7, 8, 9]
      }
    });
  });

  test('JSONBridge should store a DateTime', () {
    bridge.write({'date': DateTime(2021, 1, 1).toIso8601String()});
    expect(bridge.read(), {'date': '2021-01-01T00:00:00.000'});
  });

  test('JSONBridge should write a Map', () {
    bridge.write({'key': 'value'});
    expect(bridge.read(), {'key': 'value'});
  });

  test('JSONBridge should delete a file', () {
    bridge.clear();
    expect(bridge.read(), {});
  });

  test('JSONBridge should add a key', () {
    bridge.set('key', 'value');
    expect(bridge.read(), {'key': 'value'});
  });

  test('JSONBridge should update a key', () {
    bridge.set('key', 'value2');
    expect(bridge.read(), {'key': 'value2'});
  });

  test('JSONBridge should add a nested key', () {
    bridge.set('key.nested', 'value');
    expect(bridge.read(), {
      'key': {'nested': 'value'}
    });
  });

  test('JSONBridge should update a nested key', () {
    bridge.set('key.nested', 'value2');
    expect(bridge.read(), {
      'key': {'nested': 'value2'}
    });
  });

  test('JSONBridge should add a nested key with a list', () {
    bridge.set('key.nested', ['value1', 'value2']);
    expect(bridge.read(), {
      'key': {
        'nested': ['value1', 'value2']
      }
    });
  });

  test('JSONBridge should update a nested key with a list', () {
    bridge.set('key.nested', ['value3', 'value4']);
    expect(bridge.read(), {
      'key': {
        'nested': ['value3', 'value4']
      }
    });
  });

  // Delete a key.nested
  test('JSONBridge should delete a nested key', () {
    bridge.delete('key.nested');
    expect(bridge.read(), {'key': {}});
  });
}
