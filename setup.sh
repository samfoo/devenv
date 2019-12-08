#!/bin/bash -e

/usr/sbin/sshd
/usr/bin/mongod

for file in /mnt/windows/projects/dots/.*; do
    f=$(basename $file)
    if [[ ${f} != "." && ${f} != ".." && ${f} != ".git" ]]; then
        ln -sf ${file} /home/sam/${f}
    fi
done

ln -sf /mnt/windows/projects /home/sam/projects
