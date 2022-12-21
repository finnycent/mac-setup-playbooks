#check if a package exists and install if missing
function checkBeforeInstall(){
    if ! command -v $1 &> /dev/null
    then
        eval "$2"
    else
        echo "$1 found"    
    fi 
}

checkBeforeInstall brew '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
checkBeforeInstall git "sudo brew install git"
checkBeforeInstall pip "curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && sudo python get-pip.py"
checkBeforeInstall ansible "sudo pip install ansible"
checkBeforeInstall aws "sudo pip install awscli"

sudo ansible-playbook mainplaybook.yml

