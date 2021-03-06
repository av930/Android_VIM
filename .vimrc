
"==============================================================================="
"set cmd : configure vi environments
"=============================================================================="
"$VIMRUNTIME=/usr/share/vim/vim73, for linux and cygwin, $VIMRUNTIME=c:\gvim, for gvim
"belows should be defined .bash_profile 
	"export VIMRUNTIME=/usr/share/vim/vim73
	"export VIMINIT=":so /cygdrive/d/code_study/vimrc/.vimrc"
"or could be defined locally
	"let $VIMRUNTIME=/usr/share/vim/vim73

"여러 VIM configuration을 설치하여 사용하고 싶을경우 3가지를 변경해줘야 한다.
"$VIMRUNTIME  --vim 프로그램을 설치할때 같이 설치된 default script가 존재하는 dir
"             --vim을 새로 compile한 경우, default script path를 변경해야 한다.
"&runtimepath --사용가 추가한 script를 찾을수 있는 path로 default는 $VIMRUNTIME/와 .vim/ script
"             --사용자 추가한 script 위치를 변경하고 싶은 경우 
"$VIMINIT     --default .vimrc는 $HOME/.vimrc 이며, $MYVIMRC에 저장됨
"             --다른 .vimrc을 default로 설정하고 싶은 경우


"-------------------------------------------------------------------------------"
let s:VIMRC_PATH = "~/"
let s:VIM_PATH = ".vim/"
let g:vim_root_path = s:VIMRC_PATH . s:VIM_PATH
"let &runtimepath=substitute(&rtp, '\/\.vim', '\/\.vim1', 'g')

"echo 'KJK_DEBUG ['$VIMRUNTIME']:['$VIMINIT']:['$MYVIMRC']'
"
"leader settings
"-------------------------------------------------------------------------------"
let mapleader=','
let maplocalleader=','


" 상용구 설정
"=============================================================================="
" insert mode 에서 사용구 abbrev 등록
" i가 없으면 명령구문에서도 동작
iab mydate =strftime("%Y-%m-%d %H:%M:%S")
iab mytime =strftime("%H:%M:%S")
iab myname joongkeun.kim


if 1 "android setting
"==============================================================================="
function! FUNC_FindRoot()
    let cur_dir = getcwd()
    let temp_dir = cur_dir
    while temp_dir != "/"
        if filereadable(temp_dir . "/build/envsetup.sh") 
            return temp_dir 
        elseif filereadable(temp_dir . "/../android/build/envsetup.sh") 
            return temp_dir 
        else
            cd ..
            let temp_dir = getcwd()
        endif
    endwhile
    return cur_dir
endfunction

let g:RootDir=FUNC_FindRoot()
let g:include_files='*.c, *.cpp, *.java, *.mk, *.sh, *.xml' 
let g:exclude_dirs='.repo, .git, .svn, .cache'
let g:exclude_files='*.obj, *.o, *.class, *.jar, *.so, *.js, *.html, *~'
endif 


"==============================================================================="
"
" General Plugin Setting
"_______________________________________________________________________________"
"

if 1 "plugin managements
"==============================================================================="
" pathogen
"-------------------------------------------------------------------------------"
let s:VIMRC_ROOT_BUNDLE = g:vim_root_path . 'bundle'
"현재 bundle의 기준 dir로 설정되어야 한다.
call pathogen#infect(s:VIMRC_ROOT_BUNDLE)
filetype off                   " required!
"_______________________________________________________________________________"
endif


if 1 "plugin managements
"==============================================================================="
" vundle
"-------------------------------------------------------------------------------"
" Brief help
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
let s:VIMRC_ROOT_VUNDLE = g:vim_root_path . 'bundle/vundle'
"let xxx .= xxx : concatenate opertator
let &runtimepath.= ',' .s:VIMRC_ROOT_VUNDLE 
"execute "set rtp+=".s:VIMRC_ROOT_VUNDLE 
"vundle path 변경, default는 .vim/
call vundle#rc(s:VIMRC_ROOT_BUNDLE)
"plugin
let g:vundle_default_git_proto = 'git'

"this string should be same to http://github.com/~
"ex) http://github.com/gmarik/vundle
"or
"should be the full name in :BundleSearch output
"즉, Bundles로 검색된 이름을 써줘라. 수동으로 기록해줘야함.삭제때도 마찬가지
"반드시 기록할 필요는 없지만, list가 있으면 설치/삭제가 편리하다.
"대소문자를 구별함으로 주의하자
"
"Plugin Mangement
Bundle 'vundle'

"Editing
Bundle 'The-NERD-Commenter'

"window control
Bundle 'obvious-resize'

"searching
Bundle 'ctrlp.vim'
Bundle 'grep.vim'
Bundle 'gtags.vim'

"Browsing 
Bundle 'fugitive.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'The-NERD-tree'
Bundle 'Tagbar'
Bundle 'DirDiff.vim'

"FileType
Bundle 'asciidoc.vim'

"color theme dark
Bundle 'inkpot'
Bundle 'jellybeans.vim'
Bundle 'Wombat'
"color theme white
Bundle 'peaksea'


"Bundle 'ZoomWin'
"Bundle 'FuzzyFinder'
"Bundle 'L9'
"Bundle 'Command-T'
"Bundle 'SrcExpl' "VI 기본 기능으로 충분하다.


"-------------------------------------------------------------------------------"
nnoremap <silent> <F7>hh :help my_vundle<CR> 
nnoremap <silent> <F7>  :BundleList<CR> 
nnoremap <silent> <F7>c :BundleClean!<CR> 
nnoremap <silent> <F7>i :BundleInstall<CR> 
nnoremap <silent> <F7>u :BundleInstall!<CR> 
nnoremap <silent> <F7>r :BundleSearch!<CR> 


filetype plugin indent on "vundle end
"_______________________________________________________________________________"
endif


if 1 "CtrlP plugin
"==============================================================================="
" CtrlP plugin 
"-------------------------------------------------------------------------------"
nnoremap <silent> <F2>hh :help my_ctrlp<CR> 
nnoremap <silent> <F2>  :CtrlP<CR> 
nnoremap <silent> <F2>b :CtrlPBuffer<CR> 
nnoremap <silent> <F2>r :CtrlPMRU<CR> 
nnoremap <silent> <F2>c :CtrlPClearCache<CR> 


