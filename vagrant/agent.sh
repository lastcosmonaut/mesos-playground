sudo rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
sudo yum -y install mesos
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
sudo mesos agent --master=10.111.111.10:5050 --work_dir=/var/lib/mesos-agent/ --log_dir=/var/log/mesos/ --containerizers=mesos,docker
