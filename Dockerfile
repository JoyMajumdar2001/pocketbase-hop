FROM alpine:latest

ARG PB_VERSION=0.17.4

RUN apk add --no-cache \
   unzip \
   ca-certificates

# download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

# COPY/ADD local pb_migrations or pb_public folders inside "/pb/" if you have any...

EXPOSE 8080

# start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
