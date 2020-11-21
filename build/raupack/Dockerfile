FROM iandavis/minecraft-forge:1.12.2
ADD mods /mods
ADD config /config
WORKDIR /
ENTRYPOINT ["dumb-init"]
CMD ["/start.sh"]
