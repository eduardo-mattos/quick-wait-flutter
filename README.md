# quick_wait_android

## Estrutura do Projeto

### Arquitetura

A Estrutura do projeto é feita com base na proposição de Robert Cecil Martin(Uncle Bob) no Livro Clean Archtecture, com adaptações propostas para Flutter Inicialmente pelo Reso Coder em seu canal no [Youtube](https://www.youtube.com/watch?v=KjE2IDphA_U&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech). Outros materiais referentes as proposições de arquiteturas limpas em Flutter Podem ser encontrados nos links a seguir:

- Canal do David [YouTube](https://www.youtube.com/watch?v=LwOACmXcNQ8&t=1s)
- Clean Dart [Github](https://github.com/Flutterando/Clean-Dart)

### Organização dos diretórios

![image](https://user-images.githubusercontent.com/7063932/150779899-13bccabd-6a3a-4876-92dc-99bb424cc38c.png)

Dentro da pasta lib podemos ver inicialmente outros três diretórios, que são: 

- **commons**: Seu objetivo base é conter as classes e funções que serão compartilhadas pelas features.
- **design_system**: Todos os Widgets e Detalhes de interface que serão reutilizados por Telas de features diferentes, como por Exemplo: Um card que aparece em várias partes da aplicação, botão com estilização específica, ou um TextField personalizado, etc.
- **features**: Cada feature terá um diretório específico para conter os seus arquivos. Mais detalhes serão mostrados logo abaixo:

#### Features

![image](https://user-images.githubusercontent.com/7063932/150780715-15801ac3-dd1a-4a44-8c67-359795ffaa22.png)

Como mostrado na imagem anterior, cada parte independente do nosso app terá um diretório para conter os seus arquivos.

> Obs: Esta disposição é preliminar, com o tempo é normal que refatorações ocorram e os arquivos sejam reorganizados.