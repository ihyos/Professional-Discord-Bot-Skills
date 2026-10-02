<div align="center">

<img src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0b5061df29d55a92d945_full_logo_blurple_RGB.svg" alt="Discord" width="200" />

<br />
<br />

# Visual Design

**Professional Discord Bot Skills · English**

</div>

---

## Visual Standard

The bot's visual design follows a fixed set of conventions to guarantee consistency across all panels, commands, and messages.

---

## Accent Color

The default accent color for all containers is white `#FFFFFF` (`0xFFFFFF`).

Never use arbitrary colors without explicit user authorization for the context in question.

---

## Layout

All user interfaces follow this logical layout order inside a `ContainerBuilder`:

1. Header section with title and thumbnail (when applicable)
2. `SeparatorBuilder` with `.setDivider(true)`
3. Content body with `TextDisplayBuilder`
4. Additional separators between content blocks
5. `ActionRowBuilder` with buttons or selection menus

---

## Typography and Text Formatting

Use Discord markdown to structure text:

| Formatting | Usage |
|---|---|
| `**text**` | Bold for titles and highlights |
| `\`code\`` | Inline code for values, IDs, and technical fields |
| `-` | Item lists |
| `> text` | Block quote or highlight |

Never use em dash or en dash.

Use vertical bar `|`, colon `:`, or simple hyphen `-` as text separators.

---

## Interface Components

### Buttons

| Style | Usage |
|---|---|
| `ButtonStyle.Primary` | Main action or confirmation |
| `ButtonStyle.Secondary` | Secondary action or cancellation |
| `ButtonStyle.Success` | Positive confirmation |
| `ButtonStyle.Danger` | Destructive or high-risk action |
| `ButtonStyle.Link` | External link |

### Selection Menus

Use the most specific selection menu for the context:

| Builder | Usage |
|---|---|
| `StringSelectMenuBuilder` | Fixed text options |
| `UserSelectMenuBuilder` | User selection |
| `RoleSelectMenuBuilder` | Role selection |
| `ChannelSelectMenuBuilder` | Channel selection |
| `MentionableSelectMenuBuilder` | Users or roles |

---

## Emojis

Never use Unicode emojis.

Only use custom Discord emojis in the format `<:name:id>` or `<a:name:id>`.

The agent recognizes asset directories as custom emoji repositories:

- `emojis`
- `emojis personalizados`
- `emojis discord`
- `emojis bot`

Example structure for the official custom emoji pack:

```
emojis bot/
  exemple.png
  exemple2.png
  etc
```

Integration logic: when the user provides sufficient credentials, upload the PNG files directly to the application or guild emojis tab via the Discord API, allowing immediate use of the generated IDs in bot interfaces.

Use emojis contextually and harmoniously. Never repeat the same emoji redundantly within the same block or message.

If an appropriate custom emoji is unavailable, omit it entirely.

---

## Separators

Use `SeparatorBuilder` with `.setDivider(true)` to separate:

- Header from the content body
- Distinct content sections within the same panel
- Body from the footer or action area

```typescript
new SeparatorBuilder()
  .setDivider(true)
  .setSpacing(SeparatorSpacingSize.Large)
```

---

## Visual Consistency

Preserve the existing visual identity of the project when modifying an established panel.

Do not introduce new styles, colors, or layout structures without explicit need and without reviewing the complete panel first.

Avoid redundant visual elements.

Maintain consistent spacing, hierarchy, labels, and component structure.

---

<div align="center">

<sub>Professional Discord Bot Skills · Visual Design English · Antigravity IDE</sub>

</div>
