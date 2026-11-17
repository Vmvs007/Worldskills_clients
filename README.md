# Clients — Guia de desenvolvimento com agentes (Dia 1)

**WorldSkills Portugal Centro 2027 · Profissão 08 — Desenvolvimento de Aplicações para Dispositivos Móveis**

Este repositório é um **kit independente de estudo e desenvolvimento** para uma implementação Flutter do **Módulo 1 — Implementação do Design**, a partir de requisitos e de screenshots fornecidos pelo proprietário. **Não contém a solução Flutter final**: contém o contrato de trabalho do agente, prompts por etapas e uma checklist para produzir a aplicação com Codex.

**Importante:** o Guia de Prova da Fase 2 proíbe expressamente a utilização de ferramentas de IA durante a competição. O conteúdo aqui apresentado serve exclusivamente para **treino/demonstração fora da prova**. Não é um projeto oficial nem é endossado pela WorldSkills Portugal.

## O que existe neste kit

```text
AGENTS.md                        regras obrigatórias para o agente
PROMPTS_DIA_01.md                11 prompts sequenciais (00 a 10) + auditoria/retoma
docs/CHECKLIST_DIA_01.md         verificação funcional e visual
.gitignore                       exclusão de referências e material privado
clients/                         pasta Flutter que o Codex criará no Prompt 01
referencias/                     pasta LOCAL, ignorada por Git, com o enunciado/screenshot
```

## Âmbito funcional do Dia 1

1. **Clientes:** listagem alfabética agrupada, cartões com inicial, nome, email, pesquisa visível e botão `Adicionar`.
2. **Novo Cliente:** formulário Nome Completo, Email e Telemóvel / Contacto, com botão `Criar Cliente`.
3. **Detalhe:** avatar, dados de contacto, ação `Ligar para o Cliente`, botão `Editar Perfil` e opção de eliminar.
4. **Eliminar Cliente:** diálogo de confirmação com `Cancelar` e `Confirmar`.
5. **Editar Cliente:** dados pré-preenchidos, `Guardar Alterações` e atualização da UI.

A demonstração do primeiro módulo usa um repositório em memória com registos fictícios. A estrutura do código prepara uma integração futura com API, mas **não a implementa antecipadamente**. As operações CRUD locais proporcionam uma demo navegável e testável; não substituem a integração exigida no Módulo 2.

## Como usar com Codex / VS Code

1. Cria um repositório Git **privado** inicialmente e coloca os ficheiros deste kit na raiz.
2. Instala Flutter, Dart, o Android SDK e configura um emulador Android.
3. Guarda localmente os elementos de referência autorizados em `referencias/`; este diretório não será publicado.
4. Abre a raiz do repositório no Codex. Solicita primeiro o **Prompt 00** de `PROMPTS_DIA_01.md`.
5. Depois da análise, executa um prompt de cada vez, revendo o código, os testes e a correspondência aos screenshots.
6. Quando o Prompt 01 tiver criado `clients/`, executa:

```bash
cd clients
flutter pub get
flutter analyze
flutter test
flutter run
```

Para compilar um APK de debug, depois de teres um Android SDK configurado:

```bash
cd clients
flutter build apk --debug
```

A localização habitual do APK de debug é `clients/build/app/outputs/flutter-apk/app-debug.apk`. Confirmar que o comando terminou com sucesso; este kit **não contém APK nem código compilado**.

## Publicação no GitHub

No terminal, a partir da raiz do projeto:

```bash
git init
git add AGENTS.md PROMPTS_DIA_01.md README.md docs .gitignore
git commit -m "docs: preparar workflow Flutter do modulo 1"
```

Após gerar a aplicação e validar o estado do Git:

```bash
git add clients/
git commit -m "feat: implementar clients Flutter modulo 1"
```

Com GitHub CLI (`gh`) instalado e sessão autenticada, uma opção é começar de forma **privada**:

```bash
gh repo create worldskills-mobile-clients-estudo --private --source=. --remote=origin --push
```

**Não alterar para público antes de confirmar a autorização para publicar o material relevante** e garantir que não existem ficheiros oficiais, dados pessoais, segredos ou conteúdo não autorizado no histórico do Git. A disponibilização deste kit não implica qualquer permissão para usar IA durante a prova.

## Regras de colaboração

- O agente respeita integralmente `AGENTS.md`.
- O desenvolvimento segue `PROMPTS_DIA_01.md`, sem saltar a validação.
- Cada etapa termina com resumo, ficheiros alterados, testes executados, evidências e limitações.
- Nunca afirmar que o projeto funciona sem executar testes ou abrir a aplicação.
- Se os screenshots não estiverem acessíveis ao Codex, solicitar que o utilizador os coloque em `referencias/`, sem inventar dimensões ou fidelidade visual.

## Evolução futura

- **Módulo 2:** substituição do `MemoryClientRepository` por `ApiClientRepository`, pesquisa remota, estados de carregamento e erros. Exige documentação de API verificada.
- **Módulo 3:** desenvolvimento separado de um Jogo da Velha para dois jogadores.

## Proveniência

Fluxo pedagógico preparado a partir do material de prova que o proprietário disponibilizou para análise. Os PDFs, a grelha oficial e as capturas originais não integram este pacote. Este material não substitui as regras oficiais nem confere autorização para divulgar documentos da competição.
