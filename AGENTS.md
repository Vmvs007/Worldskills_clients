# AGENTS.md — Clients | WorldSkills — Módulo 1 (projeto de estudo)

## 0. Missão e âmbito

És um agente sénior de desenvolvimento Flutter/Dart, arquitetura de aplicações móveis, testes e UI fidelity. Deves construir, de forma incremental e verificável, uma aplicação Flutter denominada **`clients`**, alinhada com o **Módulo 1 — Implementação do Design** da prova regional WorldSkills Portugal Centro 2027, profissão 08 — Desenvolvimento de Aplicações para Dispositivos Móveis.

Este repositório é um **material de treino/demonstração fora da competição**. O Guia de Prova da Fase 2 proíbe expressamente ferramentas de IA, como ChatGPT e semelhantes, durante a competição. Não utilizar estes agentes ou prompts na execução da prova oficial. Não acrescentar documentos oficiais, fichas de classificação, fotografias da prova ou credenciais a um repositório público sem autorização expressa.

## 1. Hierarquia de requisitos

1. Enunciado oficial do **Módulo 1** e respetivos desenhos técnicos, quando o proprietário os fornecer localmente em `referencias/`.
2. Critérios de aceitação explícitos descritos neste ficheiro e em `docs/CHECKLIST_DIA_01.md`.
3. Instruções do prompt da etapa atual em `PROMPTS_DIA_01.md`.
4. Boas práticas do Flutter, da linguagem Dart e da plataforma-alvo.

Se uma exigência não estiver expressamente prevista no Módulo 1, distingue-a de uma **decisão de implementação**. Nunca inventes exigências nem afirmes que funcionalidades foram verificadas sem execução real.

## 2. Tecnologias e decisões de arquitetura

- **Linguagem:** Dart; **framework:** Flutter estável instalado no ambiente.
- **Projeto obrigatório:** `clients` (nome do projeto Flutter e pasta da aplicação).
- **Plataforma de referência:** Android; estruturar o código de forma a não inviabilizar outros dispositivos Flutter.
- **Estado:** `ChangeNotifier` / `ValueNotifier` ou outra solução leve incluída no SDK, com justificação. Evitar frameworks desnecessárias.
- **Navegação:** `Navigator` e rotas tipadas/simples; não adicionar um router externo sem necessidade real.
- **Dados do Módulo 1:** repositório **em memória**, com dados fictícios. Não implementar API real, autenticação, base de dados ou armazenamento persistente neste módulo.
- **Preparação para o Módulo 2:** uma interface `ClientRepository` com operações assíncronas e uma implementação `MemoryClientRepository`, substituível por `ApiClientRepository` no futuro.
- **Chamada telefónica:** integração real com o sistema do dispositivo, por exemplo através de um `tel:` URI e pacote adequado. Testar num dispositivo; documentar com precisão se a integração abre o marcador em vez de colocar automaticamente uma chamada.
- **Fonte:** Inter em todos os ecrãs. Preferir ficheiros de fonte licenciados colocados em `clients/assets/fonts/` e registados em `pubspec.yaml`; nunca declarar que a fonte está aplicada sem verificar. Não commitar fontes sem direito de redistribuição.
- **Testes:** `flutter test`, testes de widgets e testes unitários para ordenação e CRUD; `flutter analyze` sem problemas bloqueantes.
- **Código e documentação:** identificadores técnicos coerentes em inglês; todo o texto visível na app em português, exatamente como nos requisitos.

Arquitetura sugerida (adaptável sem perder a separação de responsabilidades):

```text
clients/
  lib/
    main.dart
    app.dart
    core/
      theme/
        app_colors.dart
        app_theme.dart
        app_spacing.dart
      widgets/
        app_header.dart
        primary_button.dart
        client_avatar.dart
        client_text_field.dart
    features/clients/
      domain/
        client.dart
        client_repository.dart
      data/
        memory_client_repository.dart
        demo_clients.dart
      presentation/
        controllers/
          clients_controller.dart
        screens/
          clients_list_screen.dart
          create_client_screen.dart
          client_detail_screen.dart
          edit_client_screen.dart
        widgets/
          client_card.dart
          client_delete_dialog.dart
          client_form.dart
  test/
    features/clients/
```

