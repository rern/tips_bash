## PHP command line with arguments

Place this in file.php:
```php
<?php
if ( !empty( $argv[ 1 ] ) ) parse_str( $argv[ 1 ], $_POST ); // or $_GET
```
Command line:
```sh
./file.php "arg1=val1&arg2=val2"
```
