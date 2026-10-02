<div align="center">

<img src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0b5061df29d55a92d945_full_logo_blurple_RGB.svg" alt="Discord" width="200" />

<br />
<br />

# Design Visual

**Professional Discord Bot Skills · PT-BR**

</div>

---

## Padrao Visual

O design visual do bot segue um conjunto fixo de convencoes para garantir consistencia em todos os paineis, comandos e mensagens.

---

## Cor de Destaque

A cor de destaque padrao de todos os conteineres e branco `#FFFFFF` (`0xFFFFFF`).

Nunca usar cores arbitrarias sem autorizacao explicita do usuario para o contexto em questao.

---

## Layout

Toda interface de usuario segue esta ordem logica de layout dentro de um `ContainerBuilder`:

1. Secao de cabecalho com titulo e thumbnail (se aplicavel)
2. `SeparatorBuilder` com `.setDivider(true)`
3. Corpo de conteudo com `TextDisplayBuilder`
4. Separadores adicionais entre blocos de conteudo
5. `ActionRowBuilder` com botoes ou menus de selecao

---

## Tipografia e Formatacao de Texto

Usar markdown do Discord para estruturar o texto:

| Formatacao | Uso |
|---|---|
| `**texto**` | Negrito para titulos e destaque |
| `\`codigo\`` | Codigo inline para valores, IDs e campos tecnicos |
| `-` | Listas de itens |
| `> texto` | Citacao ou destaque de bloco |

Nunca usar traco longo (em dash) ou traco medio (en dash).

Usar barra vertical `|`, dois pontos `:` ou hifen simples `-` como separadores de texto.

---

## Componentes de Interface

### Botoes

| Estilo | Uso |
|---|---|
| `ButtonStyle.Primary` | Acao principal ou confirmacao |
| `ButtonStyle.Secondary` | Acao secundaria ou cancelamento |
| `ButtonStyle.Success` | Confirmacao positiva |
| `ButtonStyle.Danger` | Acao destrutiva ou de alto risco |
| `ButtonStyle.Link` | Link externo |

### Menus de Selecao

Usar o menu de selecao mais especifico para o contexto:

| Builder | Uso |
|---|---|
| `StringSelectMenuBuilder` | Opcoes de texto fixas |
| `UserSelectMenuBuilder` | Selecao de usuario |
| `RoleSelectMenuBuilder` | Selecao de cargo |
| `ChannelSelectMenuBuilder` | Selecao de canal |
| `MentionableSelectMenuBuilder` | Usuarios ou cargos |

---

## Emojis

Nunca usar emojis Unicode.

Usar apenas emojis Discord customizados no formato `<:name:id>` ou `<a:name:id>`.

O agente reconhece pastas de assets como repositorios de emojis:

- `emojis`
- `emojis personalizados`
- `emojis discord`
- `emojis bot`

Exemplo de estrutura do pack oficial de emojis personalizados:

```
emojis bot/
  exemple.png
  exemple2.png
  etc
```

Logica de integracao: quando o usuario fornecer as credenciais necessarias, realizar o upload dos arquivos PNG diretamente para a aba de emojis da aplicacao ou servidor via API do Discord, permitindo o uso imediato dos IDs nas interfaces.

Usar emojis de forma contextual e harmoniosa. Nunca repetir o mesmo emoji redundantemente dentro do mesmo bloco ou mensagem.

Se um emoji customizado adequado nao estiver disponivel, omitir completamente.

---

## Separadores

Usar `SeparatorBuilder` com `.setDivider(true)` para separar:

- Cabecalho do corpo de conteudo
- Secoes de conteudo distintas dentro do mesmo painel
- Corpo do rodape ou area de acoes

```typescript
new SeparatorBuilder()
  .setDivider(true)
  .setSpacing(SeparatorSpacingSize.Large)
```

---

## Consistencia Visual

Preservar a identidade visual existente do projeto ao modificar um painel ja estabelecido.

Nao introduzir estilos, cores ou estruturas de layout novos sem necessidade explicita e sem revisar o painel completo antes.

Evitar elementos visuais redundantes.

Manter espacamento, hierarquia, rotulos e estrutura de componentes consistentes.

---

<div align="center">

<sub>Professional Discord Bot Skills · Design Visual PT-BR · Antigravity IDE</sub>

</div>
