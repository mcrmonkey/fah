
# Folding at home - in docker

For running [Folding@Home](http://folding.stanford.edu/) in a docker container

The web console is available on port `7396`.

## Usage

Run like so for anonymous contribution using CPU:

```bash
docker run --rm -it --name fah -p 7396:7396 mcrmonkey/fah:latest

```

Certain librarys will need adding for running on GPU's


## Building

```bash
docker build -t fah .

```


