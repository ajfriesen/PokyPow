# Documentation

Build:

```
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs my-mkdocs build
```

esphome compile ../pokypow.yaml
> cp ../.esphome/build/pokypow/.pioenvs/pokypow/firmware.factory.bin  docs/firmware/

> rsync -avz site webspace:/home/andrej/docker/pokypow-docs/