docker build -t ds .
echo "alias dsc=\"docker run -v ~/repos/:/root/work -d -rm --name dsc -p 8888:8888 --expose 8888 ds\"" >> ~/.bashrc
source ~/.bashrc