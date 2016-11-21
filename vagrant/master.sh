sudo rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
sudo yum -y install mesos marathon wget git java-1.7.0-openjdk maven
sudo systemctl stop firewalld
mkdir -p /var/zookeeper
wget http://www-eu.apache.org/dist/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz
tar -xvf zookeeper-3.4.9.tar.gz
cd zookeeper-3.4.9
sudo mv conf/zoo_sample.cfg conf/zoo.cfg
sudo bin/zkServer.sh start
sudo nohup mesos master --work_dir=/var/lib/mesos/ --log_dir=/var/log/mesos/ --zk=zk://localhost:2181/mesos --quorum=1 --ip=10.111.111.10 > mesos.log 2>&1 &
sudo nohup sudo marathon > marathon.log 2>&1 &

cd /home/vagrant/

wget http://www-eu.apache.org/dist/kafka/0.10.1.0/kafka_2.10-0.10.1.0.tgz
wget https://github.com/mesos/kafka/releases/download/v0.9.5.1/kafka-mesos-0.9.5.1.jar
export MESOS_NATIVE_JAVA_LIBRARY=/usr/local/lib/libmesos.so
export LIBPROCESS_IP=10.111.111.10
sudo nohup sudo java -jar kafka-mesos-0.9.5.1.jar scheduler --master=10.111.111.10:5050 --api=http://10.111.111.10:7000 --zk=10.111.111.10:2181 --bind-address=10.111.111.10 > kafka-mesos.log 2>&1 &
#sudo java -jar kafka-mesos-0.9.5.1.jar broker --api=http://10.111.111.10:7000 add 0,1
#sudo java -jar kafka-mesos-0.9.5.1.jar broker --api=http://10.111.111.10:7000 start 0,1

#cd /home/vagrant/
#git clone https://github.com/apache/flink.git
#cd flink
#git checkout release-1.1.3
#mvn clean package -DskipTests