"let g:loaded_ctrlp =1 "load ctrlp plugin
let g:ctrlp_map = 0 "ctrl-p is alreay allocated to window resize
let g:ctrlp_by_filename =1 "search file by only filename, default full path
"let g:ctrlp_regexp = 1, search using regexp as default
let g:ctrlp_match_window_bottom = 0 "show window on top of the screen
let g:ctrlp_max_height = 30 "window max height
let g:ctrlp_switch_buffer = 2 
    "1 - only jump to the buffer if it’s opened in the current tab.
    "2 - jump tab as well if the buffer’s opened in another tab.
    "0 - disable this feature
"let g:ctrlp_reuse_window = 'netrw\|help\|quickfix', file open할 window를 지정
"let g:ctrlp_working_path_mode=2
    "0 - don’t manage working directory. just current dir
    "1 - the parent directory of the current file.
    "2 - the nearest ancestor that contains one of these directories or files: 
    ".git/ .hg/ .svn/ .bzr/ _darcs/, --default


let g:ctrlp_mruf_last_entered = 1 "MRU file이 최근 사용한 buffer순으로 정렬
let g:ctrlp_open_new_file = 't' "<c-y>시 새파일을 어떤 window에 열지 tab으로 열어라
let g:ctrlp_lazy_update = 1 "match file을 key입력후 몇초있다가 보여줄지..
let g:ctrlp_max_files = 60000 "0이면 no limit


    if 1 "SourceInsight처럼 사용하려면
        let g:ctrlp_use_caching = 0 "4000개 이상의 파일을 가진 dir만 caching해라
        let g:ctrlp_clear_cache_on_exit = 0 "vim 종료후에도 cache유지해
        let g:ctrlp_cache_dir = RootDir . "/.cache/"
        let g:ctrlp_user_command = '
                                \ find %s 
                                \ -name .repo -prune -o 
                                \ -name .git -prune -o 
                                \ -name cts -prune -o 
                                \ -name docs -prune -o 
                                \ -name ndk -prune -o 
                                \ -name sdk -prune -o 
                                \ -name external -prune -o 
                                \ -name prebuilt -prune -o 
                                \ -name out/target/product -prune -o 
                                \ -type f 
                                \ -iregex ".*\.\(c\|h\|cpp\|S\|java\|xml\|sh\|mk\|py\)" 
                                \ '

    else "SourceInsight와 다르게 search DB를 재사용하지 않고, 찾을때마다 만들어서 사용하려면
        "무시할 file list들
        let g:ctrlp_dotfiles = 0 ".으로 시작하는 파일이나 dir제외
        set wildignore+=*.o,*.obj,.git,*.jar,*.so,*.a,*.class,*.apk,*.P
        set wildignore+=*.js,*.html,*.jpg,*.png,*.gif,*.htm,*.jd,*.zip,*.exe,*.swp
        set wildignore+=*/cts/*,*/docs/*,*/ndk/*,*/sdk/*,*/external/*,*/prebuilt/*,*/out/*,

        let g:ctrlp_custom_ignore = {
                    \ 'dir':  '\.git$\|\.hg$\|\.svn$|\.repo$',
                    \ 'file': '\.exe$\|\.so$\|\.dll$',
                    \ 'link': 'some_bad_symbolic_links',
                    \ }

        let g:ctrlp_cache_dir = g:vim_root_path . '.cache/ctrlp'
        let g:ctrlp_user_command = {
                    \ 'types': {
                    \ 1: ['.git/', 'cd %s && git ls-files'],
                    \ 2: ['.hg/', 'hg --cwd %s locate -I .'],
                    \ },
                    \ 'fallback': 'find %s -type f'
                    \ }
    endif

"_______________________________________________________________________________"
endif


if 1 "grep plugin
"==============================================================================="
" grep plugin 
"-------------------------------------------------------------------------------"
nnoremap <silent> <F3>hh :help my_grep<CR> 
nnoremap <silent> <F3>  :Rgrep<CR> 
nnoremap <silent> <F3>b :GrepBuffer<CR> 
nnoremap <silent> <F3>l :cwindow<CR> 


"let Grep_Path = '/usr/local/bin/grep' 
let Grep_Default_Filelist=substitute(include_files, ",", " ", "g")
let Grep_Skip_Dirs=substitute(exclude_dirs, ",", " ", "g")
let Grep_Skip_Files=substitute(exclude_files, ",", " ", "g")
let Grep_OpenQuickfixWindow = 1
"r:Recursive, n:line number, i:ignore case sensitive, w:search word unit 
let Grep_Default_Options = '-rn'

"_______________________________________________________________________________"
endif


if 0 "Command-T can be supported with recompilation added --enable-rubyinterp
"==============================================================================="
" Command-T plugin 
"-------------------------------------------------------------------------------"
"after install, you have to compile like this
"cd ~/.vim/ruby/command-t
"ruby exconf.rb
"make
"
"with bundle, both work fine
"cd ~/.vim/bundle/command-t
"rake make
"
" functionality summary
" <leader>t : current file list
" <leader>b : current buffer list
" ignore file listing
set wildignore+=*.o,*.obj,.git,*.jar,*.so,*.a,*.class,*.apk,*.
set wildignore+=*.js,*.html,*.jpg,*.png,*.gif,*.htm,*.jd,*.txvi,*.zip,*.exe,*.swp
set wildignore+=cts/**,docs/**,ndk/**,sdk/**,external/**,out/product/**,

"menu setting
let g:CommandTMaxFiles = 60000 "10000, " max file list up number, default:10000
let g:CommandTMaxDepth = 20 "15, " max directory depth
let g:CommandTMaxCachedDirectories=5 "1 " multiple cache size 
"let CommandTMaxHeight  "0, window hight 조절,0은 최대까지
"let CommandTAlwaysShowDotFiles "0, .확장자 보여줄지
"let CommandTNeverShowDotFiles "0, 1로 하면 .으로 시작하면 dot파일 검색이 가능
"let CommandTScanDotDirectories "0, 1로 하면 scan
"let CommandTMatchWindowAtTop "0, 1로 하면 window가 아랫쪽에 달림, 현재 위쪽
"let CommandTMatchWindowReverse "0, 1로 하면 검색 cursor가 아랫쪽에 달림
"
"key setting
" multiple key mapping for cancelling command-t window
let g:CommandTCancelMap=['<Esc>', '<C-x>', '<C-c>']
let g:CommandTAcceptSelectionSplitMap=['<C-CR>,<C-1>'] "가로분할
"let g:CommandTAcceptSelectionTabMap=['<C-t>'] "탭 분할
"let g:CommandTAcceptSelectionVSplitMap=['<C-v>'] "세로 분할


" default key mapping을 변경코자 하거나 동작이 안할 경우 :h command-t 참조
"_______________________________________________________________________________"
endif


if 0 
"==============================================================================="
" FuzzyFinder plugin settings
"-------------------------------------------------------------------------------"
"현재 디렉토리 이하에서 파일명으로 검색해서 읽어오기"

"openfile: file 찾기, **/는 모든 dir match
nnoremap <silent> <F2>hh :help my_fuzzy<CR> 
nnoremap <silent> <F2> :FufFile **/<CR> 
"parent dir:  dir 찾기
nnoremap <silent> <F2>p :FufDir<CR>

