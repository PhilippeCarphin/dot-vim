#!/usr/bin/env bash
    cat <<- PYTHON
    def my_func():
        pass
	PYTHON

my_function(){
    # shHereDoc01
    cat <<- PYTHON
    def my_func():
        pass
	PYTHON
}

if [[ bing == bong ]] ; then
    cat <<- PYTHON
    def my_func():
        pass
        my_func()
	PYTHON
    cat <<-SHELL
    var=value
	SHELL
fi

case $1 in
    sh)
        cat <<- SHELL
        var=value
		SHELL
        ;;
    py)
        # shHereDoc01
        cat <<- PYTHON
				def my_func():
				    pass
				my_func()
			PYTHON
        ;;
esac
