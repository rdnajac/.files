function! NewCHeader(filename)
    let headerFilename = a:filename . ".h"
    let capsFilename = toupper(a:filename)
    let content = ["#ifndef _" . capsFilename . "_H", "#define _" . capsFilename . "_H", "", "#endif /* _" . capsFilename . "_H */"]
    call writefile(content, headerFilename)
    echo "header file created: " . headerFilename
endfunction
