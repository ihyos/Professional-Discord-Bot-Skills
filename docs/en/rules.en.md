<div align="center">

<img src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0b5061df29d55a92d945_full_logo_blurple_RGB.svg" alt="Discord" width="200" />

<br />
<br />

# Skill Rules

**Professional Discord Bot Skills · English**

</div>

---

## 1. Writing and Punctuation

Never use em dash or en dash punctuation anywhere in bot messages, text, titles, descriptions, footers, logs, or user-facing UI copy.

Accepted substitutes: vertical bar `|`, colon `:`, parentheses `(...)`, or simple hyphen `-`.

The agent ALWAYS asks the user which language to use before creating or modifying bot-facing text:

- Brazilian Portuguese (PT-BR)
- English

---

## 2. Visual Design and Components V2

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

## 3. Emoji Rules

Never use standard Unicode emojis in any bot message, title, button, panel, embed, notification, or log.

Prohibited examples: `📦 💸 📝 🛒 ℹ️ 🚨 ⏱️ 📋`.

Only use custom Discord emojis in the format `<:name:id>` or `<a:name:id>`.

If an appropriate custom emoji is unavailable, omit the emoji rather than substituting a Unicode emoji.

---

## 4. Code Preservation and Anti-Regression

Never modify, refactor, remove, or replace existing working code without absolute certainty about the expected behavior and impact on the complete system.

Before changing any line:

1. Inspect the complete relevant implementation.
2. Trace the feature from the interaction entry point through business logic, database operations, external APIs, responses, and logs.
3. Identify exact types, properties, function contracts, return values, and error paths.
4. Determine the smallest safe change required.
5. Modify only the necessary code.
6. Run `npm run build` immediately.
7. Review the affected flow for regressions.

---

## 5. Mandatory Validation and Compilation

Any code change MUST be validated immediately after the change.

Run `npm run build` after every code modification.

The project MUST compile without TypeScript errors before considering the change complete.

Do not hide, suppress, bypass, or ignore compiler errors.

---

## 6. Interaction Timing and Timeout Prevention

Strictly respect Discord's 3-second interaction response limit.

Use `deferReply()` immediately for slash commands that perform database queries, external HTTP requests, or other potentially slow asynchronous work.

Use `deferUpdate()` immediately when processing component interactions that may exceed the interaction response window.

After deferring, use the correct follow-up or edit operation for the interaction lifecycle.

---

## 7. Supabase as the Single Source of Truth

Never create or use local persistence as a substitute for Supabase.

Prohibited: `local-db.json`, SQLite, temporary persistence files, in-memory structures for application state.

All queries, inserts, updates, and deletes MUST execute directly against the official Supabase PostgreSQL database.

If a record does not exist in Supabase, the result MUST be null, empty, or otherwise absent according to the function contract.

Never create automatic seeders that detect an empty table and recreate products, orders, wallets, users, configuration, or historical data.

---

## 8. No Mocks or Fake Production Data

Never introduce mock production data to compensate for missing Supabase records.

Test fixtures MUST remain isolated from production flows and MUST NOT be silently used as production fallbacks.

If required production data is missing, handle the missing-data case explicitly and safely.

---

## 9. Absolute Credential Security

Never hardcode credentials in source code.

Prohibited: Discord bot tokens, API keys, passwords, secrets, private keys, Supabase credentials, payment credentials, or webhook secrets in any source file.

Never use hardcoded fallbacks such as `process.env.KEY || 'secret_key'`.

All credentials MUST be read through `process.env`.

If a required environment variable is missing, the application MUST throw an explicit error identifying the missing environment variable.

---

## 10. Zero Code Comments

Never add comments to project source code.

Prohibited: `//`, `/* ... */`, JSDoc, inline annotations, TODO comments, commented-out code, documentation comments inside code files.

Source files MUST contain executable or declarative code only.

---

## 11. User-Facing Language Selection

Bot messages must be written in PT-BR or English.

ALWAYS ask the user which of these two languages should be used when the language has not already been explicitly established for the current task.

Maintain consistent terminology across panels, commands, buttons, modals, errors, confirmations, and logs.

---

## 12. Error Handling and Data Integrity

Never hide errors that affect data integrity, payments, orders, balances, withdrawals, deliveries, or authentication.

Never convert a failed database operation into a successful-looking response.

Never confirm a payment, delivery, withdrawal, purchase, or database mutation unless the underlying operation has actually succeeded.

---

<div align="center">

<sub>Professional Discord Bot Skills · English · Antigravity IDE</sub>

</div>