"recent file: 최근파일
nnoremap <silent> <F2>r :FufJumpList<CR>
"buffer list: move buffer"
nnoremap <silent> <F2>b :FufBuffer<CR> 
let g:fuf_maxMenuWidth = 200 

"_______________________________________________________________________________"
endif


if 1
"==============================================================================="
" fugitive plugin for GIT settings
"-------------------------------------------------------------------------------"
nnoremap <silent> <F4>hh :help my_git<CR>
nnoremap <silent> <F4> :Gstatus<CR>
nnoremap <silent> <F4>s :Gstatus<CR>
nnoremap <silent> <F4>b :Gblame<CR>
nnoremap <silent> <F4>c :Gcommit<CR>
nnoremap <silent> <F4>l :Glog --oneline<CR>

"_______________________________________________________________________________"
endif


if 1
"==============================================================================="
" inkpot plugin settings
"-------------------------------------------------------------------------------"
"minibuffexpl의 highlight 기능을 사용하려면 아래값을 disable해야 한다.
"let g:inkpot_black_background = 1


"_______________________________________________________________________________"
endif



if 1
"==============================================================================="
" NERD-Tree plugin settings
"-------------------------------------------------------------------------------"
map <F8>hh :help my_tree<CR>
map <F8> :NERDTreeToggle<CR>
"tree에서 현재 dir위치 찾아 표기하기
map <F8>f :NERDTreeFind <CR>

"bookmark는 여러 project를 돌아다니면서 작업하기 위해서 필요하다.
"또한 bookmark는 파일로 관리되기 때문에 vi를 종료해도 계속 보존된다.
"tree에서 bookmark로 표시하기 
nmap <F8>b :exe 'Bookmark ' . expand('<cword>') <CR>
"bookmark 파일 편집하기
nmap <F8>e :exe 'e '. NERDTreeBookmarksFile <CR>
"bookmark 파일 편집하기
nmap <F8>r :ReadBookmarks<CR>

"let NERDChristmasTree           "1     "색깔넣어서 예쁘게
"let NERDTreeAutoCenter          "1     "NERD Tree중 선택된 dir가 세로에서 중앙에 위치하게
"let NERDTreeAutoCenterThreshold "3     "중앙 위치 조정할 영역 임계치값 설정
"let NERDTreeCaseSensitiveSort   "0     "대소문자 구분
"let NERDTreeChDirMode           "0     "VIM working dir change할지 말지
"let NERDTreeHighlightCursorline "1     "현재 cursor line highlight 할지 말지
"let NERDTreeHijackNetrw         "1     "vi로 dir를 open시 native tree가 아닌 NERDtree로 open
"let NERDTreeIgnore              "\~$   "무시할 파일 선택
let NERDTreeBookmarksFile=expand(g:vim_root_path . '.NERDTreeBookmarks')
          "$HOME/.NERDTreeBookmarks     "북마크 저장소 위치
"let NERDTreeMouseMode           "1     "마우스 클릭 행동 정의,double click open
"let NERDTreeQuitOnOpen          "0     "파일 open후 NERD tree 자동 close
let NERDTreeShowBookmarks=1     "0     "NERDTree 시작시 bookmark 표기할지
"let NERDTreeShowFiles           "1     "NERDTree 시작시 dir와 file을 모두 표기할지
"let NERDTreeShowHidden          "0     "NERDTree 시작시 hidden 파일 표기할지
"let NERDTreeShowLineNumbers     "0     "NERDTree window에 line number 표시할지
"let NERDTreeSortOrder           "NA    "NERDTree 에서 dir sort 어떻게 할지
"let NERDTreeStatusline          "NA    "NERDTree window status line 표기방법
"let NERDTreeWinPos="right"      "left  "NERDTree 화면중 어디다 display할지
let NERDTreeWinSize=40          "31    "NERDTree Size 얼마로 할지
"let NERDTreeMinimalUI           "0     "NERDTree 최소모드,bookmark및 help없이 표기
"let NERDTreeDirArrows=1         "0     "NERDTree dir 표기시 +가 아닌 화살표로 표기할지
"_______________________________________________________________________________
endif


if 1
"==============================================================================="
" NERD-Commenter plugin settings
"-------------------------------------------------------------------------------"
"아래 해당 기능을 보려면 NERD_Commenter.txt 설명서에 keyword 검색을 하면 자세히 볼수있다.

