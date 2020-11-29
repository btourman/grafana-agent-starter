
The goal of this repository is to install **grafana-agent binary** with **systemd unit**.

> Based on : 
>  - https://grafana.com/docs/grafana-cloud/agent/agent_as_service/
> - https://grafana.com/blog/2020/07/02/getting-started-with-the-grafana-cloud-agent-a-remote_write-focused-prometheus-agent/

## Environment
- Debian/Ubuntu
- Send data to Prometheus
- Use https://github.com/grafana/agent/releases/tag/v0.8.0 version

## Requirements
- curl
- unzip

## Usage
- Clone this repository on your server
- Changes values in `agent-config.yaml` with your Prometheus config
- Launch `$ ./install.sh`
- Start grafana-agent service : `$ sudo systemctl start grafanaagent.service`
- Enable service to run automatically on every reboot : `$ sudo systemctl enable grafanaagent.service`
- That's all :ok_hand: