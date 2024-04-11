final RegExp urlPattern = RegExp(
  r'^(https?|ftp)://[^\s/$.?#].\S*$|^www\.[^\s/$.?#].\S*$',
  caseSensitive: false,
);
