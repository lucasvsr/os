# OS: OCI do meu sistema operacional

[![build-os](https://github.com/lucasvsr/os/actions/workflows/build.yml/badge.svg)](https://github.com/lucasvsr/os/actions/workflows/build.yml)

Fork do projeto uBlue. Mais informações, buscar em: [uBlue homepage](https://ublue.it/) e [main uBlue repo](https://github.com/ublue-os/main/).

## Instalação

Para aplicar em um Silverblue 37:
```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/lucasvsr/os:37
```

Para aplicar em um Silverblue 38:
```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/lucasvsr/os:38
```

Também é possível aplicar uma tag, usando a data em que ele foi gerada: 
```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/lucasvsr/os:20230513
```