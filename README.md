# tiangolo-uwsgi-nginx

Sample project for using "**tiangolo-uwsgi-nginx**".

[Docker Image](https://hub.docker.com/r/tiangolo/uwsgi-nginx "Docker Image reference")

## Hierarchy is followed.
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

## nginx homepage content
app/static/index.html

## flask app
app/main.py

## pyinstaller app
app/dist/test
aap/test.py

**Compile** :
```
docker exec -it sample-server /bin/bash

cd /app

pyinstaller --onefile test.py

nohup dist/test -sS &
```

## execute
```
docker-compose -p sample up
```

## execute daemon
```
docker-compose -p sample up -d
```


