# Discord Bot Development Skill

## 1. Initial Project Setup and Mandatory Questions

Before initiating any bot architecture, code implementation, or refactoring, ALWAYS ask the user the following five mandatory questions:

1. Bot Type: What is the bot's purpose and functionality?
2. Bot Language: PT-BR or English?
3. Programming Language: TypeScript, JavaScript, Python, etc.
4. Bot Name: What is the bot name for branding and identity?
5. Database Choice: Local database (testing only) or remote persistence (Supabase, SQLite, PostgreSQL, etc.)?

## 2. Writing and Punctuation Rules

- NEVER use em dash or en dash punctuation anywhere in bot messages, text, titles, descriptions, footers, logs, documentation generated for the bot, or user-facing UI copy.
- Use vertical bars (`|`), colons (`:`), parentheses (`(...)`), or simple hyphens (`-`) for lists.
- Bot-facing text must always be written in either PT-BR or English according to the answer to question 2.

## 3. Visual Design and Discord Components V2

- ALL embeds, panels, menus, dashboards, confirmations, errors, success messages, and other structured Discord UI must use Discord Components V2.
- Messages using Components V2 MUST include `flags: MessageFlags.IsComponentsV2`.
- Do not introduce legacy embed-based layouts when a Components V2 implementation is appropriate.
- Prefer a clean, modern, structured layout using Components V2.
- Use `ContainerBuilder`, `TextDisplayBuilder`, `SectionBuilder`, `ThumbnailBuilder`, `MediaGalleryBuilder`, `FileBuilder`, `SeparatorBuilder`, `ActionRowBuilder`, `ButtonBuilder`, and the appropriate select menu builders when they fit the interface.
- Use `new SeparatorBuilder().setDivider(true)` to visually separate categories or major content blocks where appropriate.
- The standard accent color is white (`#FFFFFF`).
- Preserve visual consistency across all panels and commands.

## 4. Strict Emoji Rules and Custom Asset Pipeline

- NEVER use standard Unicode emojis in any bot message, text, title, button, panel, embed replacement, notification, or log.
- Examples of prohibited Unicode emojis include: 📦, 💸, 📝, 🛒, ℹ️, 🚨, ⏱️, 📋, 🔘, ⌨️, 💰.
- ONLY use custom Discord emojis in the format `<:name:id>` or `<a:name:id>`.
- The AI Agent MUST automatically recognize asset directories such as:
  - `emojis`
  - `emojis personalizados`
  - `emojis discord`
  - `emojis bot`
- These directories contain the PNG assets for all custom emojis intended for the bot.
- Emoji Asset Structure Example:
  ```
  emojis bot/
    exemple.png
    exemple2.png
    etc
  ```
- Workflow Logic: When the user provides sufficient credentials (bot token and target guild or application ID), upload the PNG assets directly to Discord via the Discord API. This registers the custom emojis and allows immediate use in bot UI components without rendering errors.
- NEVER repeat emojis redundantly within the same block or message.
- Use custom emojis contextually, dynamically, and harmoniously.
- If an appropriate custom emoji is unavailable, omit the emoji rather than substituting a Unicode emoji.

## 5. Stability, Preservation of Existing Code, and Anti-Regression

- NEVER modify, refactor, remove, or replace existing code that is already working correctly unless there is absolute certainty about the expected behavior and the impact on the complete system.
- NEVER break existing functionality.
- Every correction or addition MUST preserve all existing routines, including panels, commands, payments, withdrawals, deliveries, logs, database operations, and interaction flows.
- NEVER act blindly or make assumptions.
- Before changing any line, investigate the complete end-to-end flow.
- Verify exact property names in objects, types, function return values, exception handling, interaction lifecycle, component lifecycle, database behavior, and external request behavior.
- Prefer the smallest safe change that solves the requested problem.
- Do not perform unnecessary refactors while implementing a feature or fixing a bug.
- Preserve existing public interfaces and behavior unless the requested change explicitly requires otherwise.

## 6. Mandatory Validation and Compilation

- Any code change MUST be validated immediately after the change using the validation toolchain of the chosen programming language.
- For TypeScript / JavaScript: Run `npm run build` or `npx tsc --noEmit`.
- For Python: Run `python -m py_compile`, `mypy`, or project linter/tests.
- For Go: Run `go build` and `go vet`.
- For Rust: Run `cargo check` or `cargo build`.
- For any language: The project MUST compile, parse, or type-check without errors before considering the change complete.
- If the build or validation fails, investigate and fix the actual cause before declaring the task complete.
- Do not hide, suppress, bypass, or ignore compiler and runtime errors.
- When relevant, also validate the affected runtime flow after compilation.

