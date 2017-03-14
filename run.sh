chmod 777 /jenkins
mkdir -p /home/jenkins/.ssh/
cp /jenkins/id_rsa /home/jenkins/.ssh/
ssh-keyscan -H 172.28.1.31 >> /home/jenkins/.ssh/known_hosts
/usr/sbin/sshd -D
