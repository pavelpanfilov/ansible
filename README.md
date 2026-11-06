# ansible

Ansible playbooks for random stuff

## MacBook setup

Installs Xcode Command Line Tools, Homebrew, git, work apps (formulae + casks), and configures git, `~/.claude/CLAUDE.md` and `~/.bash_profile` (kube prompt, context/namespace autocompletion).

### New computer

git isn't available until Command Line Tools are installed, so download the repo as a tarball:

```bash
curl -fsSL https://github.com/pavelpanfilov/ansible/archive/refs/heads/main.tar.gz | tar xz
cd ansible-main
./bootstrap.sh                      # Command Line Tools, Homebrew, ansible, collections
eval "$(/opt/homebrew/bin/brew shellenv)"
ansible-playbook macbook.yml -K
```

### Afterwards

```bash
just check                # dry run with diff
just setup                # apply
just setup --tags shell   # run selected tags only
```

Edit app lists in `macbook.yml` (`brew_formulae`, `brew_casks`). The existing `~/.bash_profile` is backed up on change.
