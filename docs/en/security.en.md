<div align="center">

<img src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0b5061df29d55a92d945_full_logo_blurple_RGB.svg" alt="Discord" width="200" />

<br />
<br />

# Security

**Professional Discord Bot Skills · English**

</div>

---

## Credentials

Never insert credentials directly into source code.

Prohibited in any `.ts`, `.js`, `.json`, or similar file:

- Discord bot tokens
- API keys
- Passwords and secrets
- Private keys
- Supabase credentials
- Payment credentials
- Webhook secrets

---

## Environment Variables

All credentials MUST be read through `process.env`.

```typescript
const token = process.env.DISCORD_TOKEN;
if (!token) throw new Error('DISCORD_TOKEN is not defined');
```

Never use hardcoded fallbacks:

```typescript
// PROHIBITED
const token = process.env.DISCORD_TOKEN || 'my_secret_token';
```

If a required environment variable is missing, the application MUST throw an explicit error identifying the missing variable.

---

## .env File

Keep secrets in the `.env` file or the appropriate secure environment configuration.

The `.env` file MUST NEVER be committed to the repository.

Add `.env` to `.gitignore`:

```
.env
.env.local
.env.production
```

---

## Secret Exposure

Never expose secrets in:

- System logs
- User-facing error messages
- Discord responses
- Source code or generated files
- Discord messages or bot panels

---

## Data Integrity

Never hide errors that affect:

- Data integrity
- Payments
- Orders
- Balances
- Withdrawals
- Deliveries
- Authentication

Never confirm an operation (payment, withdrawal, delivery, database mutation) unless the underlying operation has actually succeeded.

Never convert a failed database operation into a successful-looking response.

---

## Supabase and Persistence

Never create local database files as substitutes for Supabase.

Prohibited: `local-db.json`, SQLite, temporary persistence files, or in-memory structures for persistent application state.

Supabase is the single source of truth for all persistent application data.

A deletion performed by the bot or directly in Supabase is permanent from the application's perspective.

---

<div align="center">

<sub>Professional Discord Bot Skills · Security English · Antigravity IDE</sub>

</div>
