FROM ubuntu:20.04

# 対話型応答用の値
ENV INSTALL_PATH ""
ENV WEB_PORT ""
ENV NETFLOW_PORT ""

RUN apt-get update; apt-get install -y \
    language-pack-ja-base language-pack-ja locales expect zip \
    iputils-ping net-tools
RUN bash -c 'locale-gen ja_JP.UTF-8; \
    echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc; \
    source ~/.bashrc'
COPY ManageEngine_OpManager_Plus_64bit.bin /tmp/
COPY sh/opmanager_install_expect.sh /tmp/opmanager_install_expect.sh
COPY sh/docker-entrypoint.sh /tmp/docker-entrypoint.sh

RUN chmod +x /tmp/opmanager_install_expect.sh /tmp/docker-entrypoint.sh

ENTRYPOINT [ "/tmp/docker-entrypoint.sh" ]
CMD [ "./StartOpManagerServer.sh" ]