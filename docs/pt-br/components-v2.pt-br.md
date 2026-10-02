<div align="center">

<img src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0b5061df29d55a92d945_full_logo_blurple_RGB.svg" alt="Discord" width="200" />

<br />
<br />

# Componentes V2

**Professional Discord Bot Skills · PT-BR**

</div>

---

## O que e Components V2

Discord Components V2 e o sistema moderno de interface de usuario para mensagens de bots. Ele substitui o sistema legado de embeds por uma hierarquia de componentes declarativos, mais flexivel e com renderizacao nativa no cliente Discord.

Toda mensagem que usa Components V2 DEVE incluir:

```typescript
flags: MessageFlags.IsComponentsV2
```

---

## Hierarquia de Builders

```
ContainerBuilder
  SectionBuilder
    TextDisplayBuilder
    ThumbnailBuilder
  SeparatorBuilder
  TextDisplayBuilder
  ActionRowBuilder
    ButtonBuilder
    StringSelectMenuBuilder
  MediaGalleryBuilder
  FileBuilder
```

---

## Uso Correto por Componente

### ContainerBuilder

Envolve todos os outros componentes. Define a cor de destaque do conteiner.

```typescript
const container = new ContainerBuilder()
  .setAccentColor(0xFFFFFF)
  .addSectionComponents(section)
  .addSeparatorComponents(separator)
  .addActionRowComponents(row);
```

---

### SectionBuilder

Agrupa texto e thumbnail em uma unica linha de layout.

```typescript
const section = new SectionBuilder()
  .addTextDisplayComponents(
    new TextDisplayBuilder().setContent('Titulo da secao')
  )
  .setThumbnailAccessory(
    new ThumbnailBuilder().setURL('https://example.com/image.png')
  );
```

---

### TextDisplayBuilder

Exibe texto simples ou formatado com markdown dentro de um container.

```typescript
const text = new TextDisplayBuilder()
  .setContent('Texto da mensagem com **negrito** ou `codigo`');
```

---

### SeparatorBuilder

Cria um divisor visual entre blocos de conteudo.

```typescript
const separator = new SeparatorBuilder()
  .setDivider(true)
  .setSpacing(SeparatorSpacingSize.Large);
```

---

### ActionRowBuilder com ButtonBuilder

Cria uma linha de botoes clicaveis.

```typescript
const row = new ActionRowBuilder<ButtonBuilder>()
  .addComponents(
    new ButtonBuilder()
      .setCustomId('btn_confirmar')
      .setLabel('Confirmar')
      .setStyle(ButtonStyle.Primary),
    new ButtonBuilder()
      .setCustomId('btn_cancelar')
      .setLabel('Cancelar')
      .setStyle(ButtonStyle.Secondary)
  );
```

---

### StringSelectMenuBuilder

Cria um menu de selecao com opcoes de texto.

```typescript
const select = new StringSelectMenuBuilder()
  .setCustomId('menu_principal')
  .setPlaceholder('Selecione uma opcao')
  .addOptions(
    { label: 'Opcao 1', value: 'opcao_1' },
    { label: 'Opcao 2', value: 'opcao_2' }
  );
```

---

### MediaGalleryBuilder

Exibe uma galeria de imagens ou arquivos de midia.

```typescript
const gallery = new MediaGalleryBuilder()
  .addItems(
    new MediaGalleryItemBuilder().setURL('https://example.com/img1.png'),
    new MediaGalleryItemBuilder().setURL('https://example.com/img2.png')
  );
```

---

## Estrutura Padrao de Mensagem

```typescript
await interaction.reply({
  flags: MessageFlags.IsComponentsV2,
  components: [
    new ContainerBuilder()
      .setAccentColor(0xFFFFFF)
      .addSectionComponents(
        new SectionBuilder()
          .addTextDisplayComponents(
            new TextDisplayBuilder().setContent('Titulo')
          )
      )
      .addSeparatorComponents(
        new SeparatorBuilder().setDivider(true)
      )
      .addTextDisplayComponents(
        new TextDisplayBuilder().setContent('Conteudo da mensagem')
      )
      .addActionRowComponents(
        new ActionRowBuilder<ButtonBuilder>().addComponents(
          new ButtonBuilder()
            .setCustomId('acao')
            .setLabel('Executar')
            .setStyle(ButtonStyle.Primary)
        )
      )
  ]
});
```

---

## Interacoes com Defer

Para operacoes lentas, diferir a resposta antes de processar:

```typescript
// Slash command
await interaction.deferReply();
// ... operacoes lentas ...
await interaction.editReply({ flags: MessageFlags.IsComponentsV2, components: [...] });

// Interacao de componente
await interaction.deferUpdate();
// ... operacoes lentas ...
await interaction.editReply({ flags: MessageFlags.IsComponentsV2, components: [...] });
```

---

<div align="center">

<sub>Professional Discord Bot Skills · Components V2 PT-BR · Antigravity IDE</sub>

</div>
