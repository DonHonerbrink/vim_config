" ~/.vim/after/syntax/c.vim
" Style:
"   - Types (struct/enum/typedef names): PascalCase
"   - Functions: snake_case + followed by '('
"   - Variables: snake_case + NOT followed by '('

" In after/syntax, do NOT bail out if b:current_syntax exists.

" PascalCase types: require at least one lowercase so we don't match ALLCAPS macros.
syntax match cDonPascalType /\<[A-Z][A-Za-z0-9]*[a-z][A-Za-z0-9]*\>/

" snake_case function name: match the name only, only when followed by '(' (allow whitespace)
syntax match cDonSnakeFunc /\<[a-z][a-z0-9_]*\>\ze\s*(/

" snake_case variable/identifier: match only when NOT followed by '(' (allow whitespace)
syntax match cDonSnakeVar  /\<[a-z][a-z0-9_]*\>\%(\s*(\)\@!/

highlight default link cDonPascalType Type
highlight default link cDonSnakeFunc  Function
highlight default link cDonSnakeVar   Identifier

