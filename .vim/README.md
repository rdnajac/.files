# .vim

My Vim configuration.

<!-- TODO: add image sources -->

## Cheatsheet

![Vim Cheatsheet](./assets/vim-cheatsheet.png)

## Pipes

![Vim Pipes](./assets/vim-pipes.png)

## `--version`

```console
VIM - Vi IMproved 9.1 (2024 Jan 02, compiled May 09 2024 07:15:02)
macOS version - arm64
Included patches: 1-400
Compiled by Homebrew
Huge version without GUI.  Features included (+) or not (-):
+acl               +file_in_path      +mouse_urxvt       -tag_any_white
+arabic            +find_in_path      +mouse_xterm       -tcl
+autocmd           +float             +multi_byte        +termguicolors
+autochdir         +folding           +multi_lang        +terminal
-autoservername    -footer            -mzscheme          +terminfo
-balloon_eval      +fork()            +netbeans_intg     +termresponse
+balloon_eval_term +gettext           +num64             +textobjects
-browse            -hangul_input      +packages          +textprop
++builtin_terms    +iconv             +path_extra        +timers
+byte_offset       +insert_expand     +perl              +title
+channel           +ipv6              +persistent_undo   -toolbar
+cindent           +job               +popupwin          +user_commands
-clientserver      +jumplist          +postscript        +vartabs
+clipboard         +keymap            +printer           +vertsplit
+cmdline_compl     +lambda            +profile           +vim9script
+cmdline_hist      +langmap           -python            +viminfo
+cmdline_info      +libcall           +python3           +virtualedit
+comments          +linebreak         +quickfix          +visual
+conceal           +lispindent        +reltime           +visualextra
+cryptv            +listcmds          +rightleft         +vreplace
+cscope            +localmap          +ruby              +wildignore
+cursorbind        +lua               +scrollbind        +wildmenu
+cursorshape       +menu              +signs             +windows
+dialog_con        +mksession         +smartindent       +writebackup
+diff              +modify_fname      +sodium            -X11
+digraphs          +mouse             +sound             -xattr
-dnd               -mouseshape        +spell             -xfontset
-ebcdic            +mouse_dec         +startuptime       -xim
+emacs_tags        -mouse_gpm         +statusline        -xpm
+eval              -mouse_jsbterm     -sun_workshop      -xsmp
+ex_extra          +mouse_netterm     +syntax            -xterm_clipboard
+extra_search      +mouse_sgr         +tag_binary        -xterm_save
-farsi             -mouse_sysmouse    -tag_old_static
   system vimrc file: "$VIM/vimrc"
     user vimrc file: "$HOME/.vimrc"
 2nd user vimrc file: "~/.vim/vimrc"
 3rd user vimrc file: "~/.config/vim/vimrc"
      user exrc file: "$HOME/.exrc"
       defaults file: "$VIMRUNTIME/defaults.vim"
  fall-back for $VIM: "/opt/homebrew/share/vim"
Compilation: clang -c -I. -Iproto -DHAVE_CONFIG_H -DMACOS_X -DMACOS_X_DARWIN -g -O2 -D_REENTRANT -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
Linking: clang -o vim -lm -lncurses -lsodium -liconv -lintl -framework AppKit -L/opt/homebrew/opt/lua/lib -llua5.4 -mmacosx-version-min=14.2 -fstack-protector-strong -L/opt/homebrew/opt/perl/lib/perl5/5.38/darwin-thread-multi-2level/CORE -lperl -L/opt/homebrew/opt/python@3.12/Frameworks/Python.framework/Versions/3.12/lib/python3.12/config-3.12-darwin -lpython3.12 -framework CoreFoundation -lruby.3.3 -L/opt/homebrew/Cellar/ruby/3.3.1/lib
```

## Spell Checking

Download [cspell](http://streetsidesoftware.github.io/cspell/)
dictionaries from [cspell-dicts](https://github.com/streetsidesoftware/cspell-dicts/tree/main/dictionaries)

## References

- [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)
- Google's Vimscript Style Guide:
  - [Vimscript Style Guide](https://google.github.io/styleguide/vimscriptguide.xml)
  - [Vimscript Full Style Guide](https://google.github.io/styleguide/vimscriptfull.xml)
- [No Plugins](https://github.com/changemewtf/no_plugins)
- [Idiomatic Vimrc](https://github.com/romainl/idiomatic-vimrcr)
- [Five Minute Vimscript](http://andrewscala.com/vimscript/)

---

> Any sufficiently complicated set of Vim plugins contains an ad hoc, informally-
> specified, bug-ridden, slow implementation of half of Vim's features.
>
> _robertmeta's tenth rule_