"변수명                                defaultvalue   설명
"-------------------------------------------------------------------------------"
"let loaded_nerd_comments"             "1, enable/disable
"let NERDAllowAnyVisualDelims"         "1, Allows multipart alternative delims to be used when commenting in visual/visual-block mode.
"let NERDBlockComIgnoreEmpty"          "1, Forces right delims to be placed when doing visual-block comments.
"let NERDCommentWholeLinesInVMode"     "0, Changes behaviour of visual comments.
let NERDCreateDefaultMappings=1       "1, Turn the default mappings on/off.
let NERDDefaultNesting=0              "1, Tells the script to use nested comments by default.
"let NERDMenuMode=1"                     "3, Specifies how the NERD commenter menu will appear (if at all).
"let NERDUsePlaceHolders"              "1, Specifies which filetypes may use placeholders when nesting comments.
"let NERDRemoveAltComs"                "1, Tells the script whether to remove alternative comment delimiters when uncommenting.
"let NERDRemoveExtraSpaces"            "1, Tells the script to always remove theextra spaces when uncommenting (regardless of whether NERDSpaceDelims is set)
"let NERDLPlace"                       "[>, Specifies what to use as the left delimiter placeholder when nesting comments.
"let NERDRPlace"                       "<], Specifies what to use as the right delimiter placeholder when nesting comments.
let NERDSpaceDelims=1                 "0, Specifies whether to add extra spaces around delimiters when commenting, and whether to remove them when uncommenting.
"let NERDCompactSexyComs"              "0, Specifies whether to use the compact style sexy comments.

"_______________________________________________________________________________
endif


if 1
"==============================================================================="
" tagvar plugin settings
"-------------------------------------------------------------------------------"
nnoremap <silent> <F9>hh :help my_tag<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>

"변수명                                 defaultvalue   설명
"_______________________________________________________________________________
"let g:tagbar_ctags_bin              	"empty, $PATH에 ctag가 없을 경우, ctags의 위치지정
"let g:tagbar_left						"0, tagbar default위치는 오른쪽.
"let g:tagbar_width						"40, window width
"let g:tagbar_autoclose                 	"0, tag jump후 window 자동 닫기 할지
let g:tagbar_autofocus=1                 "0, tagvar열때 자동focus 이동할지
let g:tagbar_sort=0                      "1, tag sort할지 말지
"let g:tagbar_compact                    "0, tagbar를 mini mode로 보여줌
"let g:tagbar_expand                     "0, tagbar window width자동 조절, GUI 버젼일때
"let g:tagbar_singleclick                "0, mouse single click으로 이동
"let g:tagbar_foldlevel                  "99, 최대 unfold line수, 99라인이후는 fold
"let g:tagbar_iconchars                  "+/-, dir open/close 표시자
 	"let g:tagbar_iconchars = ['▶', '▼']  (default on Linux and Mac OS X)
 	"let g:tagbar_iconchars = ['+', '-']  (default on Windows)
let g:tagbar_autoshowtag=1              "0, tag가 close fold에 있을때 자동으로 unfold할것인지
let g:tagbar_updateonsave_maxlines=8000 "5000, 5000라인 이하 파일저장시 tagvar를 바로 update해라
"let g:tagbar_systemenc="cp949"         "encoding'
"
"_______________________________________________________________________________
endif


let g:loaded_srcexpl=1 "if it is defined, it is disabled
if 0 "Press ENTER or type command to continue, when run SrcExpl
"==============================================================================="
" Source Explorer
"-------------------------------------------------------------------------------"
""The switch of the Source Explorer
nnoremap <F10>hh :help srcexpl<CR>
"nnoremap <F10> :SrcExplToggle<CR>
"bugfix: Press ENTER or type command to continue, when run SrcExpl only one-time
nnoremap <F10> :SrcExplToggle<CR>:call g:SrcExpl_Refresh()<CR>
nnoremap <F10>c :SrcExplClose<CR>
nnoremap <F10>l :call g:SrcExpl_GoBack()<CR>

"let g:SrcExpl_winHeight = 8 "Set the height of Source Explorer window
let g:SrcExpl_refreshTime = 500 "Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_jumpKey = "<ENTER>" "Set Enter key to jump into the exact definition context
let g:SrcExpl_gobackKey = "<SPACE>" "Space key for back from the definition context

" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "-MiniBufExplorer-",
        \ "NERD_tree_1",
        \ "__Tagbar__",
        \ "Source_Explorer",
    \ ]
" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 0 

" // Let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0 

" // Use program 'ctags' with argument '--sort=foldcase -R' to create or
" // update a tags file
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F12>" key for updating the tags file artificially
""let g:SrcExpl_updateTagsKey = "<F12>" 

"_______________________________________________________________________________
endif


if 0 "ZoomWin is not necessary, if you want to maximize, make new tab for current file
"==============================================================================="
" ZoomWin 
"-------------------------------------------------------------------------------"
" Zoom Window Toggle, full window
" <C-W> o 
noremap <F6>hh :help my_zoom<cr>
" make maximize or minizise
nmap <F6> <C-w>o
" close currnet window
nmap <F6>c <C-w>c
" make all window same size
nmap <F6>= <C-w>=
"_______________________________________________________________________________
endif

if 1
"==============================================================================="
" Obvious Resize
"-------------------------------------------------------------------------------"
"move window layout
"lefthandside, downward, upward, righthandsie 
noremap <F6>h <C-w>H 
noremap <F6>j <C-w>J
noremap <F6>k <C-w>K
noremap <F6>l <C-w>L

"move cursor to the window
"-------------------------------------------------------------------------------"
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

"_______________________________________________________________________________
endif


"let loaded_minibufexplorer = 0
if 1 "minibufexpl이 nerdtree등과 동작할때 2개의 window를 만드는 버그가 있어 hide 처리
"==============================================================================="
" MiniBufExplorer plugin settings
"-------------------------------------------------------------------------------"
" 열린 파일 리스트 보여주기

nnoremap <silent> <F5>hh :help my_mini<CR> 
"nnoremap <silent> <F5> :TMiniBufExplorer<CR>
nnoremap <silent> <F5> :MiniBufExplorer<CR>
nnoremap <silent> <F5><F5> :CMiniBufExplorer<CR>

function! MiniBufWinFix()
    call CMinibufExplorer()
    let longest = max(map(range(1, line('$')), "virtcol([v:val, '$'])"))
    exec "vertical resize " . (longest+4)
