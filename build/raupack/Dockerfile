FROM iandavis/minecraft-forge:1.12.2
ADD config /config
ADD mods /mods
WORKDIR /
ENTRYPOINT ["dumb-init"]
CMD ["/start.sh"]
