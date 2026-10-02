<div align="center">

<img src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0b5061df29d55a92d945_full_logo_blurple_RGB.svg" alt="Discord" width="200" />

<br />
<br />

# Skill Rules

**Professional Discord Bot Skills | English**

</div>

---

## 1. Initial Alignment and Mandatory Questions

Before initiating any bot architecture, code implementation, or refactoring, the AI Agent MUST always ask the user:

1. Bot Type: What is the bot's purpose and functionality?
2. Bot Language: PT-BR or English?
3. Programming Language: TypeScript, JavaScript, Python, etc.
4. Bot Name: What is the bot name for branding and identity?
5. Database Choice: Local database (testing only) or remote persistence (Supabase, SQLite, PostgreSQL, etc.)?

---

## 2. Writing and Punctuation

Never use em dash or en dash punctuation anywhere in bot messages, text, titles, descriptions, footers, logs, or user-facing UI copy.

Accepted substitutes: vertical bar `|`, colon `:`, parentheses `(...)`, or simple hyphen `-` for lists.

User-facing text strictly follows the language chosen in the initial questionnaire.

---

## 3. Visual Design and Components V2

All embeds, panels, menus, dashboards, confirmations, errors, and success messages MUST use **Discord Components V2**.

Messages using Components V2 MUST include `flags: MessageFlags.IsComponentsV2`.

Do not introduce legacy embed-based layouts when a Components V2 implementation is appropriate.

**Required builders per context:**

| Builder | Purpose |
|---|---|
| `ContainerBuilder` | Main containers |
| `TextDisplayBuilder` | Text display |
| `SectionBuilder` | Sections with thumbnail |
| `ThumbnailBuilder` | Thumbnails inside sections |
| `MediaGalleryBuilder` | Media galleries |
| `FileBuilder` | File attachments |
| `SeparatorBuilder` | Visual dividers |
| `ActionRowBuilder` | Action rows |
| `ButtonBuilder` | Buttons |
| Select Menu Builders | Selection menus |

Standard accent color: white `#FFFFFF`.

Use `new SeparatorBuilder().setDivider(true)` to separate major content blocks.

---

## 4. Emoji Rules and Asset Pipeline

Never use standard Unicode emojis in any bot message, title, button, panel, embed, notification, or log.

Prohibited examples: `📦 💸 📝 🛒 ℹ️ 🚨 ⏱️ 📋 🔘 ⌨️ 💰`.

Only use custom Discord emojis in the format `<:name:id>` or `<a:name:id>`.

### Automatic Directory Recognition

The AI Agent MUST automatically recognize asset directories as custom emoji storage:

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

### Discord API Upload Logic

When the user provides sufficient credentials (bot token and application or guild ID):

1. Read the PNG files located in the emoji asset directory.
2. Upload assets via the official Discord API to the application or guild emojis tab.
3. Retrieve the generated `<:name:id>` identifiers.
4. Reference these custom emojis directly inside bot UI components, ensuring error-free rendering.

If an appropriate custom emoji is unavailable, omit the emoji rather than substituting a Unicode emoji.

---

## 5. Code Preservation and Anti-Regression

Never modify, refactor, remove, or replace existing working code without absolute certainty about the expected behavior and impact on the complete system.

Before changing any line:

1. Inspect the complete relevant implementation.
2. Trace the feature from the interaction entry point through business logic, database operations, external APIs, responses, and logs.
3. Identify exact types, properties, function contracts, return values, and error paths.
4. Determine the smallest safe change required.
5. Modify only the necessary code.
6. Run the build or validation command for the chosen language immediately.
7. Review the affected flow for regressions.

---

## 6. Mandatory Validation and Compilation

Any code change MUST be validated immediately after the change using the toolchain of the chosen language.

- For TypeScript or JavaScript: Run `npm run build` or `npx tsc --noEmit`.
- For Python: Run `python -m py_compile`, `mypy`, or project test suite.
- For Go: Run `go build` and `go vet`.
- For Rust: Run `cargo check` or `cargo build`.
- For any language: The project MUST compile or pass validation without errors before considering the change complete.

Do not hide, suppress, bypass, or ignore compiler or runtime errors.

---

## 7. Interaction Timing and Timeout Prevention

Strictly respect Discord's 3-second interaction response limit.

Use `deferReply()` immediately for slash commands that perform database queries, external HTTP requests, or other potentially slow asynchronous work.

Use `deferUpdate()` immediately when processing component interactions that may exceed the interaction response window.

After deferring, use the correct follow-up or edit operation for the interaction lifecycle.

---

## 8. Database Architecture and Persistence Strategy

Respect the database selection established in initial question 5:

- **Local Database**: Permitted exclusively for testing and rapid prototyping.
- **Production Persistence (Supabase, SQLite, PostgreSQL)**: Single source of truth for live environments.

When Supabase or a remote database is selected for production:

- All operations MUST execute directly against the official database.
- If a record does not exist, the result MUST be null or absent according to contract.
- Never create automatic seeders that recreate data without explicit user request.

---

## 9. No Mocks or Fake Production Data

Never introduce mock production data to compensate for missing database records.

Test fixtures MUST remain isolated from production flows.

If required production data is missing, handle the missing-data case explicitly and safely.

---

## 10. Absolute Credential Security

Never hardcode credentials in source code.

Prohibited: Discord bot tokens, API keys, passwords, secrets, private keys, database credentials, or webhook secrets in any source file.

Never use hardcoded fallbacks such as `process.env.KEY || 'secret_key'`.

All credentials MUST be read through `process.env`.

If a required environment variable is missing, the application MUST throw an explicit error identifying the missing variable.

---

## 11. Zero Code Comments

Never add comments to project source code.

Prohibited: `//`, `/* ... */`, JSDoc, inline annotations, TODO comments, commented-out code, documentation comments inside code files.

Source files MUST contain executable or declarative code only.

---

## 12. Error Handling and Data Integrity

Never hide errors that affect data integrity, payments, orders, balances, withdrawals, deliveries, or authentication.

Never convert a failed database operation into a successful-looking response.

Never confirm a payment, delivery, withdrawal, purchase, or database mutation unless the underlying operation has actually succeeded.

---

<div align="center">

<sub>Professional Discord Bot Skills | English | Antigravity IDE</sub>

</div>
