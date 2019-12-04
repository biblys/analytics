# Biblys Cloud Analytics

## Build image

```console
docker build -t biblys/analytics:latest -t biblys/analytics:tag .
```

## Run container from image

```console
docker run -d -p 3000:80 \
  --memory=512mb \
  --restart=unless-stopped \
  --name analytics \
  biblys/analytics:latest
```

## TODO

- remove database credentials from repo's config file and use env var
- docker fpm image?
- docker alpine image?

