; extends
(("->" @punctuation.delimiter) (#set! conceal "⟶" ))
;;((return_type type : (type_identifier) @type (#eq? @type "Result")) (#set! conceal "ᴿ" ))

(((function_item
   return_type:(generic_type
                 type : (type_identifier) @type))
 (#eq? @type "Result")) (#set! conceal "R"))
 