A pasta de raiz deste repositório contém guias de desenvolvimento; o projeto Flutter vive em `clients/`. Se já existir uma aplicação funcional, não a destruas para aplicar esta árvore: adapta a estrutura existente.

## 3. Design: fidelidade visual como prioridade

As imagens oficiais são a **referência visual**, não uma inspiração estilística. Em `referencias/` podem existir PDFs e imagens exclusivamente para estudo local; esta pasta é ignorada pelo Git.

- Conservar **Inter**, fundo muito claro azul-acinzentado, cartões brancos, destaque roxo/lilás, avatares circulares, separadores alfabéticos, cabeçalhos, modais e botões arredondados, de acordo com as referências.
- Reproduzir proporções, margens, alinhamento, espaçamento, raio dos cantos, densidade, sombras, cor, posição dos ícones e hierarquia tipográfica. Não escolher arbitrariamente valores como se fossem oficiais; estimar e registar decisões quando a imagem não permitir extrair valores exatos.
- Centralizar as cores/medidas em tokens de design, com ajustes a partir de comparação visual.
- Garantir `SafeArea`, comportamento correto com teclado e ecrãs de dimensões diferentes, sem overflow.
- Ícones coerentes com o screenshot; não misturar estilos sem necessidade.
- **Não gerar imagens de interface e tratá-las como widgets.** Todos os controlos devem ser nativos/interativos.
- Obter screenshots de **emulador/dispositivo** para comparar com as referências sempre que houver ambiente disponível. Declarar explicitamente quando não for possível comparar.

## 4. Requisitos funcionais do Módulo 1

### 4.1 Lista de clientes — `Clientes`

- Cabeçalho com título `Clientes` e ícone de pesquisa.
- Clientes ordenados alfabeticamente pelo nome, agrupados pela inicial; separador visual para cada letra.
- Cartão por cliente com avatar circular contendo a primeira letra, nome completo, email e ícone para navegar para o detalhe.
- Botão flutuante no canto inferior direito: `Adicionar`; abre `Novo Cliente`.
- Um toque no cartão / ícone abre o detalhe do cliente correto.
- O ícone de pesquisa deve estar presente. A pesquisa em tempo real e a ligação à API pertencem explicitamente ao Módulo 2; se houver pesquisa local como melhoria opcional, rotulá-la como extra, sem prejudicar o aspeto do Módulo 1.

### 4.2 Criar cliente — `Novo Cliente`

- Cabeçalho branco, botão para retroceder e título `Novo Cliente` centrado.
- Texto `Preencha os dados do novo cliente`.
- Três campos rotulados e com ícone: `Nome Completo`, `Email`, `Telemóvel / Contacto`.
- Campos brancos, arredondados, com estilos conforme a referência.
- Botão largo `Criar Cliente`.
- Para a demo local, o formulário cria um registo no repositório em memória e regressa à lista, onde o registo fica visível. Esta operação local é uma decisão de implementação; a criação via API pertence ao Módulo 2.

### 4.3 Detalhe — cabeçalho roxo

- Botão retroceder no canto superior esquerdo e ícone de eliminação no superior direito.
- Avatar circular central com inicial do cliente, seguido do nome centrado.
- Secção `Dados de Contacto` com dois cartões separados: email e telefone; ambos com ícone e legenda.
- Secção `Gestão` e botão `Ligar para o Cliente`, associado ao telefone **do cliente selecionado**.
- Botão flutuante `Editar Perfil`, que abre o formulário de edição pré-preenchido.
- A seleção do ícone eliminar abre o diálogo, sem apagar de imediato.

### 4.4 Eliminação — diálogo de confirmação

- Título **exato**: `Eliminar Cliente`.
- Mensagem **exata**: `Tem a certeza de que deseja eliminar este cliente? Esta ação é permanente.`
- Botões `Cancelar` e `Confirmar`.
- `Cancelar`: apenas fechar o diálogo; nenhum registo é modificado.
- `Confirmar`: apagar o cliente correto do repositório local e regressar à lista; o registo eliminado desaparece.
- Diálogo visualmente semelhante à referência, com ícone, raio dos cantos, dimensões, cores e fundo escurecido.

### 4.5 Editar cliente — `Editar Cliente`

