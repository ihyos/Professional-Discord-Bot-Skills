<div align="center">

<img src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0b5061df29d55a92d945_full_logo_blurple_RGB.svg" alt="Discord" width="200" />

<br />
<br />

# Seguranca

**Professional Discord Bot Skills · PT-BR**

</div>

---

## Credenciais

Nunca inserir credenciais diretamente no codigo-fonte.

Proibido em qualquer arquivo `.ts`, `.js`, `.json` ou similar:

- Tokens do bot Discord
- Chaves de API
- Senhas e segredos
- Chaves privadas
- Credenciais do Supabase
- Credenciais de pagamento
- Segredos de webhook

---

## Variaveis de Ambiente

Todas as credenciais DEVEM ser lidas atraves de `process.env`.

```typescript
const token = process.env.DISCORD_TOKEN;
if (!token) throw new Error('DISCORD_TOKEN nao definido');
```

Nunca usar fallbacks hardcodados:

```typescript
// PROIBIDO
const token = process.env.DISCORD_TOKEN || 'meu_token_secreto';
```

Se uma variavel de ambiente obrigatoria estiver ausente, a aplicacao DEVE lancar um erro explicito identificando a variavel ausente.

---

## Arquivo .env

Manter segredos no arquivo `.env` ou na configuracao de ambiente seguro adequada.

O arquivo `.env` NUNCA deve ser commitado no repositorio.

Adicionar `.env` ao `.gitignore`:

```
.env
.env.local
.env.production
```

---

## Exposicao de Segredos

Nunca expor segredos em:

- Logs do sistema
- Mensagens de erro ao usuario
- Respostas ao Discord
- Codigo-fonte ou arquivos gerados
- Mensagens do Discord ou paineis do bot

---

## Integridade de Dados

Nunca ocultar erros que afetam:

- Integridade de dados
- Pagamentos
- Pedidos
- Saldos
- Saques
- Entregas
- Autenticacao

Nunca confirmar uma operacao (pagamento, saque, entrega, mutacao de banco de dados) a menos que a operacao subjacente tenha de fato sido bem-sucedida.

Nunca converter uma operacao de banco de dados com falha em uma resposta de aparencia bem-sucedida.

---

## Supabase e Persistencia

Nunca criar arquivos de banco de dados locais como substitutos para o Supabase.

Proibido: `local-db.json`, SQLite, arquivos de persistencia temporaria ou estruturas em memoria para estado de aplicacao persistente.

O Supabase e a unica fonte de verdade para todos os dados persistentes da aplicacao.

Uma exclusao realizada pelo bot ou diretamente no Supabase e permanente do ponto de vista da aplicacao.

---

<div align="center">

<sub>Professional Discord Bot Skills · Seguranca PT-BR · Antigravity IDE</sub>

</div>
