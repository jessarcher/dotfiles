((php) @injection.content
    (#set! injection.language "php")
    (#set! injection.combined))
((parameter) @injection.content
    (#set! injection.language "php")) ; TODO: php_only
((php_only) @injection.content
    (#set! injection.language "php")) ; TODO: php_only
