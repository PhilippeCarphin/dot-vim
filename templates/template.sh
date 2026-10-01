#!/usr/bin/env -S bash -o errexit -o nounset -o errtrace -o pipefail -O inherit_errexit -O nullglob -O extglob

usage(){
    cat <<- EOF
		${0##*/}
	EOF
}

main(){

    while getopts "h" opt ; do
        case ${opt} in
            h) usage ; exit 0 ;;
        esac
    done

}

main "$@"

