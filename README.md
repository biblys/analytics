# Biblys Cloud Analytics

## Run using Docker

Define database credentials in a .env file:

```env
MATOMO_DATABASE_HOST=
MATOMO_DATABASE_PORT=
MATOMO_DATABASE_USERNAME=
MATOMO_DATABASE_PASSWORD=
MATOMO_DATABASE_DBNAME=
```

Then run:

```console
docker run -d -p 3000:80 \
  --env-file=.env \
  --memory=512mb \
  --restart=unless-stopped \
  --name analytics \
  biblys/analytics:latest
```

## Build image

```console
docker build -t biblys/analytics:latest -t biblys/analytics:tag .
```

## TODO

- docker matomo fpm image?
- docker matomo alpine image?

