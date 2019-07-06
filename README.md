# memcached-sasl
A memcached docker image with simple login:password [authentication mechanisms](https://github.com/memcached/memcached/wiki/SASLHowto)

*Note: Most of this is freely adapted from https://github.com/frodenas/docker-memcached*

## Usage 

```bash
$ docker-compose up
```

or 

```bash
$ docker build -t memcached .
$ docker run -d --name memcached -p 11211:11211 memcached
```

## Auth

Custom `login:password` are set via **MEMCACHED_USERNAME** and **MEMCACHED_PASSWORD** environment variables.

```bash
$ docker run -d \
    --name memcached \
    -p 11211:11211 \
    -e MEMCACHED_USERNAME=myusername \
    -e MEMCACHED_PASSWORD=mypassword \
    memcached
```