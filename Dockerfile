FROM node:9.2-alpine
MAINTAINER xvwentao89@163.com
ENV TZ="Asia/Shanghai" HOME="/"
WORKDIR ${HOME}
ADD yapi.tgz /home/
COPY docker-entrypoint /usr/local/bin/docker-entrypoint
RUN chmod +x           /usr/local/bin/docker-entrypoint
COPY config.json /api/
EXPOSE 3000
ENTRYPOINT ["docker-entrypoint"]