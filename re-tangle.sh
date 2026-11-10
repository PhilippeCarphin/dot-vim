this_dir=$(cd -P $(dirname $0) && pwd)
while read _ _ file ; do
    case $file in
        vimconfig.org) continue ;;
        plugin/*) continue ;;
        pack/*) continue ;;
        syntax/sh.vim) continue ;;
    esac
    echo "ERROR: The file '$file' has staged or unstaged modifications" >&2
    exit 1
done < <(git diff --staged --numstat ; git diff --numstat)

p.org-tangle ${this_dir}/vimconfig.org
