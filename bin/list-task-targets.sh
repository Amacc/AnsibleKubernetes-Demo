#!/bin/bash
# example: list-task-targets.sh patch.yml -e patch_group=<pattern> 

ansible-playbook -i inventory/demo.yml \
    --list-hosts \
    $*



