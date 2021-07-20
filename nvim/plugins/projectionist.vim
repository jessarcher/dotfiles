Plug 'tpope/vim-projectionist'

let g:projectionist_heuristics = {
    \ "artisan": {
    \   "*": {
    \     "start": "sail up",
    \     "console": "sail tinker",
    \   },
    \   "app/**/Controllers/*.php": {
    \     "type": "source",
    \     "alternate": "tests/Feature/{dirname}/Controllers/{basename}Test.php"
    \   },
    \   "app/**/Models/*.php": {
    \     "type": "source",
    \     "alternate": "tests/Unit/{dirname}/Models/{basename}Test.php"
    \   },
    \   "tests/Feature/*Test.php": {
    \     "type": "test",
    \     "alternate": "app/{}.php"
    \   },
    \   "tests/Unit/*Test.php": {
    \     "type": "test",
    \     "alternate": "app/{}.php"
    \   },
    \ }}
