![logo.png](logo.png)

Debian Workspace on Docker

## Get started

1. setup `.env`

```
$ cp example.env .env
$ edit .env
```

Set `PROVISION` to `light` or `full` (Default: light)

```
PROVISION=light
```

2. build docker image

```
$ make build
```

3. If you want to mount a dot file on your home directory, create a dotfiles directory at the same level as the Dockerfile (opt)

```
Dockerfile
dotfiles/
└── .bash_profile
```

4. run docker image

```
$ make tty
```


