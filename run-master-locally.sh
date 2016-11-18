sudo service zookeper start
sudo mesos master --work_dir=/var/lib/mesos/ --log_dir=/var/log/mesos/ --zk=zk://localhost:2181/mesos --quorum=1