endfunction 
"miniBufExplorer 2개 이상 뜨는 버그 수정으로 splitbelow를 선언해야 한다.
set splitbelow "default window 배치 설정: 선언시 상하

let g:miniBufExplSplitBelow=0  "0:up or left, 1: below or right
let g:miniBufExplSplitToEdge=1
"let g:miniBufExplVSplit = 20 "가로 정렬일때 Height
let g:miniBufExplorerMoreThanOne =2 "buffer가 2개 이상일때만 load되도록
let g:miniBufExplMapWindowNavVim =1 "0, "ctrl+hjkl window move"
"let g:miniBufExplMapWindowNavArrows  "1, "ctrl+arrow window move"
"let g:miniBufExplMapCTabSwitchBufs  "1, "ctrl+tab buffer move"
"let g:miniBufExplMapCTabSwitchWindows  "1, "ctrl+tab buffer windows"
let g:miniBufExplUseSingleClick =1 "1, "mouse로 선택시 single click으로 선택
let g:miniBufExplModSelTarget =1 "1, "Taglist나 그밖에 윈도우와 함께 사용할때
let g:miniBufExplCloseOnSelect =1 "1, minibuf에서 선택시 자동으로 minibuf window hide
let g:miniBufExplForceSyntaxEnable = 1 "1, coloring 동작 보장
let g:miniBufExplCheckDupeBufs = 0 "0, over 15 window, ban slow down

"error level for debugging, 0<x<10
"let g:miniBufExplorerDebugLevel = 10 " MBE reports everything

"" MiniBufExpl Colors
"-------------------------------------------------------------------------------"
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg

"_______________________________________________________________________________
endif


if 1
"==============================================================================="
" obvious-resize
"-------------------------------------------------------------------------------"
" 좌상하우--> hjkl --> uiop
noremap <silent> <C-u> :ObviousResizeLeft<CR>
noremap <silent> <C-i> :ObviousResizeDown<CR>
noremap <silent> <C-o> :ObviousResizeUp<CR>
noremap <silent> <C-p> :ObviousResizeRight<CR>
"_______________________________________________________________________________
endif


if 1 "Dirdiff for comparing directory & files
"==============================================================================="
" DirDiff
"-------------------------------------------------------------------------------"
"Sets default exclude pattern: filelist
let g:DirDiffExcludes = g:exclude_files
let g:DirDiffIgnore = "Id:,Revision:,Date:"
"If DirDiffSort is set to 1, sorts the diff lines. 1:sort,0:not sort
let g:DirDiffSort = 1
"Sets the diff window (bottom window) height (rows)
let g:DirDiffWindowSize = 14
"Ignore case during diff, 1:ignore, 0:case sensitive
let g:DirDiffIgnoreCase = 0

"preprocess
function! FUNC_Test()
   BundleInstall
endfunction
nmap <F1>t :call FUNC_Test()<cr>


"preprocess
if !exists("g:func_prepro") 
"==============================================================================="
let g:func_prepro = 1
function! FUNC_PreProcess()
    exe "silent !rm -f " . "~/.vimrc"
    exe "silent !ln -s " . g:vim_root_path . ".vimrc ~/.vimrc"
    exe "silent !mkdir -p " . g:vim_root_path . "bundle/vundle/"
    exe "silent !git clone " . "git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
    sleep 200m
    so $MYVIMRC
    BundleInstall
    sleep 500m
    close
    call FUNC_CopyNERDDiff("myNerdTreePlugin.setting", "bundle/The-NERD-tree/nerdtree_plugin/myNerdTreePlugin.vim")
    call FUNC_CopyNERDDiff("DirDiff.setting", "bundle/DirDiff.vim/plugin/DirDiff.vim")
    helptags ~/.vim/doc
    so $MYVIMRC
    redraw!
endfunction

"with NERDTree
function! FUNC_CopyNERDDiff(sour, dest)
    if filereadable(g:vim_root_path . a:sour) 
        return 
    else
        exe "silent !cp -f " . g:vim_root_path . a:sour . ' ' .  g:vim_root_path . a:dest
    endif
endfunction

nmap <F1>z :call FUNC_PreProcess()<cr>

"_______________________________________________________________________________
endif
"_______________________________________________________________________________
endif



" tabs
"-------------------------------------------------------------------------------"
"noremap <F5>hh :help my_mini<cr>
" create a new tab
noremap <F5>n :tabnew %<cr>
noremap <LocalLeader>tn :tabnew %<cr>
" close a tab
noremap <F5>c :tabclose<cr>
noremap <LocalLeader>tc :tabclose<cr>

" previous tab
noremap <F5>h :tabprev<cr>
" next tab
noremap <F5>l :tabnext<cr>
" previous buffer
noremap <F5>k :bn<cr>
" next buffer
noremap <F5>j :bp<cr>



if 1
"==============================================================================="
"ctags"
"-------------------------------------------------------------------------------"
if version >= 600

"setting for basic operation
nmap <F12>hh :help my_find<cr>
"create: ctag create
nmap <F12>c :call FUNC_ctags_create()<cr>
nmap <F12><F12> <C-t>
nmap <F12> <C-]>
"reference: 현재 cursor의 symbol과 비슷한 symbol defintion 찾기, regexp
"nmap <F12>s :call FUNC_ctags_search()<cr>
nmap <F12>s :ltag /^<C-R>=expand("<cword>")<CR>$

"setting for view
"definition preview in horizontal/vertical/tab 
nmap <F12>v <C-W><C-]>
nmap <F12>vv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nmap <F12>vt :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"이전 검색한 symbol이 jump할수 있는 list보여주기
nmap <F12>7 :lclose<cr>
nmap <F12>8 :lopen<cr>
nmap <F12>9 :tp<cr>
nmap <F12>0 :tn<cr>
"set tags=tags,TAGS,$PWD/tags,$HOME/.vim/tags
set tags=tags,TAGS
execute "set tags+=".g:RootDir."/tags"
"set tags+=$HOME/.vim/tags
"set tags+=FUNC_ctags_create()


