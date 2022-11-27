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
