Project integrating 
https://github.com/smizy/docker-presto
and
https://github.com/xiaoyao1991/presto-ethereum

To use: 

```
docker build . -t 'walker/presto'
docker-compose up -d
docker-compose exec worker-1 presto --server coordinator-1.vnet:8080 --catalog ethereum --schema default 
```
