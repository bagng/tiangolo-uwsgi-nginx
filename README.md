# tiangolo-uwsgi-nginx

sample project for using "tiangolo-uwsgi-nginx"

hierarchy is followed.
~/docker
    docker-compose.yml
    Dockerfile
    entrypoint.sh
    nginx.conf
    requirements.txt
    uwsgi.ini
    app/
        main.py
        uwsgi.ini

nginx homepage: app/static/index.html
flask app: app/main.py

execute: docker-compose -p sample up
execute daemon: docker-compose -p sample up -d

