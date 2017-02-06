FROM tarantool/build:centos7

COPY requirements.txt /
RUN sudo pip install -r /requirements.txt --upgrade
