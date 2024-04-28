# OS:  Meu sistema baseado do Fedora Silverblue &nbsp; [![build-ublue](https://github.com/lucasvsr/os/actions/workflows/build.yml/badge.svg)](https://github.com/lucasvsr/os/actions/workflows/build.yml)

Abaixo, segue as instruções de instalação do sistema.

## Instalação (Rebase)

- Primeiro realize o rebase para uma versão não assinada da imagem, assim baixará as devidas credenciais para validação da assinatura posteriormente:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/lucasvsr/os:latest
  ```
- Reinicie o sistema:
  ```
  systemctl reboot
  ```
- Faça o rebase para a versão assinada da imagem:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/lucasvsr/os:latest
  ```
- Reinicie o sistema para finalizar a instalação:
  ```
  systemctl reboot
  ```

O `latest` garante que sempre baixará a última versão criada a partir do workflow disponível neste repositório.
