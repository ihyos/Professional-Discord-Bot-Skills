<div align="center">

<img src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0b5061df29d55a92d945_full_logo_blurple_RGB.svg" alt="Discord" width="200" />

<br />
<br />

# Regras da Skill

**Professional Discord Bot Skills | PT-BR**

</div>

---

## 1. Alinhamento Inicial e Perguntas Obrigatorias

Antes de iniciar qualquer arquitetura, implementacao ou refatoracao de bot, o agente DEVE sempre perguntar ao usuario:

1. Tipo do Bot: Qual e o proposito e o que o bot fara?
2. Idioma do Bot: PT-BR ou English?
3. Linguagem de Programacao: TypeScript, JavaScript, Python, etc.
4. Nome do Bot: Qual sera o nome para utilizar como identidade e marca?
5. Banco de Dados: Banco de dados local (apenas para testes) ou persistencia remota (Supabase, SQLite, PostgreSQL, etc.)?

---

## 2. Escrita e Pontuacao

Nunca utilizar traco longo (em dash) ou traco medio (en dash) em mensagens, titulos, descricoes, rodapes, logs ou copias de interface do bot.

Substitutos aceitos: barra vertical `|`, dois pontos `:`, parenteses `(...)` ou hifen simples `-` em listas.

O texto voltado ao usuario segue rigorosamente o idioma escolhido na pergunta inicial.

---

## 3. Design Visual e Components V2

Todos os embeds, paineis, menus, dashboards, confirmacoes, erros e mensagens de sucesso DEVEM usar **Discord Components V2**.

Mensagens com Components V2 DEVEM incluir `flags: MessageFlags.IsComponentsV2`.

Nao introduzir layouts legados baseados em embed quando uma implementacao Components V2 for adequada.

**Builders obrigatorios conforme o contexto:**

| Builder | Uso |
|---|---|
| `ContainerBuilder` | Conteineres principais |
| `TextDisplayBuilder` | Exibicao de texto |
| `SectionBuilder` | Secoes com thumbnail |
| `ThumbnailBuilder` | Miniaturas em secoes |
| `MediaGalleryBuilder` | Galerias de midia |
| `FileBuilder` | Anexos de arquivo |
| `SeparatorBuilder` | Divisores visuais |
| `ActionRowBuilder` | Linha de acoes |
| `ButtonBuilder` | Botoes |
| Select Menu Builders | Menus de selecao |

Cor de destaque padrao: branco `#FFFFFF`.

Usar `new SeparatorBuilder().setDivider(true)` para separar blocos de conteudo principais.

---

## 4. Regras de Emoji e Gestao de Assets

Nunca usar emojis Unicode em qualquer mensagem, titulo, botao, painel, embed, notificacao ou log.

Exemplos proibidos: `📦 💸 📝 🛒 ℹ️ 🚨 ⏱️ 📋 🔘 ⌨️ 💰`.

Usar exclusivamente emojis Discord customizados no formato `<:name:id>` ou `<a:name:id>`.

### Reconhecimento Automatico de Pastas

A IA e o agente DEVEM reconhecer pastas de assets como diretorios de emojis personalizados:

- `emojis`
- `emojis personalizados`
- `emojis discord`
- `emojis bot`

Estrutura de exemplo do pack oficial de emojis personalizados:

```
emojis bot/
  exemple.png
  exemple2.png
  etc
```

### Logica de Upload via API Discord

Quando o usuario fornecer as informacoes necessarias (token do bot e ID da aplicacao ou servidor):

1. Ler os arquivos PNG presentes na pasta de emojis.
2. Realizar o upload via API oficial do Discord para a aba de emojis da aplicacao ou servidor.
3. Obter os identificadores gerados `<:name:id>`.
4. Utilizar esses emojis diretamente nas mensagens e botoes do bot, garantindo renderizacao sem erros.

Se um emoji customizado adequado nao estiver disponivel, omitir o emoji ao inves de substituir por Unicode.

---

