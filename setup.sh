#!/bin/bash -e

/usr/sbin/sshd

for file in /mnt/windows/projects/dots/.*; do
    f=$(basename $file)
    if [[ ${f} != "." && ${f} != ".." && ${f} != ".git" ]]; then
        ln -s ${file} /home/sam/${f}
    fi
done

ln -s /mnt/windows/projects /home/sam/projects
