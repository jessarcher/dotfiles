Plug 'tpope/vim-projectionist'

let g:projectionist_heuristics = {
    \ "artisan": {
    \   "*": {
    \     "start": "sail up",
    \     "console": "sail tinker",
    \   },
    \   "app/*Controller.php": {
    \     "type": "source",
    \     "alternate": "tests/Feature/{}ControllerTest.php",
    \   },
    \   "app/**/Models/*.php": {
    \     "type": "source",
    \     "alternate": [
    \       "tests/Unit/{dirname}/Models/{basename}Test.php",
    \       "tests/Unit/{dirname}/{basename}Test.php",
    \     ],
    \   },
    \   "app/**/Listeners/*.php": {
    \     "type": "source",
    \     "alternate": "tests/Unit/{dirname}/Listeners/{basename}Test.php",
    \   },
    \   "app/*.php": {
    \     "type": "source",
    \     "alternate": [
    \       "tests/Unit/{}Test.php",
    \       "tests/Feature/{}Test.php",
    \     ]
    \   },
    \   "tests/Feature/*Test.php": {
    \     "type": "test",
    \     "alternate": "app/{}.php",
    \   },
    \   "tests/Unit/*Test.php": {
    \     "type": "test",
    \     "alternate": [
    \       "app/{}.php",
    \       "app/Models/{}.php",
    \     ],
    \   },
    \ }}
