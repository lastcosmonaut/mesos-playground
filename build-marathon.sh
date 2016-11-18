echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-get install apt-transport-https
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get install -y python-software-properties
sudo apt-get install -y apt-file
sudo apt-get install -y software-properties-common
sudo apt-file update
sudo apt-file search add-apt-repository
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -y install sbt git oracle-java8-installer

cd /tmp/
git clone https://github.com/mesosphere/marathon.git
cd marathon
sbt assembly
