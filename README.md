scrapyd
=======


```bash
# build docker container
docker build -t mattes/scrapyd:latest .

# ... or pull docker container
docker pull mattes/scrapyd:latest

# debug docker container
docker run -v $(pwd):/home -p 6801:6801 -i -t mattes/scrapyd /bin/bash
source <(curl -Ls git.io/apeepg) # inject dotfiles

# run docker container in producation
docker run -p 6801:6801 -d mattes/scrapyd

```