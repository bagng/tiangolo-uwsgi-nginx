FROM tiangolo/uwsgi-nginx

MAINTAINER Sebastian Ramirez <tiangolo@gmail.com>

RUN set -x \
    && apt-get update \
    # command top
    && apt-get install -y procps \
    # crontab
    && apt-get install -y cron \
    # for uwsgi
    && apt-get install --no-install-recommends --no-install-suggests -y build-essential python-dev vim \
    # supervisord
    && apt-get install -y supervisor \
    # clear
    && apt-get purge -y --auto-remove && rm -rf /var/lib/api/lists/*

COPY requirements.txt /tmp/
RUN pip3 install --upgrade pip
RUN pip3 install -r /tmp/requirements.txt

# Add app configuration to Nginx
COPY nginx.conf /etc/nginx/conf.d/
COPY uwsgi.ini /etc/uwsgi/

# Copy sample app
#COPY .. /app/

# 시간대 맞추기
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# Move the base entrypoint to reuse it
RUN mv /entrypoint.sh /uwsgi-nginx-entrypoint.sh

# Copy the entrypoint that will generate Nginx additional configs
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

RUN apt install --no-install-recommends -y sudo

USER root

ARG USER_NAME=ubuntu
ARG USER_ID=1001
ARG GROUP_ID=1001

ENV USER=${USER_NAME}
RUN echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER_NAME}
RUN chmod 0440 /etc/sudoers.d/${USER_NAME}

RUN groupadd ${USER_NAME} --gid ${USER_ID}\
    && useradd -l -m ${USER_NAME} -u ${USER_ID} -g ${USER_ID} -s /bin/bash

#USER ${USER_NAME}
RUN sudo mkdir -p /app && sudo chmod -R 777 /app
COPY app /app

#RUN cd /app && pyinstaller --onefile test.py
WORKDIR /app
RUN pyinstaller --onefile test.py
#WORKDIR /app/dist
#RUN nohup test -sS &

#USER root

# add nohup command
#RUN echo "cd /app/dist" >> start.sh
#RUN echo "nohup ./test -sS &" >> start.sh

# Run the start script provided by the parent image tiangolo/uwsgi-nginx which in turn will start Nginx and uWSGI
COPY start.sh /start.sh
CMD ["/start.sh"]

