#!/bin/bash
set -e

echo "Setting up Asus battery charge limit systemd service..."

cat << 'EOF' | sudo tee /etc/systemd/system/battery-charge-limit.service > /dev/null
[Unit]
Description=Set ASUS Battery Charge Limit to 80%
After=sysinit.target

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'for bat in /sys/class/power_supply/BAT*; do echo 80 > $bat/charge_control_end_threshold || true; done'

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now battery-charge-limit.service

echo "========================================================="
echo "=== Battery charge limit service enabled successfully ==="
echo "========================================================="
