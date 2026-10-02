<div align="center">

<img src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0b5061df29d55a92d945_full_logo_blurple_RGB.svg" alt="Discord" width="200" />

<br />
<br />

# Regras da Skill

**Professional Discord Bot Skills · PT-BR**

</div>

---

## 1. Escrita e Pontuacao

Nunca utilize traco longo (em dash) ou traco medio (en dash) em qualquer mensagem, titulo, descricao, rodape, log ou copia de interface do bot.

Substitutos aceitos: barra vertical `|`, dois pontos `:`, parenteses `(...)` ou hifen simples `-`.

O agente SEMPRE pergunta ao usuario qual idioma usar antes de criar ou modificar texto do bot:

- Portugues Brasileiro (PT-BR)
- Ingles (English)

---

## 2. Design Visual e Components V2

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

## 3. Regras de Emoji

Nunca usar emojis Unicode em qualquer mensagem, titulo, botao, painel, embed, notificacao ou log.

Exemplos proibidos: `📦 💸 📝 🛒 ℹ️ 🚨 ⏱️ 📋`.

Usar apenas emojis Discord customizados no formato `<:name:id>` ou `<a:name:id>`.

Se um emoji customizado adequado nao estiver disponivel, omitir o emoji ao inves de substituir por Unicode.

---

## 4. Preservacao de Codigo e Anti-Regressao

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

## 5. Validacao e Compilacao Obrigatoria

Qualquer alteracao de codigo DEVE ser validada imediatamente apos a mudanca.

Executar `npm run build` apos cada modificacao de codigo.

O projeto DEVE compilar sem erros TypeScript antes de considerar a mudanca concluida.

Nao ocultar, suprimir, contornar ou ignorar erros do compilador.

---

## 6. Timing de Interacao e Prevencao de Timeout

Respeitar estritamente o limite de resposta de 3 segundos do Discord.

Usar `deferReply()` imediatamente para slash commands que realizam consultas ao banco de dados, requisicoes HTTP externas ou operacoes assincronas lentas.

Usar `deferUpdate()` imediatamente ao processar interacoes de componentes que podem exceder o tempo de resposta.

Apos diferir, usar a operacao correta de follow-up ou edicao para o ciclo de vida da interacao.

---

## 7. Supabase como Fonte Unica de Verdade

Nunca criar ou usar persistencia local como substituto para o Supabase.

Proibido: `local-db.json`, SQLite, arquivos de persistencia temporaria, estruturas em memoria para estado de aplicacao.

Todas as consultas, insercoes, atualizacoes e exclusoes DEVEM executar diretamente no banco de dados PostgreSQL oficial do Supabase.

Se um registro nao existe no Supabase, o resultado DEVE ser nulo, vazio ou ausente conforme o contrato da funcao.

Nunca criar seeders automaticos que detectam tabela vazia e recriam produtos, pedidos, carteiras, usuarios, configuracoes ou dados historicos.

---

## 8. Sem Dados Mockados em Producao

Nunca introduzir dados de producao mockados para compensar registros ausentes no Supabase.

Test fixtures DEVEM permanecer isolados dos fluxos de producao e NUNCA devem ser usados silenciosamente como fallbacks de producao.

Se dados de producao necessarios estao ausentes, tratar o caso de dados ausentes explicitamente e com seguranca.

---

## 9. Seguranca Absoluta de Credenciais

Nunca hardcodar credenciais no codigo-fonte.

Proibido: tokens do Discord, chaves de API, senhas, segredos, chaves privadas, credenciais do Supabase, credenciais de pagamento ou segredos de webhook em qualquer arquivo fonte.

Nunca usar fallbacks hardcodados como `process.env.KEY || 'secret_key'`.

Todas as credenciais DEVEM ser lidas atraves de `process.env`.

Se uma variavel de ambiente necessaria estiver ausente, a aplicacao DEVE lancar um erro explicito identificando a variavel ausente.

---

## 10. Zero Comentarios no Codigo

Nunca adicionar comentarios ao codigo-fonte do projeto.

Proibido: `//`, `/* ... */`, JSDoc, anotacoes inline, comentarios TODO, codigo comentado, comentarios de documentacao dentro de arquivos de codigo.

Arquivos fonte DEVEM conter apenas codigo executavel ou declarativo.

---

## 11. Selecao de Idioma para o Usuario

Mensagens do bot devem ser escritas em PT-BR ou Ingles.

SEMPRE perguntar ao usuario qual dos dois idiomas deve ser usado quando o idioma ainda nao foi estabelecido explicitamente para a tarefa atual.

Manter terminologia consistente em paineis, comandos, botoes, modais, erros, confirmacoes e logs.

---

## 12. Tratamento de Erros e Integridade de Dados

Nunca ocultar erros que afetam integridade de dados, pagamentos, pedidos, saldos, saques, entregas ou autenticacao.

Nunca converter uma operacao de banco de dados com falha em uma resposta de aparencia bem-sucedida.

Nunca confirmar pagamento, entrega, saque, compra ou mutacao de banco de dados a menos que a operacao subjacente tenha de fato sido bem-sucedida.

---

<div align="center">

<sub>Professional Discord Bot Skills · PT-BR · Antigravity IDE</sub>

</div>
