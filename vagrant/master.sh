sudo rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
sudo yum -y install mesos marathon wget
sudo systemctl stop firewalld
mkdir -p /var/zookeeper
wget http://www-eu.apache.org/dist/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz
tar -xvf zookeeper-3.4.9.tar.gz
cd zookeeper-3.4.9
sudo mv conf/zoo_sample.cfg conf/zoo.cfg
sudo bin/zkServer.sh start
sudo nohup mesos master --work_dir=/var/lib/mesos/ --log_dir=/var/log/mesos/ --zk=zk://localhost:2181/mesos --quorum=1 --ip=10.111.111.10 > mesos.log 2>&1 &
sudo nohup sudo marathon > marathon.log 2>&1 &