## 7. Discord Interaction Timing and Timeout Prevention

- Strictly respect Discord's 3-second interaction response limit.
- Use `deferReply()` immediately for slash commands or interaction handlers that perform database queries, external HTTP requests, multiple asynchronous operations, or other potentially slow work.
- Use `deferUpdate()` immediately when processing component interactions that may take longer than the Discord interaction response window.
- Acknowledge interactions before performing slow Supabase operations, HTTP requests, payment operations, file operations, or multiple message operations.
- After deferring, use the correct follow-up or edit operation for the interaction lifecycle.
- Never allow avoidable database or network latency to cause an interaction timeout.

## 8. Database Architecture and Persistence Strategy

- Follow the database selection established in initial question 5:
  - Local Database: Reserved for local prototyping and rapid testing.
  - Remote Production Persistence (Supabase, SQLite, PostgreSQL): Production source of truth.
- When Supabase or remote persistence is selected, NEVER substitute it with silent local file fallbacks or in-memory caches.
- ALL queries, inserts, updates, and deletes MUST execute directly against the designated database.
- If a record does not exist, the result MUST be null, empty, or absent according to contract.
- Never resurrect deleted data from local state, memory, or fixtures.
- A deletion is permanent from the application perspective.
- NEVER create automatic seeders that detect an empty table and recreate data without explicit user request.

## 9. No Mocks or Fake Production Data

- NEVER introduce mock production data to compensate for missing Supabase records.
- NEVER create fallback products, orders, wallets, balances, payments, or user records in code.
- Test fixtures MUST remain isolated from production flows and MUST NOT be silently used as production fallbacks.
- If required production data is missing, handle the missing-data case explicitly and safely.

## 10. Absolute Credential Security

- NEVER hardcode credentials in source code.
- NEVER hardcode Discord bot tokens, API keys, passwords, secrets, private keys, Supabase credentials, payment credentials, webhook secrets, or similar sensitive values in `.ts`, `.js`, `.json`, or any other source/configuration file committed as application code.
- NEVER use hardcoded fallbacks such as `process.env.KEY || 'secret_key'`.
- ALL credentials MUST be read through `process.env`.
- If a required environment variable is missing, the application MUST throw an explicit error identifying the missing environment variable.
- NEVER silently continue with a default secret or placeholder credential.
- Keep secrets in `.env` or the appropriate secure environment configuration.
- Do not expose secrets in logs, error messages, responses, source code, generated files, or Discord messages.

## 11. Zero Code Comments

- NEVER add comments to project source code.
- This includes `//`, `/* ... */`, JSDoc, inline explanations, flow annotations, TODO comments, commented-out code, and documentation comments inside code files.
- Source files MUST contain executable or declarative code only.
- Code must be clear, direct, and self-explanatory through naming, structure, and types.
- Do not preserve newly introduced commented-out code as part of a change.
- This rule applies to TypeScript, JavaScript, JSON-like configuration where comments are supported, and other project source files.

## 12. Safe Change Workflow

Before modifying code:

1. Inspect the complete relevant implementation.
2. Trace the feature from the interaction entry point through business logic, database operations, external APIs, responses, and logs.
3. Identify exact types, properties, function contracts, return values, error paths, and interaction lifecycle behavior.
4. Determine the smallest safe change required.
5. Modify only the necessary code.
6. Run `npm run build` immediately.
7. Review the affected flow for regressions.
8. Confirm that existing functionality remains intact.

Do not skip investigation because a change appears small.

## 13. User-Facing Language Selection

- Bot messages must be written in PT-BR or English.
- Follow the language established in the initial questionnaire.
- Do not silently choose a third language.
- Keep terminology consistent across panels, commands, buttons, modals, errors, confirmations, payment screens, withdrawal screens, delivery messages, and logs.
- If the user explicitly specifies a language, follow that instruction without asking again for the same task.

## 14. Standard Visual Pattern

Use the following visual standard unless the user explicitly requests a different design:

- Discord Components V2 with `flags: MessageFlags.IsComponentsV2`.
- Clean and modern layout.
- White accent color (`#FFFFFF`).
- `SeparatorBuilder` with `.setDivider(true)` between major categories or blocks.
- Custom Discord emojis only.
- No Unicode emojis.
- No em dash or en dash characters.
- Consistent spacing, hierarchy, labels, and component structure.
- Avoid redundant visual elements.
- Preserve the existing project's visual identity when modifying an established panel.

