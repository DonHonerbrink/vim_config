syn match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
syn match cTypeDef '\v(<\u\i*>)+'

hi def link cCustomFunc Function
hi def link cTypeDef Type
