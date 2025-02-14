# Documentation

Build:

```
docker run --rm -it -v ${PWD}:/documentation/docs squidfunk/mkdocs-material build
```

run:
```
docker run --rm -it -p 8000:8000 -v ${PWD}/documentation:/docs squidfunk/mkdocs-material
```