FROM cgr.dev/chainguard/wolfi-base:latest

LABEL maintainer="hoffeldervinicius@gmail.com"
LABEL pickid="PICK2024-T2"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache py3.11-pip=24.3.1-r0 && \
    rm -rf /var/cache/apk/*

WORKDIR /app
COPY ./giropops-senhas/requirements.txt . 
RUN pip install --no-cache-dir -r requirements.txt

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/ust/bin:/sbin:/bin
COPY giropops-senhas /app
EXPOSE 5000

ENTRYPOINT [ "python3", "-m", "flask", "run", "--host=0.0.0.0" ]
HEALTHCHECK CMD netstat -an | grep 5000 > /dev/null; if [ 0 != $? ]; them exit 1; fi;
