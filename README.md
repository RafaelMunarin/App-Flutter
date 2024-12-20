
# Aplicativo de Lista de Tarefas

Um aplicativo simples de gerenciamento de tarefas desenvolvido com Flutter. Este projeto permite aos usuários adicionar, editar e excluir tarefas, proporcionando uma maneira fácil de organizar suas atividades diárias.

## Funcionalidades

- **Adicionar Tarefas**: Os usuários podem adicionar novas tarefas com títulos e descrições.
- **Editar Tarefas**: Permite que os usuários façam alterações nas tarefas existentes.
- **Excluir Tarefas**: Usuários podem remover tarefas da lista.
- **Lista de Tarefas**: Mostra todas as tarefas adicionadas em uma lista, com opções para edição e exclusão.

## Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento para criar interfaces nativas para iOS e Android.
- **Provider**: Gerenciamento de estado utilizado para manter e manipular a lista de tarefas.
- **Material Design**: Componentes visuais que seguem as diretrizes do Material Design do Google.

## Estrutura do Projeto
```
lib/
├── main.dart
├── models/
│   └── task.dart
├── providers/
│   └── task_provider.dart
├── screens/
│   ├── task_list_screen.dart
│   └── add_task_screen.dart
│   └── edit_task_screnn.dart
└── widgets/
    └── task_item.dart
```

## Como Executar o Projeto

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/RafaelMunarin/App-Flutter.git
   ```

2. **Acesse o diretório do projeto**:
   ```bash
   cd App-Flutter
   ```
   ```bash
   cd gerenciador_tarefas
   ```

3. **Instale as dependências**:
   ```bash
   flutter pub get
   ```

4. **Execute o aplicativo**:
   ```bash
   flutter run
   ```