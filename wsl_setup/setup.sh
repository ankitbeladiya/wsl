# install
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -no-install-recommends install ca-certificate
sudo apt-get -no-install-recommends install git
sudo apt-get -no-install-recommends install ssh
sudo apt-get -no-install-recommends install openssh-client
sudo apt-get -no-install-recommends install wget
sudo apt-get -no-install-recommends install docker

sudo apt-get clean
sudo apt-get autoremove


# setup ssh
mkdir -p $HOME/.ssh
cp /mnt/c/Users/a/.ssh/id_rsa ~/.ssh/id_rsa
cp /mnt/c/Users/a/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa

# git config
git config --global user.name "ankitbeladiya"
git config --global user.email "ankitbeladiya.ca@gmail.com"
echo 'source /usr/share/bash-completion/completions/git' >> ~/.bashrc

# miniconda setup
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh --no-check-certificate
bash ~/miniconda.sh -b -p $HOME/Miniconda3
echo 'source $HOME/Miniconda3/bin/activate' >> ~/.bashrc

# workspace setup
mkdir -p $HOME/repos

# alias
echo "alias download=\"cd /mnt/c/Users/a/Downloads\"" >> ~/.bashrc
echo "alias repos=\"cd ~/repos\"" >> ~/.bashrc
source ~/.bashrc

