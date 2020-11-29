#! /bin/bash

if ! [ -x "$(command -v unzip)" ]; then
  echo '"unzip" is required. Install it please, and then run this tool again.' >&2
  exit 1
fi

if ! [ -x "$(command -v curl)" ]; then
  echo '"curl" is required. Install it please, and then run this tool again.' >&2
  exit 1
fi

# Get grafana agent
echo "-- Download grafana agent binary --"
sudo curl -O -L "https://github.com/grafana/agent/releases/download/v0.8.0/agent-linux-amd64.zip"
sudo unzip "agent-linux-amd64.zip"
sudo chmod a+x "agent-linux-amd64"

echo "-- Create workdir of grafana agent in /etc/grafana-agent --"
sudo mkdir -p /etc/grafana-agent/bin
sudo cp agent-linux-amd64 /etc/grafana-agent/bin/grafana-agent
sudo cp start.sh /etc/grafana-agent
sudo cp agent-config.yaml /etc/grafana-agent

echo "-- Create grafana agent service --"
sudo cp systemd/grafanaagent.service /etc/systemd/system/grafanaagent.service
sudo systemctl daemon-reload

echo "Grafana agent is installed"