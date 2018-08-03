# twemproxy_memcached_docker_dev
用 docker 架設一個測試用的 twemproxy + memcached cluster

1. 先用 docker 啟動三台 memcached
```
$> docker run -d --name mc1 -d --expose 11211 memcached memcached -m 64
$> docker run -d --name mc2 -d --expose 11211 memcached memcached -m 64
$> docker run -d --name mc3 -d --expose 11211 memcached memcached -m 64
```

2. build twemproxy docker image
```
$> docker build -t genchi/twemproxy .
```

3. 啟動 twemproxy container
```
$> docker run -ti --rm --link mc1 --link mc2 --link mc3 -p 11211:11211 -p 22222:22222 genchi/twemproxy
```

透過 127.0.0.1:11211 就可以對 memached 操作了
