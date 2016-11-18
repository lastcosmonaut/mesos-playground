# Setup
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

# Add the repository
echo "deb http://repos.mesosphere.com/ubuntu xenial64 main" | sudo tee /etc/apt/sources.list.d/mesosphere.list
  sudo apt-get -y update

# Install packages
sudo apt-get -y install mesos marathon zookeeper zookeeperd

sudo mesos master --work_dir=/var/lib/mesos/ --log_dir=/var/log/mesos/ --zk=zk://localhost:2181/mesos --quorum=1
