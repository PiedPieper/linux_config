
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH:/usr/local/bin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM=xterm-256color vim
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ " 

## Vim
alias eclim='/Users/ryanauger/eclipse/cpp-2018-09/Eclipse.app/Contents/Eclipse/eclimd &'

box() {
    case $1 in
        "155")
            ssh rauger@192.168.7.155
            ;;

        "152")
            ssh rauger@192.168.7.152
            ;;
        "85") 
            ssh rauger@192.167.7.85
            ;;
        "vm")
            VBoxManage startvm "mangOH Dev using Legato 17.07.1 on Ubuntu 16.04" --type headless > /dev/null 2>&1

            ########################
            ## Get the Ip address ##
            ########################
            declare -a IpList
            while [ ${#IpList[@]} -eq 0 ];
            do
                IpList=( $(VBoxManage guestproperty enumerate "mangOH Dev using Legato 17.07.1 on Ubuntu 16.04" | awk '/IP/ {print $4}' | awk -F"," '{print $1}'))
            done

            ###########
            ##  SSH  ##
            ###########
            for Ip in ${IpList[@]}
            do
                if [ ${Ip: -1} != "1" ] && [ ${Ip: -1} != "254" ] 
                then
                    echo "sshing into ... $Ip... last element of IP=${Ip:-1}"
                    ssh mangoh@$Ip
                    return
                fi
            done
            ;;
        "vmoff")
            VBoxManage controlvm "mangOH Dev using Legato 17.07.1 on Ubuntu 16.04" savestate
            ;;
        *)
            ;;
    esac
}

## File Permissions
alias Own='sudo chown -R rauger .'

## Mysql
alias sql='mysql -u root -p'

## Openssl
vcert() {
    openssl x509 -in "$1" -text -noout
}


add_pwd_alias()
{
    echo "alias "$1"='cd `pwd`'" >> ~/.bashrc
    source ~/.bashrc

}
alias emq='cd /home/rauger/repos/emq-rlx'
