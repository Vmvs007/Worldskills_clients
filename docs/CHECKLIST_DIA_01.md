# Checklist de aceitação — Dia 1 / Módulo 1

Este documento é uma **checklist pedagógica de desenvolvimento**, não a grelha oficial de classificação. É baseada no enunciado do Módulo 1, nos screenshots e numa seleção de critérios de verificação técnica. Os campos `Estado` e `Evidência` devem ser atualizados apenas após testes reais.

Legenda: `[ ]` pendente · `[x]` validado.

## Preparação e arquitetura

- [ ] Projeto Flutter criado com o nome **`clients`**.
- [ ] Compilação e arranque num emulador/dispositivo Android.
- [ ] O código segue uma estrutura lógica e separa apresentação, domínio e dados.
- [ ] A fonte **Inter** está realmente aplicada e verificada.
- [ ] Cores, dimensões, ícones, margens, espaçamentos, bordas e sombras são confrontados com screenshots.
- [ ] Modelo Client usa ID estável, nome, email e contacto telefónico.
- [ ] Existe um `ClientRepository` abstrato e uma implementação local em memória.
- [ ] O Módulo 1 não depende de APIs externas nem de credenciais.

## Lista de clientes

- [ ] Cabeçalho com o texto exato **Clientes**.
- [ ] Ícone de pesquisa visível e corretamente alinhado.
- [ ] Lista ordenada alfabeticamente pelo nome.
- [ ] Clientes agrupados pela letra inicial com separador visível.
- [ ] Cada cartão tem avatar circular com inicial.
- [ ] Cada cartão mostra o nome completo e o email do cliente.
- [ ] Cada cartão tem ícone/ação para abrir o detalhe.
- [ ] O botão flutuante **Adicionar** aparece no canto inferior direito.
- [ ] Pressionar um cartão abre o detalhe do cliente correto.
- [ ] Os cartões/scroll/zonas seguras não têm overflow.

## Criar cliente

- [ ] Cabeçalho branco com seta de retroceder e título **Novo Cliente** centrado.
- [ ] Texto **Preencha os dados do novo cliente**.
- [ ] Campo **Nome Completo** com ícone e rótulo.
- [ ] Campo **Email** com ícone e rótulo.
- [ ] Campo **Telemóvel / Contacto** com ícone e rótulo.
- [ ] Campos brancos e arredondados como no screenshot.
- [ ] Botão largo **Criar Cliente** com estilo conforme a referência.
- [ ] Criar registo local atualiza a lista e ordenação/grupo.
- [ ] Retroceder antes de guardar não cria cliente.

## Detalhe de cliente

- [ ] Cabeçalho roxo com seta de retroceder e ícone eliminar.
- [ ] Avatar circular central com inicial e nome centrado.
- [ ] Secção **Dados de Contacto**.
- [ ] Cartão do email com respetivo ícone e legenda.
- [ ] Cartão do telefone com respetivo ícone e legenda.
- [ ] Secção **Gestão**.
- [ ] Botão **Ligar para o Cliente** com integração nativa testada.
- [ ] A ação telefónica usa o número do cliente selecionado.
- [ ] Botão flutuante **Editar Perfil** abre edição do cliente certo.

## Eliminação

- [ ] O diálogo é aberto ao selecionar o ícone eliminar.
- [ ] Ícone ilustrativo e fundo escurecido semelhantes ao screenshot.
- [ ] Título exato **Eliminar Cliente**.
- [ ] Mensagem exata **Tem a certeza de que deseja eliminar este cliente? Esta ação é permanente.**
- [ ] Botões **Cancelar** e **Confirmar**.
- [ ] **Cancelar** fecha o modal sem apagar registos.
- [ ] **Confirmar** elimina o cliente correto e regressa à lista.
- [ ] O cliente eliminado deixa de aparecer e não fica uma rota órfã.

## Editar cliente

- [ ] Cabeçalho branco, retroceder e título **Editar Cliente**.
- [ ] Texto **Atualize os dados abaixo**.
- [ ] Campos com rótulos e ícones corretos.
- [ ] Campos pré-preenchidos com o cliente selecionado.
- [ ] Botão largo **Guardar Alterações**.
- [ ] Guardar atualiza o detalhe e a lista.
- [ ] Mudar o nome para uma inicial diferente reagrupa corretamente.
- [ ] Retroceder sem guardar não altera os dados.

## Qualidade e entrega

- [ ] Comparação visual da lista com a imagem de referência.
- [ ] Comparação visual do Novo Cliente com a imagem de referência.
- [ ] Comparação visual do Detalhe com a imagem de referência.
- [ ] Comparação visual do modal com a imagem de referência.
- [ ] Comparação visual do Editar Cliente com a imagem de referência.
- [ ] `flutter analyze` executado: resultado anotado.
- [ ] `flutter test` executado: resultado anotado.
- [ ] `flutter build apk --debug` executado quando o Android SDK permitir.
- [ ] README contém instruções reproduzíveis de instalação e execução.
- [ ] Revisão de `git status` excluiu referências e material oficial não autorizado.
- [ ] Uso de IA restrito a estudo fora da competição.

### Evidências (preencher após validação)

| Verificação | Estado | Evidência / comando / screenshot |
|---|---|---|
| Build Android | Pendente | — |
| Testes unitários | Pendente | — |
| Testes de widgets | Pendente | — |
| Comparação visual | Pendente | — |
| CRUD local | Pendente | — |
| Navegação | Pendente | — |
| Ação de chamada | Pendente | — |

> **Fronteira de módulos:** pesquisar em tempo real, obter clientes via API, guardar/editar/apagar via API e respetivos estados de carregamento/erro pertencem ao Módulo 2; o Jogo da Velha é do Módulo 3.
