#!/usr/bin/env bash
# Wrapper to run patching with confirmation
set -euo pipefail
INVENTORY=${INVENTORY:-inventory/hosts.ini}
LIMIT=${LIMIT:-dev_servers}
echo "=== Ansible Patching Wrapper ==="
echo "Inventory : $INVENTORY"
echo "Limit     : $LIMIT"
echo ""
read -rp "Proceed with patching? (yes/no): " confirm
[[ "$confirm" == "yes" ]] || { echo "Aborted."; exit 0; }
ansible-playbook -i "$INVENTORY" playbooks/patch.yml --limit "$LIMIT" -v
