## How to up this lab

```sh
# IN VM
cd docker
vagrant up

# IN VM
vagrant ssh master-01
cd nginx

vim .env

# IN .env
ELASTIC_API_TOKEN=
APM_SERVER=

# IN VM
sudo docker stack deploy -c docker-compose.yml example
sudo docker stack ls
sudo docker service logs example_node-api
```

`/etc/hosts`
```
192.168.10.150 elastic.cluster
```

Open in http://elastic.cluster/ or local ip network