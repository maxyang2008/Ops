ansible es-nodes -a "curl -o setup_agent.sh https://setup.instana.io/agent"


ansible es-nodes -a "chmod 700 setup_agent.sh"


ansible es-nodes -a "sudo /home/adecpadmin/setup_agent.sh -a <license_code> -y -t static -e ingress-blue-saas.instana.io:443"


ansible es-nodes -a "sudo systemctl enable instana-agent"


ansible es-nodes -a "sudo systemctl start instana-agent"


ansible es-nodes -m shell -a 'ps -ef | grep instana'


ansible es-nodes -m shell -a 'sudo systemctl stop instana-agent'


ansible es-nodes -m copy -a "src=configuration.yaml dest=/tmp/configuration.yaml"


ansible es-nodes -m shell -a 'sudo cp /tmp/configuration.yaml /opt/instana/agent/etc/instana'


ansible es-nodes -m shell -a 'sudo chown root.root /opt/instana/agent/etc/instana/configuration.yaml'


ansible es-nodes -m shell -a 'sudo chmod /opt/instana/agent/etc/instana/configuration.yaml'
