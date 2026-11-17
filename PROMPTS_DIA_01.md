# Fluxo de prompts para Codex — Dia 1 / Módulo 1

> **Uso permitido:** preparação/estudo fora da competição. O Guia de Prova da Fase 2 proíbe utilização de IA durante a competição oficial. Este fluxo não pode ser executado por concorrentes durante a prova.

## Preparação

1. Abre a pasta deste repositório no VS Code/Codex.
2. Instala e verifica Flutter, Dart, Android SDK e um emulador/dispositivo Android.
3. Coloca **apenas localmente**, em `referencias/`, uma cópia autorizada do PDF da prova e/ou screenshots das páginas do Módulo 1. A pasta é ignorada pelo Git.
4. Não publiques o PDF, a grelha oficial nem as capturas sem autorização da organização.
5. Executa **um prompt de cada vez**. Analisa o resultado e valida a aplicação antes do seguinte.

**Fonte visual:** Módulo 1 do PDF da prova, páginas 6–9 do ficheiro (páginas impressas 5–8). Há cinco estados visuais: lista, novo cliente, detalhe, modal de eliminação e editar cliente. A imagem do modal está no mesmo conjunto do detalhe.

---

## Prompt 00 — Análise de requisitos e planeamento (sem código)

```text
Lê integralmente o AGENTS.md e o CHECKLIST_DIA_01.md deste repositório.
Analisa as referências do Módulo 1 disponíveis localmente em referencias/,
incluindo as imagens dos cinco estados de interface. Não uses o Módulo 2
como autorização para implementar APIs agora.

Antes de programar, entrega:
1. Matriz de requisitos: ecrã/elemento, comportamento, referência visual,
   estado obrigatório ou opcional, e forma de validação.
2. Proposta de árvore de pastas Flutter e responsabilidades dos componentes.
3. Tokens de design preliminares (cores, espaçamentos, raios, tipografia,
   dimensões) extraídos ou estimados das referências. Marca estimativas.
4. Estratégia de mock de dados, repositório e navegação preparada para API.
5. Riscos, dependências técnicas e sequência mínima de implementação.

Não alteres ficheiros de código. Se não conseguires inspecionar imagens,
assinala explicitamente a limitação e não inventes medidas exatas.
```

**Aceitação:** há um plano concreto, sem API nem jogo, com critérios claros de comparação visual.

## Prompt 01 — Bootstrap do projeto Flutter

```text
Usando AGENTS.md e o plano aprovado, cria o projeto Flutter 'clients'
dentro da pasta clients/ (não alteres a raiz da documentação).

Implementa apenas:
- bootstrap funcional, tema global com tipografia Inter preparada;
- estrutura limpa por features/camadas;
- tokens de cor, tipografia, bordas, espaçamentos;
- entrypoint que abre o ecrã Clientes;
- teste smoke inicial que verifica o lançamento da aplicação;
- documentação mínima dos comandos de execução em README.md.

Antes de adicionar dependências, verifica a versão instalada do Flutter,
a compatibilidade das bibliotecas e a existência da fonte Inter legalmente
redistribuível ou a necessidade de a disponibilizar localmente.

Executa flutter pub get, flutter analyze e flutter test, caso o ambiente
permita. Reporta os resultados efetivos. Não implementes ainda CRUD.
```

**Aceitação:** aplicação arranca, estrutura organizada, tema e Inter verificados ou limitação documentada.

## Prompt 02 — Modelo e repositório em memória

```text
Implementa o domínio de clientes para o Módulo 1.

Cria:
- Client com ID estável, fullName, email, phone e inicial calculada;
- contrato ClientRepository com métodos assíncronos para listar, obter,
  criar, atualizar e eliminar;
- MemoryClientRepository sem rede, com dados de demonstração fictícios;
- controller/estado testável para manter lista e detalhe atualizados;
- funções de ordenação alfabética e agrupamento por inicial;
- tratamento de clientes vazios, mudança de nome/inicial e acentos.

Usa apenas emails de example.com e números fictícios de teste. Não faças
qualquer pedido HTTP nem inventes API. Escreve testes unitários para
ordenação, agrupamento e operações CRUD no repositório.

No final, executa analyze/test, lista os ficheiros alterados e os testes.
```

**Aceitação:** testes CRUD e agrupamento passam, e a UI não depende de dados hardcoded diretamente em widgets.

## Prompt 03 — Ecrã da lista de clientes

