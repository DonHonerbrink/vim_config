syn keyword cBoolean true false TRUE FALSE
hi def link cBoolean Boolean

syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
highlight def link cCustomFunc Function

syn match cType "\v(struct\s+)@<=[a-zA-Z0-9_]+"
syn match cType "\v(enum\s+)@<=[a-zA-Z0-9_]+"
syn match cType "\v(union\s+)@<=[a-zA-Z0-9_]+"
