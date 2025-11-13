let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Desktop/Seated
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +50 backend/SeatedBackend/Models/Seat.cs
badd +2 backend/SeatedBackend/DTOs/SeatDtos.cs
badd +31 ~/Desktop/Seated/mobile/package-lock.json
badd +1 ~/Desktop/Seated/mobile/.env
badd +71 ~/Desktop/Seated/mobile/.gitignore
badd +1 ~/Desktop/Seated/.gitignore
badd +3 ~/Desktop/Seated/mobile/expo-env.d.ts
badd +1 ~/Desktop/Seated/backend/SeatedBackend/DTOs/EventDtos.cs
badd +214 ~/Desktop/Seated/backend/SeatedBackend/Controllers/SeatController.cs
badd +71 ~/Desktop/Seated/mobile/app/(tabs)/_layout.tsx
badd +1 ~/Desktop/Seated/backend/SeatedBackend/DTOs/ImageUploadDto.cs
badd +49 ~/Desktop/Seated/docker/docker-compose.dev.yml
badd +91 ~/Desktop/Seated/mobile/app/(tabs)/Eventpage/event.tsx
badd +46 mobile/app/(tabs)/Eventpage/components/queuing.tsx
badd +12 ~/Desktop/Seated/mobile/app/(tabs)/Eventpage/components/CancelQueueModal.tsx
badd +22 ~/Desktop/Seated/mobile/app/(tabs)/Eventpage/components/viewEvent.tsx
badd +1 ~/Desktop/Seated/mobile/app/(tabs)/Eventpage/components/Eventpage/app/(tabs)/home/batman/Desktop/Seated/mobile/app/(tabs)/Eventpage
badd +5 ~/Desktop/Seated/mobile/app/(tabs)/Eventpage/SeatMapView.tsx
badd +28 mobile/app/(tabs)/Eventpage/Queuing.tsx
argglobal
%argdel
edit mobile/app/(tabs)/Eventpage/Queuing.tsx
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal nobinary
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
setlocal complete=.,w,b,u,t
setlocal completefunc=
setlocal completeslash=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal cursorline
setlocal cursorlineopt=both
setlocal nodiff
setlocal eventignorewin=
setlocal expandtab
if &filetype != 'typescriptreact'
setlocal filetype=typescriptreact
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=v:lua.vim.lsp.formatexpr()
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatoptions=jcroql
setlocal iminsert=0
setlocal imsearch=-1
setlocal includeexpr=
setlocal indentexpr=nvim_treesitter#indent()
setlocal indentkeys=0{,0},0),0],0,,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,$,#
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal list
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=v:lua.vim.lsp.omnifunc
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal shiftwidth=2
setlocal signcolumn=yes
setlocal nosmartindent
setlocal nosmoothscroll
setlocal softtabstop=-1
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\\t\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=noplainbuffer
setlocal statuscolumn=
setlocal statusline=%#lualine_a_normal#\ NORMAL\ %#lualine_transitional_lualine_a_normal_to_lualine_b_normal#%#lualine_b_normal#\ \ backend/venues\ %#lualine_b_diagnostics_error_normal#\ \ 0\ %#lualine_b_diagnostics_warn_normal#\ 2\ %#lualine_b_diagnostics_info_normal#\ 0\ %#lualine_b_diagnostics_hint_normal#󰌶\ 2\ %#lualine_transitional_lualine_b_diagnostics_hint_normal_to_lualine_c_normal#%<%#lualine_c_normal#\ mobile/app/(tabs)/Eventpage/Queuing.tsx\ %#lualine_c_normal#%=%#lualine_c_normal#\ utf-8\ %#lualine_c_normal#\ \ %#lualine_x_filetype_DevIconTsx_normal#\ \ %#lualine_c_normal#typescriptreact\ %#lualine_c_normal#%#lualine_c_normal#\ \ 188\ %#lualine_transitional_lualine_b_normal_to_lualine_c_normal#%#lualine_b_normal#\ 31%%\ %#lualine_transitional_lualine_a_normal_to_lualine_b_normal#%#lualine_a_normal#\ \ 59:35\ 
setlocal suffixesadd=.ts,.d.ts,.tsx,.js,.jsx,.cjs,.mjs
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=2
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal textwidth=0
setlocal undofile
setlocal varsofttabstop=
setlocal vartabstop=
setlocal winblend=0
setlocal nowinfixbuf
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal winhighlight=
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 59 - ((32 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 59
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
e ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
