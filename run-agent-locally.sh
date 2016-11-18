sudo mkdir -p /var/lib/mesos-agent/
sudo mesos agent --master=localhost:5050 --work_dir=/var/lib/mesos-agent/ --log_dir=/var/log/mesos/ --containerizers=mesos,docker
