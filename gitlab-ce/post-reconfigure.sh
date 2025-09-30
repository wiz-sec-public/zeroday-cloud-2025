#!/bin/sh
echo "[Post-Reconfigure] Starting post-reconfigure script..."
sleep 10
echo "[Post-Reconfigure] Disabling GitLab signup..."
gitlab-rails runner "::Gitlab::CurrentSettings.update!(signup_enabled: false)"
echo "[Post-Reconfigure] Post-reconfigure script completed"