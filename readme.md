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

After running that, the development environment is now running in the background and you can ssh in:

```
ssh -i ~/projects/id_rsa sam@localhost -p 2222
```
