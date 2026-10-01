#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv){

    if(argc < 2){
        fprintf(stderr, "%s: ERROR: Not enough arguments: %d\n", argv[0], argc);
        return 1;
    }

    return 0;
}

