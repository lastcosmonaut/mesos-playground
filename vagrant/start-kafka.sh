# Manually scale kafka
sudo java -jar kafka-mesos-0.9.5.1.jar broker --api=http://10.111.111.10:7000 add 0,1
sudo java -jar kafka-mesos-0.9.5.1.jar broker --api=http://10.111.111.10:7000 start 0,1
sudo java -jar kafka-mesos-0.9.5.1.jar topic add cloudtest --api=http://10.111.111.10:7000
