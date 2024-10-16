(scoped_call_expression
 scope: (name) @scope (#eq? @scope "DB")
 name: (name) @name (#any-of? @name "insert" "select")
 (arguments
  (argument
   (string
    ((string_value) @injection.content
     (#set! injection.language sql)
    )
   )
  )
 )
)
