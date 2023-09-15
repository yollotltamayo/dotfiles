;;( (line_comment) @injection.content
;; (#set! injection.language "markdown")
;; (#set! injection.combined)
;; (#set! injection.include-children))

(macro_invocation 
  (scoped_identifier
    path: (identifier) @path (#eq? @path "sqlx")
    name: (identifier) @name (#eq? @name "query"))

    (token_tree
      (raw_string_literal) @sql
      (#offset! @sql 1 0 0 0))
)


