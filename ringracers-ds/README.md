# ringracers-ds

A containerized dedicated server for Dr. Robotnik's Ring Racers.

You can find it in [Docker Hub](https://hub.docker.com/r/benchi99/ringracers-ds)

## Usage

Run it with the following docker command:

```sh
docker run --rm --name ringracers -p <desired_port>:5029/udp benchi99/ringracers-ds
```

This docker image has an available volume `/data` that is symlinked to the `.ringracers` directory within the container. Use this volume to add your server configuration and mods to the server. The folder in your host should be structured in the following manner:

```
.
├── addons
│   ├── xyz1.wad
│   └── xyz2.pk3
└── ringserv.cfg
```

Then execute the following docker command:

```sh
docker run --rm --name ringracers -v /path/to/your/data/:/data -p <desired_port>:5029/udp benchi99/ringracers-ds
```

## Building

The Dockerfile can take in a `VERSION` argument that will determine which version of the game the dedicated server will support. You should only use valid, existing versions, otherwise the build will fail.