## 5. Preservacao de Codigo e Anti-Regressao

Nunca modificar, refatorar, remover ou substituir codigo que ja funciona corretamente sem certeza absoluta sobre o impacto no sistema completo.

Antes de alterar qualquer linha:

1. Inspecionar a implementacao completa relevante.
2. Rastrear o fluxo do ponto de entrada ate a resposta final.
3. Identificar tipos, propriedades e contratos de funcao exatos.
4. Determinar a menor mudanca segura necessaria.
5. Modificar apenas o codigo necessario.
6. Executar `npm run build` imediatamente.
7. Revisar o fluxo afetado para regressoes.

---

## 6. Validacao e Compilacao Obrigatoria

Qualquer alteracao de codigo DEVE ser validada imediatamente apos a mudanca.

Executar `npm run build` apos cada modificacao de codigo.

O projeto DEVE compilar sem erros TypeScript antes de considerar a mudanca concluida.

Nao ocultar, suprimir, contornar ou ignorar erros do compilador.

---

## 7. Timing de Interacao e Prevencao de Timeout

Respeitar estritamente o limite de resposta de 3 segundos do Discord.

Usar `deferReply()` imediatamente para slash commands que realizam consultas ao banco de dados, requisicoes HTTP externas ou operacoes assincronas lentas.

Usar `deferUpdate()` imediatamente ao processar interacoes de componentes que podem exceder o tempo de resposta.

Apos diferir, usar a operacao correta de follow-up ou edicao para o ciclo de vida da interacao.

---

## 8. Estrategia de Banco de Dados e Persistencia

Respeitar a escolha definida na pergunta inicial:

- **Banco de Dados Local**: Permitido exclusivamente para testes e prototipagem rapida.
- **Persistencia em Producao (Supabase, SQLite, PostgreSQL)**: Fonte unica de verdade para ambientes operacionais.

Quando o Supabase ou banco remoto for definido para producao:

- Todas as operacoes DEVEM executar diretamente contra o banco oficial.
- Se um registro nao existe, o resultado DEVE ser nulo ou ausente conforme o contrato.
- Nunca criar seeders automaticos que recriam dados sem solicitacao expressa do usuario.

---

## 9. Sem Dados Mockados em Producao

Nunca introduzir dados de producao mockados para compensar registros ausentes no banco oficial.

Test fixtures DEVEM permanecer isolados dos fluxos de producao.

Se dados de producao necessarios estao ausentes, tratar o caso de dados ausentes explicitamente e com seguranca.

---

## 10. Seguranca Absoluta de Credenciais

Nunca hardcodar credenciais no codigo-fonte.

Proibido: tokens do Discord, chaves de API, senhas, chaves privadas, credenciais de banco ou segredos de webhook em qualquer arquivo fonte.

Nunca usar fallbacks hardcodados como `process.env.KEY || 'secret_key'`.

Todas as credenciais DEVEM ser lidas atraves de `process.env`.

Se uma variavel de ambiente necessaria estiver ausente, a aplicacao DEVE lancar um erro explicito identificando a variavel ausente.

---

## 11. Zero Comentarios no Codigo

Nunca adicionar comentarios ao codigo-fonte do projeto.

Proibido: `//`, `/* ... */`, JSDoc, anotacoes inline, comentarios TODO, codigo comentado, comentarios de documentacao dentro de arquivos de codigo.

Arquivos fonte DEVEM conter apenas codigo executavel ou declarativo.

---

## 12. Tratamento de Erros e Integridade de Dados

Nunca ocultar erros que afetam integridade de dados, pagamentos, pedidos, saldos, saques, entregas ou autenticacao.

Nunca converter uma operacao de banco de dados com falha em uma resposta de aparencia bem-sucedida.

Nunca confirmar pagamento, entrega, saque, compra ou mutacao de banco de dados a menos que a operacao subjacente tenha de fato sido bem-sucedida.

---

<div align="center">

<sub>Professional Discord Bot Skills | PT-BR | Antigravity IDE</sub>

</div>
