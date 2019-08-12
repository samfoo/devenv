# Simple Linux Development on Windows

## Building

```
docker build devenv -t sam:dev
```

## Running

Best to use some newer version of mintty (e.g. git bash), then create the following shellscript:

```
#!/bin/bash -e

winpty docker run -d -p 2222:22 -w=//home//sam \
        -v ~//projects://mnt//windows//projects \
        -v ~//projects//id_rsa.pub://home//sam//.ssh//authorized_keys \
        -ti \
        sam:dev
```
