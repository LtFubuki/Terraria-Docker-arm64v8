FROM ubuntu

LABEL maintainer="Cameron Alford"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y vim zip curl wget mono-complete && \
    apt-get clean

RUN mkdir /tmp/terraria && \
    cd /tmp/terraria && \
    wget https://terraria.org/api/download/pc-dedicated-server/terraria-server-1432.zip && \
    unzip -q terraria-server-1432.zip && \
    mv */Linux /terraria && \
    rm -R /tmp/* && \
    rm /terraria/Mono.* && \
    rm /terraria/System.* && \
    rm /terraria/WindowsBase.dll

RUN chmod +x /terraria/TerrariaServer* && \
    chmod +x /terraria/run.sh && \
    if [ ! -f /terraria/TerrariaServer ]; then echo "Missing /terraria/TerrariaServer"; exit 1; fi    

COPY run-server.sh /terraria/run.sh

WORKDIR /terraria
CMD ["./run.sh"]
