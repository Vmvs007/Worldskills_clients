# Clients — WorldSkills Mobile

**Guia de execução, desenvolvimento e continuação com agentes | Flutter / Dart**

Projeto independente de estudo inspirado no Módulo 1 — Implementação do Design, da profissão 08 — Desenvolvimento de Aplicações para Dispositivos Móveis, WorldSkills Portugal Centro 2027. Este repositório permite clonar e executar a aplicação existente, compreender o seu estado e continuar a implementação de forma incremental com o Codex ou manualmente.

> **Estado verificado no GitHub em 17/11/2026:** o projeto Flutter **já foi criado** em `clients/`. Existem o ponto de entrada, o tema, os ficheiros da fonte Inter e um teste de arranque. O ecrã inicial mostra apenas o título **Clientes**; a lista completa e o CRUD **ainda não estão implementados**. Não é necessário executar `flutter create` nem repetir o Prompt 01.
>
> **Uso permitido:** treino e demonstração fora da competição. O guia oficial da Fase 2 proíbe o uso de IA durante a competição. Este projeto não é oficial nem endossado pela WorldSkills Portugal.

## 1. Executar a aplicação em poucos minutos

### Pré-requisitos

- Git.
- Flutter SDK compatível com o projeto (o `pubspec.yaml` requer Dart `^3.14.0`; o `clients/README.md` refere Flutter 3.50.0 / Dart 3.14.0 como ambiente usado anteriormente).
- Android Studio, Android SDK e um emulador Android **ou** um dispositivo Android físico com depuração USB ativada.
- VS Code com extensões Dart e Flutter (recomendado) ou Android Studio.
- Codex é **opcional**: necessário apenas se quiseres continuar o desenvolvimento com agentes.

> A plataforma Android está configurada no repositório. Não assumas que iOS, web e desktop estão preparados.

### Passo 1 — Clonar o repositório

No PowerShell, terminal do VS Code ou terminal do sistema:

```bash
git clone https://github.com/Vmvs007/Worldskills_clients.git
cd Worldskills_clients/clients
```

**Importante:** todos os comandos Flutter devem ser executados dentro de `clients/`, porque é aí que se encontra `pubspec.yaml`. A raiz do repositório contém a documentação e as instruções dos agentes.

### Passo 2 — Confirmar o ambiente e instalar dependências

```bash
flutter --version
flutter doctor -v
flutter pub get
flutter devices
```

Se o Android SDK ou as licenças estiverem por configurar, instala os componentes em falta no Android Studio e, quando necessário:

```bash
flutter doctor --android-licenses
```

Espera até o emulador/dispositivo aparecer em `flutter devices`.

### Passo 3 — Preparar o dispositivo Android

**Emulador:** abre Android Studio → Device Manager, cria ou seleciona um dispositivo virtual e inicia-o. Em alternativa:

```bash
flutter emulators
flutter emulators --launch ID_DO_EMULADOR
```

**Telemóvel físico:** ativa Opções de Programador → Depuração USB, liga-o ao computador, autoriza o acesso e verifica com `flutter devices`.

### Passo 4 — Executar

```bash
flutter run
```

Para escolher um dispositivo específico:

```bash
flutter run -d ID_DO_DISPOSITIVO
```

No terminal do Flutter, `r` faz *hot reload*, `R` faz *hot restart* e `q` encerra a aplicação.

**Resultado esperado na versão atual:** uma janela Android com cabeçalho branco, título **Clientes** e fundo azul-acinzentado, usando a tipografia Inter. A ausência de cartões, formulários e navegação é esperada: são as próximas tarefas, não uma falha da instalação.

## 2. Executar e depurar no VS Code

Existem dois modos de trabalho:

1. **Desenvolvimento com Codex:** abre a **raiz `Worldskills_clients/`** no VS Code para o agente poder ler `AGENTS.md`, `PROMPTS_DIA_01.md` e a checklist; no terminal integrado, executa `cd clients` antes de usar Flutter.
2. **Execução/depuração com F5:** abre `Worldskills_clients/clients/` como projeto Flutter, seleciona o emulador ou o telemóvel na barra de estado e pressiona **F5**. O ponto de entrada é `lib/main.dart`.

Não recries o projeto ao alternar entre estas duas formas.

## 3. Validar, testar e gerar o APK

Dentro de `clients/`, corre:

```bash
flutter pub get
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
```

Se a verificação de formatação falhar, executa `dart format lib test` e repete a validação. O teste atual (`test/app_smoke_test.dart`) verifica o arranque do ecrã **Clientes**, o tema e a presença das fontes Inter. **Ainda não comprova os fluxos CRUD**, porque estes não existem no código atual.

Para gerar um APK de teste:

```bash
flutter build apk --debug
```

O ficheiro, caso a compilação termine com sucesso, fica normalmente em:

