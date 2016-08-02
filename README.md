Ecs-cloud
Ecs-node


/var/jenkins_home

-Dorg.jenkinsci.remoting.engine.JnlpProtocol3.disabled=true

Volume mappings

- /var/run/docker.sock
- /var/jenkins_home
- /tmp


docker build -t jenkins-node-jnlp:1.11.2 .