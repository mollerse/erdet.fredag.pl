FROM swipl:7.6.4

EXPOSE 5000

COPY fredag.pl /fredag/fredag.pl
COPY server.pl /fredag/server.pl

WORKDIR /fredag

CMD ["swipl", "server.pl"]