## 15. Error Handling and Data Integrity

- Never hide errors that affect data integrity, payments, orders, balances, withdrawals, deliveries, or authentication.
- Handle expected failures explicitly.
- Never convert a failed database operation into a successful-looking response.
- Never confirm a payment, delivery, withdrawal, purchase, or database mutation unless the underlying operation has actually succeeded.
- Keep user-facing error messages clear and consistent with the selected PT-BR or English language.
- Do not expose internal secrets, stack traces, SQL credentials, tokens, or sensitive implementation details to Discord users.

## 15. Documentation and Technical References

Use official or technically relevant documentation when implementing Discord Components V2 or discord.js functionality.

### Official Discord Documentation

- Discord Components V2 Overview
- Components and Modals Overview
- Component Reference
- Using Message Components
- Using Modal Components
- Interactions Overview
- Receiving and Responding to Interactions
- Message API
- Webhook API
- Discord Developer Changelog
- Discord Docs `llms.txt`, which indexes current Discord documentation for LLMs and AI agents.

### discord.js Builder Documentation

- `ContainerBuilder`
- `SectionBuilder`
- `TextDisplayBuilder`
- `ThumbnailBuilder`
- `MediaGalleryBuilder`
- `FileBuilder`
- `SeparatorBuilder`
- `ActionRowBuilder`
- `ButtonBuilder`
- `StringSelectMenuBuilder`
- `UserSelectMenuBuilder`
- `RoleSelectMenuBuilder`
- `MentionableSelectMenuBuilder`
- `ChannelSelectMenuBuilder`
- `MappedComponentTypes`

### Components V2 Guides and Repositories

- ZarScape/discord.js-v2-components
- ZarScape/discord.js-v14-v2-template
- itsfizys/discordjs-components-v2-guide
- ShadowByte01/Discord-components-v2-guide
- AuthGuards/discord-v2-demo
- momentxrdd/components-v2
- Safauri/Components-v2
- SoulDevs/components-v2
- hewkawar/discord.js-component-v2-demo
- primepvi/kompozr
- doku-macaron/discord-bot-template
- WissemBad/discordjs-typescript-template
- Discord Components V2 discord.js Master Migration Reference

### Official Documentation URLs

https://docs.discord.com/developers/components/overview
https://docs.discord.com/developers/platform/components
https://docs.discord.com/developers/components/reference
https://docs.discord.com/developers/components/using-message-components
https://docs.discord.com/developers/components/using-modal-components
https://docs.discord.com/developers/interactions/overview
https://docs.discord.com/developers/interactions/receiving-and-responding
https://docs.discord.com/developers/resources/message
https://docs.discord.com/developers/resources/webhook
https://docs.discord.com/developers/change-log
https://docs.discord.com/llms.txt

### discord.js Documentation URLs

https://discord.js.org/docs/packages/discord.js/main
https://discord.js.org/docs/packages/discord.js/main/ContainerBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/SectionBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/TextDisplayBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/ThumbnailBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/MediaGalleryBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/FileBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/SeparatorBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/ActionRowBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/ButtonBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/StringSelectMenuBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/UserSelectMenuBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/RoleSelectMenuBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/MentionableSelectMenuBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/ChannelSelectMenuBuilder%3AClass
https://discord.js.org/docs/packages/discord.js/main/MappedComponentTypes%3AInterface

### GitHub References

https://github.com/ZarScape/discord.js-v2-components
https://github.com/ZarScape/discord.js-v14-v2-template
https://github.com/itsfizys/discordjs-components-v2-guide
https://github.com/ShadowByte01/Discord-components-v2-guide
https://github.com/AuthGuards/discord-v2-demo
https://github.com/momentxrdd/components-v2
https://github.com/Safauri/Components-v2
https://github.com/SoulDevs/components-v2
https://github.com/hewkawar/discord.js-component-v2-demo
https://github.com/primepvi/kompozr
https://github.com/doku-macaron/discord-bot-template
https://github.com/WissemBad/discordjs-typescript-template
https://gist.github.com/hihumanzone/479752a05b428459c1021f0e47ef6c05
https://github.com/topics/discord-components-v2
https://github.com/topics/discord-components-v2?l=javascript
https://github.com/search?q=%22MessageFlags.IsComponentsV2%22&type=code
https://github.com/search?q=%22ContainerBuilder%22+%22IsComponentsV2%22&type=code
https://github.com/search?q=%22Components+V2%22+discord.js+language%3ATypeScript&type=code
