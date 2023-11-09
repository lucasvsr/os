# os

[![build-ublue](https://github.com/lucasvsr/os/actions/workflows/build.yml/badge.svg)](https://github.com/lucasvsr/os/actions/workflows/build.yml)

## Instalação

Para executar o rebase em uma instalação do Fedora Silverblue, basta executar o comando a seguir:

  ```
  sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/lucasvsr/os-stable:latest
  ```

Após a execução do comando acima, será necessário reiniciar para ter acesso às alterações.

É possível realizar um rebase de uma determinada versão, basta informar a data no padrão `AAAAMMDD`. Exemplo:

```
sudo rpm-ostree rebase ostree-image-signed:docker://ghcr.io/lucasvsr/os-stable:20230403
```
