# Documentation

Build Container:

docker build .  --tag=my-mkdocs

Build website:
```
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs my-mkdocs build
```

Serve:

```
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs my-mkdocs serve --dev-addr=0.0.0.0:8000
```

esphome compile ../pokypow.yaml
> cp ../.esphome/build/pokypow/.pioenvs/pokypow/firmware.factory.bin  docs/firmware/

> rsync -avz site andrej@ajfriesen.com:/home/andrej/docker/pokypow-docs/