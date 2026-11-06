#!/bin/bash
# Reads the kubeconfig directly; calling kubectl on every prompt is slow.
__kube_ps1() {
  local cfg="${KUBECONFIG:-$HOME/.kube/config}"
  cfg="${cfg%%:*}"
  [ -f "$cfg" ] || return
  local ctx
  ctx=$(sed -n 's/^current-context: *//p' "$cfg")
  [ -n "$ctx" ] && echo "(k8s: ${ctx})"
}