```text
clients/build/app/outputs/flutter-apk/app-debug.apk
```

A partir de `clients/`, podes instalar num dispositivo ligado com:

```bash
flutter install -d ID_DO_DISPOSITIVO
```

Ou com Android Debug Bridge:

```bash
adb devices
adb install -r build/app/outputs/flutter-apk/app-debug.apk
```

Este APK é uma versão **debug**, não um pacote assinado para distribuição em produção. O README da pasta `clients/` refere uma compilação e instalação anteriores no emulador, mas os testes **não foram reexecutados** durante esta revisão da documentação.

## 4. Resolver problemas frequentes

| Sintoma | Verificação / solução |
| --- | --- |
| `flutter` não reconhecido | Instala Flutter, adiciona `flutter/bin` ao PATH e reabre o terminal. |
| `No pubspec.yaml file found` | Estás provavelmente na raiz: executa `cd clients`. |
| `No devices found` | Inicia um emulador no Device Manager ou autoriza a depuração USB no telemóvel; confirma em `flutter devices`. |
| Falta Android SDK ou licenças | Consulta `flutter doctor -v`, instala os componentes em falta e executa `flutter doctor --android-licenses`. |
| `flutter pub get` falha | Confirma acesso à rede, proxy e versão do SDK; lê o erro concreto antes de alterar dependências. |
| Falha de Gradle/JDK | Identifica a primeira mensagem de erro e verifica Android SDK, JDK e Gradle. Não atualizes tudo indiscriminadamente. |
| Alterações não aparecem | Usa `r` (*hot reload*) ou `R` (*hot restart*). |
| Só aparece «Clientes» | **É o comportamento esperado nesta fase inicial.** |

## 5. Estrutura atual do repositório

Estrutura confirmada no GitHub (17/11/2026):

```text
Worldskills_clients/
├── .gitignore
├── AGENTS.md
├── PROMPTS_DIA_01.md
├── README.md                         ← este guia
├── docs/
│   └── CHECKLIST_DIA_01.md
└── clients/                          ← aplicação Flutter
    ├── pubspec.yaml
    ├── pubspec.lock
    ├── android/
    ├── assets/fonts/                 ← fonte Inter e licença
    ├── lib/
    │   ├── main.dart
    │   ├── app.dart
    │   ├── core/theme/
    │   │   ├── app_theme.dart
    │   │   └── design_tokens.dart
    │   └── features/clients/presentation/screens/
    │       └── clients_list_screen.dart
    └── test/
        └── app_smoke_test.dart
```

### O que já existe e o que falta

| Área | Estado |
| --- | --- |
| Projeto Flutter e Android | **Criado** |
| Tema, tokens e fontes Inter | **Criados**; afinação visual pendente |
| Ecrã «Clientes» | **Esqueleto**, apenas cabeçalho |
| Teste de arranque | **Existe**; correr localmente para confirmar |
| Modelo de cliente e `MemoryClientRepository` | **Pendente** |
| Lista alfabética, cartões, pesquisa visível, botão Adicionar | **Pendente** |
| Formulário de Novo Cliente | **Pendente** |
| Detalhe e botão Ligar para o Cliente | **Pendente** |
| Editar e guardar alterações | **Pendente** |
| Modal de eliminação | **Pendente** |
| Integração com API e pesquisa remota | **Módulo 2 — fora do âmbito atual** |

## 6. Continuar o desenvolvimento com Codex

O repositório já inclui um [contrato de trabalho para agentes](AGENTS.md), um [plano de prompts por etapas](PROMPTS_DIA_01.md) e uma [checklist de aceitação](docs/CHECKLIST_DIA_01.md). **Não repitas o Prompt 01**, porque o projeto já foi inicializado. **O passo previsto é o Prompt 02**, após o agente confirmar o estado do código.

### Preparação

1. Abre a **raiz do repositório** no VS Code e inicia o Codex.
2. As referências visuais autorizadas podem ser colocadas numa pasta local `referencias/`, que deve permanecer fora dos commits.
3. Pede primeiro ao agente uma **auditoria de retoma** com o prompt abaixo.
4. Só depois executa, **um de cada vez**, os prompts seguintes de `PROMPTS_DIA_01.md`.
5. Ao terminar cada etapa, verifica o código e executa `flutter analyze`, `flutter test` e, quando possível, `flutter run`.

### Prompt de retoma — copiar para o Codex

