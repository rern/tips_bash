`ln` all sub directories
---

```sh
find SOURCE_DIR -maxdepth 1 -mindepth 1 -type d -print0 | xargs -0 ln -s -t DESTINATION_DIR
```
