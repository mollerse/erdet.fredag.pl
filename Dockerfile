FROM ubuntu:latest

RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:swi-prolog/stable
RUN apt-get update
RUN apt-get install -y swi-prolog

EXPOSE 5000

ADD fredag.pl /tmp/fredag.pl
ADD server.pl /tmp/server.pl

ENTRYPOINT ["prolog", "-f", "-q", "/tmp/server.pl"]
