FROM				java:latest
MAINTAINER	inhumantsar

EXPOSE			8080
EXPOSE			25565

ENV					PASSWORD mootoothree
ENV					JAVA_MEMORY 2048

RUN					useradd mcmyadmin -m -s /bin/bash

RUN					apt-get update && \
						DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
						apt-get -y install vim wget

WORKDIR			/usr/local
RUN					wget http://mcmyadmin.com/Downloads/etc.zip && \
						unzip etc.zip && rm etc.zip

WORKDIR			/home/mcmyadmin
RUN					wget http://mcmyadmin.com/Downloads/MCMA2_glibc26_2.zip && \
						unzip MCMA2_glibc26_2.zip && rm MCMA2_glibc26_2.zip && \
						chown -R mcmyadmin:mcmyadmin /home/mcmyadmin

USER				mcmyadmin

RUN					/home/mcmyadmin/MCMA2_Linux_x86_64 -nonotice -updateonly

CMD					['-setpass', "$PASSWORD", '+java.memory', "$JAVA_MEMORY"]
ENTRYPOINT	/home/mcmyadmin/MCMA2_Linux_x86_64