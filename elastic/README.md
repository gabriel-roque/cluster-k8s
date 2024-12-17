## How to up this lab

```sh
# IN VM
cd elastic
vagrant up

# IN VM
vagrant ssh elastic
cd elastic

sudo vim .env

# IN .env
ELASTICSEARCH_PASSWORD=""
KIBANA_PASSWORD=""

# IN VM
sudo docker-compose up -d elasticsearch

# IN Container
sudo su
docker exec -it elasticsearch bash
bin/elasticsearch-setup-passwords interactive
exit

# IN .env
ELASTICSEARCH_PASSWORD="<put_here_password> - elastic user" 
KIBANA_PASSWORD="<put_here_password> - kibana_system user"

# IN VM
sudo docker-compose up --build -d
```

`/etc/hosts`
```
192.168.10.150 elastic.cluster
```

Open in http://elastic.cluster/ or local ip network