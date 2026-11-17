# Clients — Módulo 1

Reimplementação independente para estudo fora da competição, sem afiliação à WorldSkills. O projeto abre no ecrã inicial **Clientes**.

## Executar em Android

A partir desta pasta, com o Flutter 3.50.0 estável (Dart 3.14.0) e um emulador ou dispositivo Android disponível:

```sh
flutter doctor
flutter pub get
flutter analyze
flutter test
flutter devices
flutter run
```

O ecrã inicial apresenta um cabeçalho branco com o título **Clientes** em Inter e um fundo azul-acinzentado. Os valores do tema são preliminares e serão afinados ao implementar a lista.

A Inter 4.1 é distribuída com a aplicação nos pesos 400, 600 e 700. A [licença SIL Open Font License 1.1](assets/fonts/LICENSE.txt) acompanha os ficheiros. [Versão original da fonte](https://github.com/rsms/inter/releases/tag/v4.1).

## Validação do arranque

`flutter pub get` terminou com sucesso, `flutter analyze` não encontrou problemas e o teste de arranque passou. O teste verifica o ecrã inicial, o tema e os três ficheiros Inter no pacote Flutter.

O APK de depuração para Android x86-64 foi compilado, instalado e aberto no emulador Pixel 10a (1080 × 2424 px). A captura confirmou o cabeçalho branco com o título à esquerda e o fundo azul-acinzentado.