```text
Implementa o ecrã 'Clientes' respeitando fielmente a imagem de referência:
- cabeçalho branco com título Clientes e ícone de pesquisa;
- fundo claro azul-acinzentado;
- secções separadas por letra inicial e ordenação correta;
- cartões brancos arredondados, avatar circular com inicial,
  nome completo, email e chevron de navegação;
- botão flutuante roxo 'Adicionar' no canto inferior direito;
- componentes adaptáveis a diferentes dimensões de ecrã.

Usa os dados do controller/repositório em memória, nunca um array diretamente
no build. O botão Adicionar pode navegar para uma rota provisória identificada,
que será implementada no próximo prompt. O ícone de pesquisa deve existir;
a pesquisa dinâmica é requisito do Módulo 2, não do Módulo 1.

Verifica numa resolução Android de referência e regista screenshot
(se existir emulador), dimensões e diferenças observadas. Acrescenta
um teste de widget para as secções e os cartões.
```

**Aceitação:** lista visualmente fiel, sem overflow, com nomes e grupos corretos.

## Prompt 04 — Ecrã de Novo Cliente

```text
Implementa a página 'Novo Cliente' conforme o screenshot:
- header branco, seta de voltar e título centrado;
- texto 'Preencha os dados do novo cliente';
- três inputs com rótulos e ícones: Nome Completo, Email,
  Telemóvel / Contacto;
- campos de fundo branco, bordas arredondadas, espaçamentos corretos;
- botão roxo largo 'Criar Cliente'.

Ligações: o botão Adicionar abre este ecrã; o botão voltar regressa sem criar;
a submissão válida cria um cliente no MemoryClientRepository e regressa
à lista, que deve mostrar o novo cliente no grupo alfabético correto.
Validações simples e razoáveis são decisões de implementação, não requisitos
inventados da prova. Garante teclado adequado e ausência de overflow.

Reutiliza ClientForm/ClientTextField, prepara a futura reutilização no editar.
Escreve testes de criação, volta sem criação e atualização da lista.
```

**Aceitação:** criar um nome com inicial nova gera o grupo certo; voltar não altera dados.

## Prompt 05 — Ecrã de detalhe do cliente

```text
Implementa o ecrã de detalhe do cliente selecionado:
- cabeçalho roxo com seta de retroceder e ícone de eliminar;
- avatar circular central com inicial e nome centrado abaixo;
- secção Dados de Contacto;
- cartão de email com legenda e ícone;
- cartão de telefone com legenda e ícone;
- secção Gestão, botão 'Ligar para o Cliente';
- botão flutuante roxo 'Editar Perfil' com ícone.

Navegação: tocar num cliente da lista abre o ID correto. Todos os valores
apresentados devem vir do repositório e nunca ser hardcoded.
O botão telefónico deve invocar a capacidade adequada do dispositivo com
o número do cliente (p. ex. URI tel:). Testa o comportamento possível e
documenta se abre o marcador em vez de efetuar diretamente uma chamada.

Os destinos Editar e Eliminar podem ser preparados para os próximos prompts,
mas não deixes ações silenciosamente inertes: usa navegação/feedback explícitos.
Compara o ecrã com a referência e cria testes de widget.
```

**Aceitação:** cliente correto, ícones, secções, botão de chamada e layout adequados.

## Prompt 06 — Ecrã Editar Cliente

```text
Implementa o ecrã 'Editar Cliente' reutilizando o formulário do Novo Cliente.

Requisitos visuais e textuais:
- header branco com voltar e título Editar Cliente;
- texto 'Atualize os dados abaixo';
- campos Nome Completo, Email e Telemóvel / Contacto com ícones;
- valores atuais pré-preenchidos;
- botão roxo largo 'Guardar Alterações'.

Ao clicar em Editar Perfil no detalhe, abrir este ecrã para o ID correto.
Ao guardar, atualizar MemoryClientRepository, regressar ao detalhe e
apresentar os novos valores; a lista também deve refletir a mudança,
incluindo eventuais alterações de grupo alfabético. Cancelar/voltar não
altera os dados. Testar ambos os percursos e a edição de nome/inicial.

Não integrar API.
```

**Aceitação:** edição persistente durante a sessão, sem criar cliente duplicado.

## Prompt 07 — Modal de eliminação + fluxo de remoção

```text
Implementa o modal de eliminação com a aparência da referência:
- fundo escurecido, caixa central arredondada e ícone ilustrativo;
- título exato 'Eliminar Cliente';
- mensagem exata 'Tem a certeza de que deseja eliminar este cliente? Esta ação é permanente.';
- botões 'Cancelar' e 'Confirmar' alinhados conforme a imagem.

Regras comportamentais obrigatórias:
- o modal abre apenas após clicar no ícone eliminar do detalhe;
- Cancelar fecha o modal sem alterar qualquer registo nem navegação;
- Confirmar elimina precisamente o ID selecionado;
- depois da eliminação, regressa à lista e o cliente deixa de aparecer;
- não deixar rotas de detalhe órfãs nem gerar erros ao voltar.

Adiciona testes de cancelamento, confirmação, contagem de registos e retorno
à lista. Ajusta cores/dimensões do diálogo segundo a referência.
```

**Aceitação:** cancelamento preserva registo, confirmação remove e navega corretamente.

