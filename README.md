# tiangolo-uwsgi-nginx

Sample project for using "**tiangolo-uwsgi-nginx**".

[Docker Image](https://hub.docker.com/r/tiangolo/uwsgi-nginx "Docker Image reference")

1. ## Hierarchy is followed.
```markdown
~+ docker
 ├── app
 │   ├── dist
 │   │   └── test
 │   ├── static
 │   │   └── index.html 
 │   ├── main.py
 │   ├── test.py
 │   ├── test.spec
 │   ├── uwsgi.ini
 │   └── index.js
 ├── docker-compose.yml
 ├── Dockerfile
 ├── endtrypoint.sh
 ├── requirements.txt
 └── uwsgi.ini
```

1. ## nginx homepage content
app/static/index.html

1. ## flask app
app/main.py

1. ## pyinstaller app
app/dist/test
aap/test.py

**Compile** :
```
docker exec -it sample-server /bin/bash

cd /app

pyinstaller --onefile test.py

nohup dist/test -sS &
```

1. ## execute
```
docker-compose -p sample up
```

1. ## execute daemon
```
docker-compose -p sample up -d
```


