# Biblys Cloud Analytics

## Build image

```console
docker build -t biblys-analytics:latest .
```

## Run container from image

```console
docker run -d -p 3000:80 \
  --memory=512mb \
  --restart=unless-stopped \
  --name analytics \
  biblys-analytics:latest
```
