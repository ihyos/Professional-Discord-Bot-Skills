<div align="center">

<img src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0b5061df29d55a92d945_full_logo_blurple_RGB.svg" alt="Discord" width="200" />

<br />
<br />

# Components V2

**Professional Discord Bot Skills · English**

</div>

---

## What is Components V2

Discord Components V2 is the modern user interface system for bot messages. It replaces the legacy embed system with a declarative component hierarchy that is more flexible and renders natively in the Discord client.

Every message using Components V2 MUST include:

```typescript
flags: MessageFlags.IsComponentsV2
```

---

## Builder Hierarchy

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

## Correct Usage Per Component

### ContainerBuilder

Wraps all other components. Defines the accent color of the container.

```typescript
const container = new ContainerBuilder()
  .setAccentColor(0xFFFFFF)
  .addSectionComponents(section)
  .addSeparatorComponents(separator)
  .addActionRowComponents(row);
```

---

### SectionBuilder

Groups text and thumbnail in a single layout row.

```typescript
const section = new SectionBuilder()
  .addTextDisplayComponents(
    new TextDisplayBuilder().setContent('Section title')
  )
  .setThumbnailAccessory(
    new ThumbnailBuilder().setURL('https://example.com/image.png')
  );
```

---

### TextDisplayBuilder

Displays plain or markdown-formatted text inside a container.

```typescript
const text = new TextDisplayBuilder()
  .setContent('Message text with **bold** or `code`');
```

---

### SeparatorBuilder

Creates a visual divider between content blocks.

```typescript
const separator = new SeparatorBuilder()
  .setDivider(true)
  .setSpacing(SeparatorSpacingSize.Large);
```

---

### ActionRowBuilder with ButtonBuilder

Creates a row of clickable buttons.

```typescript
const row = new ActionRowBuilder<ButtonBuilder>()
  .addComponents(
    new ButtonBuilder()
      .setCustomId('btn_confirm')
      .setLabel('Confirm')
      .setStyle(ButtonStyle.Primary),
    new ButtonBuilder()
      .setCustomId('btn_cancel')
      .setLabel('Cancel')
      .setStyle(ButtonStyle.Secondary)
  );
```

---

### StringSelectMenuBuilder

Creates a selection menu with text options.

```typescript
const select = new StringSelectMenuBuilder()
  .setCustomId('main_menu')
  .setPlaceholder('Select an option')
  .addOptions(
    { label: 'Option 1', value: 'option_1' },
    { label: 'Option 2', value: 'option_2' }
  );
```

---

### MediaGalleryBuilder

Displays a gallery of images or media files.

```typescript
const gallery = new MediaGalleryBuilder()
  .addItems(
    new MediaGalleryItemBuilder().setURL('https://example.com/img1.png'),
    new MediaGalleryItemBuilder().setURL('https://example.com/img2.png')
  );
```

---

## Standard Message Structure

```typescript
await interaction.reply({
  flags: MessageFlags.IsComponentsV2,
  components: [
    new ContainerBuilder()
      .setAccentColor(0xFFFFFF)
      .addSectionComponents(
        new SectionBuilder()
          .addTextDisplayComponents(
            new TextDisplayBuilder().setContent('Title')
          )
      )
      .addSeparatorComponents(
        new SeparatorBuilder().setDivider(true)
      )
      .addTextDisplayComponents(
        new TextDisplayBuilder().setContent('Message content')
      )
      .addActionRowComponents(
        new ActionRowBuilder<ButtonBuilder>().addComponents(
          new ButtonBuilder()
            .setCustomId('action')
            .setLabel('Execute')
            .setStyle(ButtonStyle.Primary)
        )
      )
  ]
});
```

---

## Interactions with Defer

For slow operations, defer the response before processing:

```typescript
// Slash command
await interaction.deferReply();
// ... slow operations ...
await interaction.editReply({ flags: MessageFlags.IsComponentsV2, components: [...] });

// Component interaction
await interaction.deferUpdate();
// ... slow operations ...
await interaction.editReply({ flags: MessageFlags.IsComponentsV2, components: [...] });
```

---

<div align="center">

<sub>Professional Discord Bot Skills · Components V2 English · Antigravity IDE</sub>

</div>
