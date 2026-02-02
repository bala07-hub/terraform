#!/bin/bash
set -euxo pipefail
exec > /var/log/userdata.log 2>&1

# Wait until apt is unlocked
while fuser /var/lib/dpkg/lock-frontend >/dev/null 2>&1; do
  sleep 5
done

while fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do
  sleep 5
done

apt-get update -y
apt-get install -y apache2 curl

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Terraform Project</title>
</head>
<body>
  <h1>Terraform Project Server 2</h1>
  <h2>Instance ID: $INSTANCE_ID</h2>
  <p>Running on Ubuntu 24.04</p>
</body>
</html>
EOF

systemctl enable apache2
systemctl start apache2
