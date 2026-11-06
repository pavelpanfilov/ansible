deps:
    ./bootstrap.sh

setup *args:
    ansible-playbook macbook.yml --ask-become-pass {{args}}

check *args:
    ansible-playbook macbook.yml --check --diff --ask-become-pass {{args}}
