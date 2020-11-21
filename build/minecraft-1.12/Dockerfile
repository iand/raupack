FROM alpine
RUN apk add dumb-init openjdk8-jre
RUN wget -O /forge-installer.jar 'http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar'
RUN java -jar forge-installer.jar --installServer
RUN rm /forge-installer.jar *.log
ADD build/minecraft-1.12/start.sh /start.sh
RUN chmod +x start.sh
WORKDIR /
ENTRYPOINT ["dumb-init"]
CMD ["/start.sh"]
