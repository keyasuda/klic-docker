# klic-docker

docker image of KLIC (KL1 to C compiler)

KLIC is from https://www.ueda.info.waseda.ac.jp/software.html

## Usage

### Interactive

```
$ docker run -it --mount type=bind,source="$(pwd)",target=/src -w /src ghcr.io/keyasuda/klic-docker:latest bash
root@1ab60fac4c7e:/src# ls
nrev0.kl1
root@1ab60fac4c7e:/src# klic nrev0.kl1
root@1ab60fac4c7e:/src# ./a.out
[6,5,4,3,2,1]
root@1ab60fac4c7e:/src#
```

### Direct

```
$ ls
nrev0.kl1
$ docker run --mount type=bind,source="$(pwd)",target=/src -w /src ghcr.io/keyasuda/klic-docker:latest klic nrev0.kl1
$ ls
a.out   atom.h  funct.c  funct.o  nrev0.c    nrev0.kl1  predicates.c
atom.c  atom.o  funct.h  klic.db  nrev0.ext  nrev0.o    predicates.o
$ docker run --mount type=bind,source="$(pwd)",target=/src -w /src ghcr.io/keyasuda/klic-docker:latest ./a.out
[6,5,4,3,2,1]
$
```
