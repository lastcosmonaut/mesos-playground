sudo systemctl stop firewalld
sudo sed -i '1s/^/nameserver 10.111.111.10\n /' /etc/resolv.conf
sudo rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
sudo yum -y install mesos java-1.7.0-openjdk
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
sudo yum install -y docker-engine
sudo systemctl enable docker.service
sudo systemctl start docker
sudo docker run --rm hello-world
sudo usermod -aG docker vagrant
sudo nohup mesos agent --master=10.111.111.10:5050 --work_dir=/var/lib/mesos-agent/ --log_dir=/var/log/mesos/ --containerizers=mesos,docker --ip=${VAGRANT_IP} > mesos.log 2>&1 &
