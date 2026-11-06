#!/bin/bash
command -v kubectl >/dev/null || return

source <(kubectl completion bash)
complete -o default -F __start_kubectl k

_kube_contexts() {
  COMPREPLY=($(compgen -W "$(kubectl config get-contexts -o name 2>/dev/null)" -- "${COMP_WORDS[COMP_CWORD]}"))
}
_kube_namespaces() {
  COMPREPLY=($(compgen -W "$(kubectl get ns -o name 2>/dev/null | cut -d/ -f2)" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _kube_contexts kc kubectx
complete -F _kube_namespaces kn kubens
