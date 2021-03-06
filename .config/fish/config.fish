neofetch

export EDITOR='vim'

set fish_greeting

function fish_prompt
    echo (set_color 403434) '------------------------------------------------------------'
    echo (set_color 087DC0)(pwd|sed "s=$HOME=~=")(set_color 847BE4)' » '(set_color normal)
end

function transfer
    if test (count $argv) -eq 0
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    end
    set tmpfile ( mktemp -t transferXXX )
    set file $argv[1]
        set basefile (basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
        if test -d $file
            set zipfile ( mktemp -t transferXXX.zip )
            zip -r -q - $file >> $zipfile
            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
            rm -f $zipfile
        else
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
        end
    cat $tmpfile
    rm -f $tmpfile
end

alias ...='cd /'
alias update='pacaur -Syu --noconfirm; sudo pacman -Rns (sudo pacman -Qttdq) --noconfirm; pacaur -Sc --noconfirm; rm -rf /home/josh/.cache/*'
alias moreupdate='pacaur -Syu --noconfirm; sudo pacman -Rns (sudo pacman -Qttdq) --noconfirm; pacaur -Scc; rm -rf /home/josh/.cache/*'
alias pacman='sudo pacman'

set -gx LESS_TERMCAP_mb \e"[01;31m" 
set -gx LESS_TERMCAP_md \e"[1;31m" 
set -gx LESS_TERMCAP_me \e"[0m"
set -gx LESS_TERMCAP_se \e"[0m" 
set -gx LESS_TERMCAP_so \e"[1;44;33m"
set -gx LESS_TERMCAP_ue \e"[0m"
set -gx LESS_TERMCAP_us \e"[1;32m"