"generate absolute path to using ctags at any directory"
    func! FUNC_ctags_create()
        exe "!echo [ctag will be created, enter to continue, or Ctrl-C]"
        exe "!$HOME/.vim/myctags.sh" g:RootDir
    endfunc

    func! FUNC_ctags_search()
        let st = expand("<cword>")
        exe "ltag /^".st
    endfunc

endif
"_______________________________________________________________________________
endif


if 1 "cscope는 data가 크고 느려서 쓰는것을 추천하지 않는다
"==============================================================================="
"cscope"
"-------------------------------------------------------------------------------"
" cs show : cscope tag 위치 보기
" cscope cfg"
set csprg=/usr/bin/cscope "which cscope" 
"cscope와 ctag를 하나의 key 쓰기=0, 각각 쓰기=1
set csto=1
"cst가 설정되면 ctag와 cscope 둘다 search
"set cst
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
set nocsverb
exe "cs add " . g:RootDir . "/cscope.out" 
"make verbose
set csverb
"""" basic operation
nmap <F11>7 :cclose<cr>
nmap <F11>8 :copen<cr>
nmap <F11>9 :tp<cr>
nmap <F11>0 :tn<cr>
nmap <F11><F11> <C-t>

nmap <F11>hh  :help my_cscope<cr>
nmap <F11>c  :call FUNC_cscope_create()<cr>

"""" cscope search
nmap  <F11>   :call FUNC_cscope_search()<cr>
"text search
"e 경우 앞뒤로 space 한개씩
nmap  <F11>s  :cs find e /*<C-R>=expand("<cword>")<CR>/* 
nmap  <F11>t  :cs find t  <C-R>=expand("<cword>")<CR> 
nmap  <F11>er :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap  <F11>ee :cs find d <C-R>=expand("<cword>")<CR><CR>

"""" cscope file open
nmap  <F11>f  :cs find f \/<C-R>=expand("<cword>")<CR>\.<CR>
nmap  <F11>ff :cs find f \/*?<C-R>=expand("<cword>")<CR><CR>
nmap  <F11>d  :cs find f \/*?<C-R>=expand("<cword>")<CR>*?\/<CR>
"header file 경우는 별도로 필요없다.
"nmap  <F11>h  :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	
    func! FUNC_cscope_create()
        exe "!echo [cscope will be created, enter to continue, or Ctrl-C]"
        exe "!$HOME/.vim/mycscope.sh" g:RootDir
    endfunc

    func! FUNC_cscope_search()
        let st = expand("<cword>")
        exe "cs find g ".st
    endfunc

"_______________________________________________________________________________
endif



if 0 "Trinity not needed anymore"
"==============================================================================="
" Trinity plugin settings + NERDTree, Taglist, Src Explorer
"_______________________________________________________________________________
endif


if 0 "use FizzyFinder"
"==============================================================================="
" BufKill  plugin settings
"-------------------------------------------------------------------------------"
"map <C-r> :BD<CR> 
"_______________________________________________________________________________
endif


if 0 "FuzzyFinder more usfule"
"==============================================================================="
" BufExplorer plugin settings
"_______________________________________________________________________________
let g:bufExplorerShowDirectories=0   " Don't show directories.
endif



if 0 "NERDTree is more useful"
"==============================================================================="
" WinManager plugin settings
"-------------------------------------------------------------------------------"
inoremap <C-o> <ESC> :WMToggle<CR> <C-w>h
nnoremap <C-o> :WMToggle<CR>  <C-w>h

let winManagerWindowLayout = 'FileExplorer|BufExplorer'
let g:persistentBehaviour = 0
"_______________________________________________________________________________
endif


if 0 "we don't use c++ auto complete much"
"==============================================================================="
" OmniCppComplete plugin settings
"-------------------------------------------------------------------------------"
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_DisplayMode = 0
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr = 0
let OmniCpp_ShowAccess = 1
let OmniCpp_DefaultNamespaces = []
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 0
let OmniCpp_SelectFirstItem = 0
let OmniCpp_LocalSearchDecl = 0

"_______________________________________________________________________________
endif


if 0 " tagvar is more powerful, it provide multi class-methods orders in single file
"==============================================================================="
" taglist plugin settings
"-------------------------------------------------------------------------------"
nnoremap <silent> <F9> :Tlist<CR>
"now Tlst_Auto_Update = 1 , then auto updated
""nnoremap <silent> <F7> :TlistUpdate<CR>

let g:Tlist_Inc_Winwidth = 0
let g:Tlist_Auto_Open = 0
let g:Tlist_Process_File_Always = 0
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_Display_Tag_Scope = 0
let g:Tlist_Sort_Type = "name"
let g:Tlist_Use_Left_Window = 1
let g:Tlist_Display_Prototype = 0
let g:Tlist_Exit_OnlyWindow = 1
"for open file in the same window with Tlist
"let g:Tlist_File_Fold_Auto_Close = 1
let g:Tlist_Compact_Format = 1
" Always display one file tags
let g:Tlist_Show_One_File = 1

""let Tlist_Ctags_Cmd = '$HOME/bin/ctags.exe'   "Cygwin-specific option

"_______________________________________________________________________________
endif


"environments 
"=============================================================================="
set nocompatible "vi orinianal과 호환불가", 참고로 최근에는 모드 vim을 사용한다.
set matchpairs+=<:> "{},[],()
set ttymouse=xterm 
set ttyfast "fast terminal transfer

set mouse=a ""use the mouse in all modes
set mousemodel=popup_setpos  "mouse button behavior
set nobackup "backup file, 생성안함"
set noswapfile "swap파일 생성 안함
"set autochdir "chdir to the file located when opening file 
"가끔 위의 명령은 plugin에서 동작알될때가 있다. 그 경우 아래 사용
autocmd BufEnter * silent! lcd %:p:h 


"encoding 
"=============================================================================="
set encoding=utf-8 "read encoding"
set fileencoding=utf-8 "write encoding: fenc"
set fileencodings=utf-8,cp949,unicode "write encoding: fencs"
set fileformat=unix
set fileformats=unix,dos,mac
"set termencoding=utf-8

"만약 OS라는 환경변수가 Window라는 문자열을 포함하고 있다면 ~ pattern matching
if $OS =~ 'Window'
    set termencoding=korea                " Cygwin-specific option
endif


"search 
"=============================================================================="
set maxmempattern=1000
set magic "search시 pattern입력시 특수문자 입력시 backslash를 달아야 한다.
set nowrapscan "마지막까지 search시 처음으로 돌아가지 않도록, or viceverse
set hlsearch "when searching by using /, hilight match word"
"search시 hlsearch로 highlight 이후 un-highlight할때 
nmap <silent> <leader>/ :nohlsearch<CR> 
"set incsearch "with hlsearch incremetal search", slow for big-size file

""search pattern시 대소문자 구별을 하지 않는다.
"ignorecase toggle을 원하면 :set ic!
set ignorecase 

"search pattern이 모두 소문자이면 실제 검색시 대소문자 구별 안한다.
"만약 구별을 해야 한다면 xxx search시 /\Cxxx로 검색해라
set smartcase 


"autoe complete 
"=============================================================================="
set history=200 "viminfo history buffer"
set completeopt+=menuone
set complete-=i
set complete-=t
set wildchar=<Tab> "autocomplete에 사용되는 key
set wildmenu "autocomplete시 simple menu를 보여줌
set wildmode=longest:full,full

set smartindent "똑똑한 indent"
set autoindent "자동 indent in newline"
set cindent "c일때 자동 indent"
set cinoptions=:0,g0,(0,l1,t0
set nofoldenable "not folding"


" autocomplete for braket,quote,etc
" ---------------------------------
" bracket autocompletion
"autocmd Syntax html,vim inoremap < <lt>><ESC>i| inoremap > <c-r>=ClosePair('>')<CR>


"folds code close/open
"-------------------------------------------------------------------------------"
"toggle open/close
nnoremap <LocalLeader><LocalLeader>t za 
"close all
nnoremap <LocalLeader><LocalLeader>c zM 
"open all
nnoremap <LocalLeader><LocalLeader>o zR 


" VimDiff
"-------------------------------------------------------------------------------"
"import
nnoremap <LocalLeader><LocalLeader>i do
"export
nnoremap <LocalLeader><LocalLeader>e dp
"next
nnoremap <LocalLeader><LocalLeader>j ]c
"previous
nnoremap <LocalLeader><LocalLeader>k [c



"editing  
"=============================================================================="
set hidden "새로운 buffer를 열기전에 이전 buffer를 반드시 저장하지v않아도(hidden) 된다 
"set autoread "file auto reload, when file is changed outside
"set autowrite "아래와 같은 명령시 자동으로 저장 하는 가에 대한 옵션이다.
            " :next, :rewind, :last, :first, :previous, :stop, :suspend, :tag, :!,
set clipboard+=unnamed " share windows clipboard
set backspace=indent,eol,start "make backspace more flexible

"for real tab not 4space, plz input <C-V> <TAB>
set expandtab "use space instead of tab"
set tabstop=4 "tab key를 4width로 조정"
set shiftwidth=4 "auto indentation시 width"
set softtabstop=0

" toggle paste mode, when you copy text from external clipboard, and paste, ban cascading indentation
set pastetoggle=<Ins>
"nmap <LocalLeader>pp :set pastetoggle<cr>

" when you open root previledged file, and save please use w!!
cmap w!! w !sudo tee % >/dev/null 
    

"unix format으로 변경하고,"trailing space 지우기
func! FUNC_dos2unix()
    %s///g
    %s/\s\+$//
endfunc
nmap  <LocalLeader>unix :call FUNC_dos2unix()<cr>


"move cursor
"=============================================================================="
"한줄이 너무 길어 여러줄을 가진 경우라도 줄단위로 이동하라
nnoremap j gj
nnoremap k gk
set startofline "이동명령시(H,M,L,G,c-f,c-d) line의 첫번째로 cursor 이동"


"window 
"=============================================================================="
set laststatus=2 "status bar를 window갯수에 상관없이 항상 표시해라
set ruler "show col,row position of cursor"
set number "show line number"
set scrolloff=5 "last 5 line scroll start
set sidescrolloff=5 "last 5 column scroll start"
set report=0 "몇줄이 바꿨는지 statusbar에 알려주는 기능을 0이면 항상 on, 숫자면 그이상이면 on"
set selection=exclusive
set showcmd "show current command"
set showmatch "matched brace highlighting"
set showmode


function! AddStatuslineFlag(varName, goodValues)
    set statusline+=[
    set statusline+=%#error#
    exec "set statusline+=%{RenderStlFlag(".a:varName.",'".a:goodValues."',1)}"
    set statusline+=%*
    exec "set statusline+=%{RenderStlFlag(".a:varName.",'".a:goodValues."',0)}"
    set statusline+=]
endfunction

function! RenderStlFlag(value, goodValues, error)
    let goodValues = split(a:goodValues, ',')
    let good = index(goodValues, a:value) != -1
    if (a:error && !good) || (!a:error && good)
        return a:value
    else
        return ''
    endif
endfunction

set statusline=%F%m%r%h%w
call AddStatuslineFlag('&ff', 'unix') "suppress unix
call AddStatuslineFlag('&fenc', 'utf-8') "suppress utf-8
set statusline+=[%p%%][%l/%L,%02v]
"set statusline=%F%m%r%h%w[%L][%{&ff}:%{&encoding}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |                |     |    |
"              | | | | |  |   |      |                |     |    + current 
"              | | | | |  |   |      |                |     |       column
"              | | | | |  |   |      |                |     +-- current line
"              | | | | |  |   |      |                +-- current % into file
"              | | | | |  |   |      +-- current syntax in square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- modified flag in square brackets
"              +-- full path to file in the buffer
set title "show title"
"set virtualedit=onemore                        " Has to be used with caution!!
set nowrap "auto 줄바꿈 안함"
set textwidth=120 "줄바꿈시 120 column
set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
"             | | | | | | | | |
"             | | | | | | | | +-- "]" Insert and Replace
"             | | | | | | | +-- "[" Insert and Replace
"             | | | | | | +-- "~" Normal
"             | | | | | +-- <RightNormal and Visual
"             | | | | +-- <LeftNormal and Visual
"             | | | +-- "l" Normal and Visual (not recommended)
"             | | +-- "h" Normal and Visual (not recommended)
"             | +-- <SpaceNormal and Visual
"             +-- <BSNormal and Visual>>>>>
"set visualbell "경고소리 깜빡임으로 대치"
"set noerrorbells "경고음 없앰"

" setup for the visual environment
if has('gui_running')
	colorscheme inkpot
	"echo "gui_running"
else
	"echo "gui_running not running"
	if $TERM =~ '^xterm'
		set t_Co=256
	elseif $TERM =~ '^screen-bce'
		set t_Co=256            " just guessing
	elseif $TERM =~ '^screen'
		set t_Co=256            " just guessing, too
	elseif $TERM =~ '^rxvt'
		set t_Co=88
	elseif $TERM =~ '^linux'
		set t_Co=8
	elseif $TERM =~ '^cygwin'
		set t_Co=8
	else
		set t_Co=16
	endif

	if &t_Co > 16
		colorscheme inkpot "dark theme
		"colorscheme jellybeans "dark theme, 부드러움
		"colorscheme wombat "dark theme, 고대비 강조
		"colorscheme peaksea "white theme
		"set background=dark

	else
		colorscheme ron
	endif
endif


"==============================================================================="
" mapping grammar
"==============================================================================="
"{cmd} {attr} {lhs} {rhs}
"
"where
"{cmd}  is one of ':map', ':map!', ':nmap', ':vmap', ':imap',
"       ':cmap', ':smap', ':xmap', ':omap', ':lmap', etc.
"{attr} is optional and one or more of the following: <buffer>, <silent>,
"       <expr> <script>, <unique> and <special>.
"       More than one attribute can be specified to a map.
"{lhs}  left hand side, is a sequence of one or more keys that are being
"       mapped.
"{rhs}  right hand side, is the sequence of keys that the {lhs} keys are
"       mapped to.
"{cmd}!??-------------------------------------------------------------------------      
"map 각 모드별 단축키/ 해제는 map앞에 un을 부텨 unmap으로 해주면 된다. 
"map/unmap은 모든 모드에서 mapping/unmapping, norempp은 모든모드에서 no recursive mapping
"map!는 insert/command 모드로 mapping
"
"nmap/nnomap : 일반 모드
"imap/inomap : 입력 모드
"vmap/vnomap : visual 모드 & select 모드
"smap/snomap : select 모드
"xmap/xnomap : visual 모드
"cmap/cnomap : 명령행 모드
"omap/onomap : operator pending 모드
"
"remap : recursive maping and it is default
"noremap : no recursive maping and 
"
"example)
"map j gg
"map Q j
"noremap W j
"
"j will map gg, but W map only j not gg
"==============================================================================="


syntax on
filetype on 
filetype plugin on "filetype에 따라 plugin이 동작해라
filetype indent on "indentation도 마찬가지

"==============================================================================="
"au(autocommand) : register user callback
"==============================================================================="

""in makefile, don't use space instead of tab'
autocmd BufNewFile,BufReadPost mk Makefile set noexpandtab
"autocmd FileType man    


"c,cpp,java file, if you put % to match, =,; toggled matched
autocmd FileType c,cpp,java set mps+==:;
"  ---------------------- -------  --------------
"  on event                file    do command"
">>>on event: 
"BufNewFile: starting to edit a non-existent file
"BufReadPre/BufReadPost: starting to edit an existing file
"FilterReadPre/FilterReadPost: read the temp file with filter output
"FileRead/PreFileReadPost: any other file read
">>>file: *.c, x.x
">>>cmd: set noexpandtab, 


"Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif



"==============================================================================="
" General key mappting
"==============================================================================="


"favorites 
"=============================================================================="
":echo $MYVIMRC
let g:myhelp="~/.vim/doc/rock.txt"
nmap <silent> <F1>hh :help my_help<CR>
nmap <silent> <F1>e :e $MYVIMRC<CR>
nmap <silent> <F1>r :so $MYVIMRC<CR>
nmap <silent> <F1>m :exe "e " .g:myhelp <CR>
nmap <silent> <F1>l :call LaunchShell()<CR>
"help: update new help tags
nmap <F1>u :helptags ~/.vim/doc <CR>
nnoremap <F1> :call ToggleVimTips()<CR>
nnoremap <F1>d :call ToggleVerbose()<CR>

function! LaunchShell()
    let oldCWD = getcwd()
    set shell=/bin/bash\ -i 
    exec 'lcd ' .  oldCWD
    shell
endfunction

"shell
"=============================================================================="
"you can run shell with alias, cd path
"set shell=/bin/bash\ -i 
"you can run shell with alias, reload .vimrc
"set shell=/bin/bash\ --login


" show my help 
"-------------------------------------------------------------------------------"
let g:MyVimTips="off"
function! ToggleVimTips()
    if g:MyVimTips == "on"
        let g:MyVimTips="off"
        "pclose
        bd "rock.txt"
    else
        let g:MyVimTips="on"
        ""for bottom or right help
        "bo help my 
        ""for up or left help
        to help my 
        ""for veritacal bottom or right help,즉 오른쪽으로 
        "vert bo help my
        "tab help my "for tab help
    endif
endfunction

function! ToggleVerbose()
    if !&verbose
        echo '~/.vim_trace.log will be saved'
        set verbosefile=~/.vim_trace.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunction


if 0
" Quit VIM if current buffer is the last without modifing needless of plugin windows 
"-------------------------------------------------------------------------------"
function! NERDTreeQuit()
    redir => buffersoutput
    silent buffers
    redir END
    "                     1BufNo  2Mods.     3File           4LineNo
    let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
    let windowfound = 0

    for bline in split(buffersoutput, "\n")
        let m = matchlist(bline, pattern)

        if (len(m) > 0)
            if (m[2] =~ '..a..')
                let windowfound = 1
            endif
        endif
    endfor

    if (!windowfound)
        quitall
    endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
endif 

"-------------------------------------------------------------------------------"
