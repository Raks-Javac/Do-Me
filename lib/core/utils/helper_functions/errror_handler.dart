String extractFirstErrorMessage(Map<String, dynamic> errors1,
    {String? customessage}) {
  // Loop through each field and its errors
  if (errors1.containsKey('errors')) {
    final errors = errors1['errors'];

    if (errors is Map<String, dynamic>) {
      for (final fieldErrors in errors.values) {
        if (fieldErrors is List && fieldErrors.isNotEmpty) {
          // Extract the first error message
          final errorMessage = fieldErrors[0]['message'];
          return errorMessage ?? 'Oops! An error occurred';
        }
      }
    }
  }

  return customessage ?? 'Oops! An error occurred ${customessage ?? ""}.';
}

//tyname remover
Map<String, dynamic> removeTypenameFromMap(Map<String, dynamic> map) {
  map.remove('__typename');

  for (var key in map.keys.toList()) {
    if (map[key] is Map<String, dynamic>) {
      map[key] = removeTypenameFromMap(map[key]);
    } else if (map[key] is List) {
      for (var i = 0; i < map[key].length; i++) {
        if (map[key][i] is Map<String, dynamic>) {
          map[key][i] = removeTypenameFromMap(map[key][i]);
        }
      }
    }
  }

  return map;
}
