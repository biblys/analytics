# Biblys Cloud Analytics

Privacy-focused web analytics for [Biblys Cloud](https://biblys.cloud) based on Matomo

## Run using Docker

Define database and SMTP credentials in a .env file:

```env
MATOMO_DATABASE_HOST=
MATOMO_DATABASE_PORT=
MATOMO_DATABASE_USERNAME=
MATOMO_DATABASE_PASSWORD=
MATOMO_DATABASE_DBNAME=
MATOMO_MAIL_HOST=
MATOMO_MAIL_PORT=
MATOMO_MAIL_USERNAME=
MATOMO_MAIL_PASSWORD=
MATOLO_MAIL_ENCRYPTION=
MATOMO_GENERAL_FORCE_SSL=
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