```text
Quero continuar o desenvolvimento deste repositório Worldskills_clients
sem perder nem recriar o que já está implementado.

1. Lê integralmente AGENTS.md, PROMPTS_DIA_01.md, README.md e
   docs/CHECKLIST_DIA_01.md.
2. Inspeciona o código em clients/, pubspec.yaml, testes, git status
   e o histórico recente.
3. Separa claramente trabalho concluído, trabalho parcial e trabalho em falta.
4. Não executes flutter create nem repitas o Prompt 01. Não apagues código
   funcional nem alteres configurações sem justificação.
5. Verifica o ambiente local e tenta executar, a partir de clients/:
   flutter pub get, flutter analyze, flutter test e flutter devices.
6. Regista os resultados reais e qualquer bloqueio, sem inventar testes.
7. Propõe o próximo passo mínimo de acordo com PROMPTS_DIA_01.md;
   será provavelmente o Prompt 02 (modelo e repositório em memória).
8. Indica que ficheiros pretendes modificar e quais os critérios de aceitação.

Antes de alterar código, apresenta o relatório e o plano de retoma.
Não implementes o Módulo 2, nem faças commit/push sem autorização.
```

### Roadmap de implementação do Módulo 1

| Prompt | Entrega | Evidência mínima |
| --- | --- | --- |
| **02 — próximo** | Modelo `Client`, contrato `ClientRepository`, repositório em memória e dados fictícios | Testes de ordenação, agrupamento e CRUD local |
| **03** | Lista alfabética de clientes, cartões, avatar e botão Adicionar | Teste de widget e comparação visual |
| **04** | Novo Cliente e criação local | Registo novo aparece no grupo correto |
| **05** | Detalhe e ligação telefónica | Cliente correto e ação testada no dispositivo |
| **06** | Editar Cliente | Dados pré-preenchidos e refletidos no detalhe/lista |
| **07** | Modal Eliminar Cliente | Cancelar preserva; Confirmar elimina e regressa à lista |
| **08** | Auditoria de fidelidade dos cinco estados visuais | Screenshots do emulador comparados com referências autorizadas |
| **09** | Testes de aceitação, correção e compilação | `flutter analyze`, `flutter test` e APK debug se possível |
| **10** | Documentação e revisão do repositório | Checklist atualizada com evidências reais |

**Regra de ouro:** o Codex deve terminar cada etapa com um resumo de alterações, ficheiros modificados, testes efetivamente executados e respetivos resultados, limitações e próxima etapa recomendada. A API real não pertence a este primeiro módulo.

## 7. Preparar a evolução para o Módulo 2

O Módulo 1 pretende criar a interface e uma demonstração local com **dados fictícios em memória**. Os dados locais não representam armazenamento permanente: podem ser repostos ao reiniciar a app. A arquitetura prevista separa apresentação, domínio e dados:

```text
Widgets / Screens
      ↓
Controller / Estado
      ↓
ClientRepository (contrato)
      ↓
MemoryClientRepository (Módulo 1)
      ↓ futuramente
ApiClientRepository (Módulo 2)
```

No Módulo 2, a intenção é integrar a API documentada na prova, adicionar estados de carregamento/erro e ligar a pesquisa e as operações CRUD aos endpoints. **Não inventar endpoints, credenciais, modelos JSON nem assumir que a API está pronta antes de consultar a documentação válida.** O Módulo 3 deve ser tratado separadamente.

## 8. Git e GitHub: publicar novas etapas

**Este repositório já está criado e público.** Não executes `git init` nem `gh repo create` novamente.

Na **raiz** do repositório, antes de iniciar uma nova etapa:

```bash
git pull origin main
git status
git switch -c feat/modulo-1-crud-local
```

Após terminar e verificar a implementação do Prompt 02, por exemplo:

```bash
git status
git diff
git add clients/ docs/CHECKLIST_DIA_01.md
git diff --cached
git commit -m "feat: implementar modelo e repositorio local de clientes"
git push -u origin feat/modulo-1-crud-local
```

Abre então um **Pull Request** no GitHub para integrar a branch em `main`, após revisão. Adapta a mensagem de commit à funcionalidade realmente desenvolvida; não publiques código incompleto como se estivesse concluído.

### Continuar noutro computador

```bash
git clone https://github.com/Vmvs007/Worldskills_clients.git
cd Worldskills_clients
# Se precisares de uma branch de trabalho, seleciona-a após git fetch.
cd clients
flutter pub get
flutter run
```

## 9. Privacidade e contexto de utilização

- Usa dados de demonstração fictícios. Nunca publiques chaves, tokens, passwords ou dados pessoais.
- Antes de cada push, verifica `git status` e `git diff --cached`.
- Não publiques PDFs oficiais, grelhas de avaliação e imagens de prova sem autorização; conserva referências privadas em pasta local ignorada pelo Git.
- A utilização de IA descrita neste repositório é **exclusivamente para estudo fora da competição**; não deve ser aplicada durante a prova oficial.

---

**Executar agora:** `git clone` → `cd Worldskills_clients/clients` → `flutter pub get` → `flutter run`.

**Desenvolver a seguir:** abrir a **raiz** no Codex → usar o **Prompt de retoma** acima → avançar para o **Prompt 02** depois de verificar o estado real.
