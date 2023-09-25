# Módulo de instalação de `nerd-fonts`

Use-o para instalar fontes disponíveis no repositório [nerd-fonts](https://github.com/ryanoasis/nerd-fonts). Este módulo será executado cada build baixando sempre a versão mais recente das fontes devidamente configuradas.

## Exemplo de configuração

```yaml

- type: nerd-fonts
    fonts:
      - FiraCode
      - Hack
      - SourceCodePro
      - Terminus
      - JetBrainsMono
      - NerdFontsSymbolsOnly

```

O nome das fontes pode ser visto [aqui](https://www.nerdfonts.com/font-downloads) e **não** é necessário colocar o sufixo *"Nerd Font"*.