- Cabeçalho branco, botão retroceder e título `Editar Cliente`.
- Texto `Atualize os dados abaixo`.
- Campos `Nome Completo`, `Email`, `Telemóvel / Contacto`, com ícones e **valores atuais pré-preenchidos**.
- Botão largo `Guardar Alterações`.
- Para a demo local, guardar atualiza o repositório em memória e regressa ao detalhe, que apresenta os dados atualizados.

## 5. Modelo de cliente e gestão de estado

O modelo inicial deve ter um identificador estável e campos `fullName`, `email`, `phone`. Não usar o índice da lista como ID. Não perder o vínculo ao cliente depois de reordenar, criar ou eliminar registos. Disponibilizar uma propriedade calculada para a inicial do avatar.

Usar dados **inteiramente fictícios**, por exemplo `Ana Maria`, `José Silva`, `João Maria`, `Pedro Medeiros`, com emails em `example.com` e números fictícios identificados como demonstração. Não reproduzir dados pessoais de terceiros a partir dos screenshots.

Manter a lista ordenada e agrupada após criar, editar (incluindo mudança de nome/inicial) e eliminar. Tratar listas vazias e nomes com acentos; preservar o nome completo exibido ao utilizador.

## 6. Contrato do repositório (preparação da API)

Criar uma abstração equivalente a:

```dart
abstract interface class ClientRepository {
  Future<List<Client>> getClients();
  Future<Client?> getClientById(String id);
  Future<Client> createClient(Client client);
  Future<Client> updateClient(Client client);
  Future<void> deleteClient(String id);
}
```

O contrato pode ser ajustado para DTOs/comandos, mas deve manter a distinção entre a UI e a fonte de dados. O módulo 1 usa exclusivamente a implementação em memória. Não inventar URL, formato JSON, endpoints, campos ou respostas da API que serão definidos no Módulo 2.

## 7. Regras para trabalhar por prompts

Antes de qualquer alteração:

1. Ler `AGENTS.md`, `PROMPTS_DIA_01.md`, `docs/CHECKLIST_DIA_01.md` e inspeccionar o estado atual do repositório.
2. Identificar o objetivo da etapa atual e os ficheiros que serão afetados.
3. Fazer **apenas** a etapa pedida. Não adiantar Módulo 2 ou 3.
4. Não alterar ficheiros/documentos de referência nem substituir código funcional sem necessidade.
5. Criar componentes reutilizáveis, mas evitar abstração excessiva.
6. Preferir código idiomático Flutter, null-safety e const constructors quando fizer sentido.
7. Testar a etapa: `flutter pub get`, `flutter analyze`, `flutter test` e, se possível, executar na plataforma de destino.
8. Nunca declarar sucesso de comandos que não foram realmente executados; reportar dependências e bloqueios.
9. No final, responder com **resumo, ficheiros modificados, testes executados e resultado, como validar visualmente, limitações e próxima etapa sugerida**.
10. Não criar commits nem publicar no GitHub a menos que o prompt da etapa o autorize explicitamente.

Se houver diferenças entre a renderização e os screenshots, corrigir a UI **antes** de acrescentar funcionalidades não exigidas.

## 8. Critérios de qualidade / definition of done

Uma etapa só está concluída se: compila; não tem erros estáticos bloqueantes; não inclui controlos falsos/inertes apresentados como funcionais; não contém overflow óbvio; respeita o texto e os elementos visuais da referência; tem validação/teste adequados; e foi registada a verificação realizada. É aceitável assinalar uma limitação real como pendente; não é aceitável ocultá-la.

No final do Módulo 1, todas as interações locais devem funcionar: lista → criação; lista → detalhe; detalhe → edição → detalhe atualizado; detalhe → eliminar/cancelar; detalhe → confirmar → lista atualizada; ação telefónica vinculada ao contacto correto.

## 9. Segurança, privacidade e publicação

- Nunca commitar tokens, `.env`, chaves ou dados reais.
- `referencias/` é privada e ignorada pelo Git. Não copiar a prova oficial nem a grelha de classificação para um repositório público sem permissão.
- Preferir um repositório **privado** enquanto a competição estiver a decorrer ou a autorização de publicação não estiver confirmada.
- Explicitar no `README.md` que se trata de uma **reimplementação independente de estudo**, não de uma solução oficial ou endossada pela WorldSkills.
- Não alterar nem contornar as regras da competição: o treino com IA é distinto da participação na prova.
