if [ -f ~/.profile_debug ] ; then
   alias verbose=true
else
   alias verbose=false
fi

function _p.message(){
   echo $(tput setaf 3)$@$(tput sgr0)
}

function _p.do_maybe_redirect(){
   _p.message $@ ...
   if verbose ; then
      eval $@
   else
      eval $@ > /dev/null 2>&1
   fi
   _p.message DONE: $@
}

main(){
   # p
   alias ls='ls --color'
   alias gg='git gui &'
   export PATH=$HOME/.linuxbrew/bin${PATH:+:${PATH}}
   true
}

gitk(){
   # Doing with 'sh -c' is so that it doesn't use the function
   sh -c "gitk --all $@" &
}


_p.restore_source_autocomplete(){
    complete -o default . source
}

p.clearjobs(){
    _p.require_ordenv
    for j in $(jobst | grep phc001 | cut -d '|' -f 1) ; do
        jobdel $j
    done
}


p(){
   echo "${USER} .profile START"
   p.ordenv
   p.write_node_hostname
   p.setup_spooki
   p.use_vscode
   # p.setup_spi
   echo "${USER} .profile END"
}

_p.set_aliases(){
   alias gitk='gitk --all &'
   alias cmake-release='cmake -DCMAKE_BUILD_TYPE=Release -DSPOOKI_MINOR_VERSION=1 -DSPOOKI_MAJOR_VERSION=1 -DSPOOKI_PATCH_LEVEL=0 ~/workspace/spooki'
}

p.use_rpn_py(){
   source r.load.dot eccc/mrd/rpn/MIG/ENV/x/rpnpy/2.1-u1.rc7 >/dev/null 2>&1
}

p.ordenv(){
   export ORDENV_SITE_PROFILE=20190814
   export ORDENV_COMM_PROFILE=eccc/20191002
   export ORDENV_GROUP_PROFILE=eccc/cmc/1.8
   _p.do_maybe_redirect . /fs/ssm/main/env/ordenv-boot-20190814.sh
   # _p.restore_source_autocomplete
   # trap "echo 'Thanks ordenv but I\`m good, the tmpdir is gonna clear itself'" EXIT
}

p.write_node_hostname(){
   if [[ $(hostname) = cs4be* ]] ; then
      hostname > ~/node_info/node_host_4.txt
   elif [[ $(hostname) = cs3be* ]] ; then
      hostname > ~/node_info/node_host_3.txt
   fi
}

p.setup_spooki(){
    p.ordenv
    export SPOOKI_COMP=intel
    local env_vars_file=~/site4/spooki/build-site/export_env_var
    if [ -f $env_vars_file ] ; then
       _p.do_maybe_redirect source $env_vars_file
    else
       _p.message "p.setup_spooki : No such file : $env_vars_file"
       _p.do_maybe_redirect source ~/workspace/spooki/SETUP_ubuntu-18.04-amd64-64
    fi
}

p.setup_spi_compiler(){
   _p.do_maybe_redirect . ssmuse-sh -x comm/eccc/all/opt/intelcomp/intelpsxe-cluster-19.0.3.199 -x hpco/exp/openmpi/openmpi-3.1.2--hpcx-2.4.0-mofed-4.6--intel-19.0.3.199 -x hpco/exp/openmpi-setup/openmpi-setup-0.2 >/dev/null 2>&1
}

p.setup_spi_dependencies(){
   _p.do_maybe_redirect source ssmuse-sh -x eccc/mrd/rpn/libs/19.4
   _p.do_maybe_redirect source ssmuse-sh -x eccc/mrd/rpn/vgrid/6.4.4
   _p.do_maybe_redirect source ssmuse-sh -x eccc/cmd/cmds/ext/20191015
}

p.setup_spi(){
   export SSM_DEV=$HOME/site4_phil/spi/build
   mkdir -p $SSM_DEV
      
   setup_spi_compiler
   setup_spi_dependencies
}

p.use_vscode(){
   _p.do_maybe_redirect source ssmuse-sh -x /fs/ssm/eccc/cmd/cmds/apps/vscode/1.38
}

p.g2cm(){
    p.ordenv
    ~/.local/bin/g2cm $@
}

p.clion(){
    p.setup_spooki
    ~/.local/bin/clion $@
}

p.pycharm(){
    ~/.local/bin/pycharm $@
}

_p.require_ordenv(){
    if [ -z "${ORDENV_SETUP}" ] ; then
        p.ordenv
    fi
}

p.myjobs(){
    _p.require_ordenv
    jobst | grep ${USER}
}

    

main
