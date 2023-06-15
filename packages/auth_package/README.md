# Dev Community Auth package
Este é um pacote flutter de autenticação do Dev Community, ele se conecta com a pool de usuarios do Dev Community e retorna os tokens para quem for utilizar.

## Features

![Simulator Screenshot - iPhone 14 - 2023-06-13 at 00 37 26](https://github.com/Maua-Dev/auth_package/assets/24724451/5d18b8c2-965a-4c89-8e16-a87a3e48ebf7)


## Getting started

Pacote rodando em flutter

## Usage
Para utilizar esse pacote em seu projeto flutter é simples.

Por enquanto apenas para projetos com [Flutter Modular](https://pub.dev/packages/flutter_modular) instalado.

### 1. Adicionar o pacote nas dependencias
```yaml
# pubspec.yaml
dependencies:
    auth_package:
        git:
            url: https://github.com/Maua-Dev/auth_package.git
            ref: latest
```

### 2. Inserir o Modulo MicroAppAuthModule nos imports modulo app.
```dart
// app.module.dart
class AppModule extends Module {
    @override
    List<Module> get imports => [MicroAppAuthModule()];

    @override
    List<Bind> get binds => [];

    @override
    List<ModularRoute> get routes => [ 
        ChildRoute('/', child: (context, args) => HomePage())
    ];
}
```
### 3. Inserir uma rota com o modulo MicroAppLoginModulo e com guard LoginGuard.
```dart
// app.module.dart
class AppModule extends Module {
    @override
    List<Module> get imports => [MicroAppAuthModule()];

    @override
    List<Bind> get binds => [];

    @override
    List<ModularRoute> get routes => [
        ModuleRoute('/login',
            module: MicroAppLoginModule(), 
            guards: [LoginGuard()]),
        ChildRoute('/', child: (context, args) => HomePage()),
    ];
}
```
### 4. Agora pode acessar o controller de Authenticação de qualquer lugar de seu app.
```dart
// Pegar a instancia do controllador
final AuthStore authStore = Modular.get<AuthStore>();

// Getter para saber se usuario esta logado.
authStore.isLogged; // true

// Informaçoes do usuario.
authStore.user; // { username, email, sub, accessToken}

// Metodo para desconectar usuario.
authStore.signOut();

// Metado para checkar se usuario esta logado.
authStore.checkLogin();

```
## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