## Prompt 08 — Auditoria visual rigorosa dos cinco estados

```text
Faz uma auditoria visual comparativa do Módulo 1.

Analisa os screenshots oficiais disponíveis em referencias/ e gera, se
houver emulador, screenshots reais para: lista, novo cliente, detalhe,
modal de eliminação e editar cliente, numa resolução de referência e
outra diferente. Compara lado a lado os cinco estados.

Verifica especificamente: tipografia Inter, tamanhos/hierarquia,
cores, fundo, alinhamento, paddings, espaçamentos, cartões, ícones,
raios, sombras, botões, cabeçalhos, modal e SafeArea.

Corrige as discrepâncias visíveis mantendo os fluxos funcionais. Não
alargues o âmbito à API. Documenta o que foi corrigido e as diferenças
que permaneceram por ausência de especificações mensuráveis.

Executa analyze/test após cada correção relevante.
```

**Aceitação:** relatório honesto de comparação visual, sem afirmar equivalência pixel-perfect sem evidências.

## Prompt 09 — Testes de aceitação e robustez

```text
Executa uma revisão funcional completa do Módulo 1 com base no AGENTS.md,
no CHECKLIST_DIA_01.md e nos requisitos originais.

Cenários obrigatórios:
1) lista ordenada com grupos por inicial;
2) criação e reaparecimento na lista no grupo correto;
3) navegação para o detalhe correto;
4) edição pre-preenchida e atualização de lista/detalhe;
5) Cancelar eliminação mantém cliente;
6) Confirmar eliminação remove cliente e retorna à lista;
7) Ligar para o Cliente usa o número correspondente;
8) formulários não causam overflow com teclado;
9) estados de lista vazia, mudança de inicial e dados inválidos;
10) disposição visual em, pelo menos, dois tamanhos de ecrã se possível.

Corrige defeitos encontrados. Executa flutter format, flutter analyze,
flutter test e, se disponível, flutter build apk --debug. Não afirmes que
um teste passou se não o executaste. Atualiza a checklist com evidências
reais e um resumo das limitações.
```

**Aceitação:** todos os percursos funcionais demonstrados; falhas restantes explícitas.

## Prompt 10 — README, Git e GitHub (fora da prova oficial)

```text
Prepara o repositório como projeto pedagógico independente.

Atualiza README.md com:
- objetivo e delimitação do Módulo 1;
- stack e requisitos para execução;
- instruções Flutter para instalar, correr, testar e gerar APK debug;
- descrição dos ecrãs e dos percursos de navegação;
- diferença entre mock local Módulo 1 e futura API Módulo 2;
- estrutura do projeto e notas de arquitetura;
- resultados reais de analyze/test/build e limitações;
- declaração de projeto de estudo, sem afiliação oficial;
- nota de que a competição proíbe a utilização de agentes/IA.

Revê .gitignore para excluir referencias/, PDFs originais, grelha de
classificação, ficheiros privados, chaves, capturas não autorizadas e
artefactos gerados. Não faças commit de dados pessoais reais ou conteúdos
oficiais protegidos. Só sugere tornar o repositório público após autorização
para publicar o material relevante e fora da competição.

Faz git status, enumera exatamente o que seria publicado e propõe uma
mensagem de commit. Não faças push, nem cries repositório remoto, sem
ordem explícita do utilizador.
```

**Aceitação:** repositório reproduzível, limpo e pronto para publicação autorizada.

---

## Prompt de supervisão rápida (usar após qualquer etapa)

```text
Faz uma auditoria limitada à última etapa: compara as alterações com o
AGENTS.md e os requisitos do Módulo 1; identifica bugs, divergências
visuais, componentes inertes, código desnecessário, violações de âmbito e
testes em falta. Corrige apenas problemas comprovados. Reexecuta os testes
possíveis e apresenta um relatório curto: Feito / Pendente / Evidência.
```

## Prompt de retoma (numa nova sessão do Codex)

```text
Lê AGENTS.md, PROMPTS_DIA_01.md, README.md e CHECKLIST_DIA_01.md;
inspeciona git status/log e a pasta clients/. Resume o estado real,
identifica a última etapa efetivamente concluída, os testes disponíveis
e as pendências. Não inventes progresso e não alteres ficheiros antes
de apresentar o plano de retoma. Vamos continuar pelo próximo prompt.
```

## Notas de sequência

- **00–02:** planeamento, infraestrutura, dados em memória.
- **03–07:** implementação dos ecrãs e operações locais.
- **08–09:** fidelidade visual, testes e correções.
- **10:** documentação, revisão de privacidade e preparação de GitHub.

A integração real da API, os indicadores de carregamento associados a chamadas HTTP e a pesquisa remota são tarefas do **Módulo 2**; o Jogo da Velha pertence ao **Módulo 3**.
