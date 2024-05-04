## Crypto Coin App - Arquitetura Limpa com BLoC e Dio 🚀 🔄 🌐

Codificação em Flutter e Dart para aplicação Crypto Coin App usando as melhores práticas de programação para construir aplicações móveis robustas, com integração de API da CoinMarketCap em real time para consumir dados de forma escaláveis e mantíveis usando Flutter. Ele enfatiza os princípios da Arquitetura Limpa, programação orientada a objetos (OOP), padrões de design, princípios SOLID e integração eficaz de APIs com BLoC para gerenciamento de estado e Dio para lidar com chamadas de requisições de Api.

### Tecnologias Utilizadas 🛠️
![Flutter](https://img.shields.io/badge/-Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/-Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/-BLoC-00B4AB?style=for-the-badge&logo=bloc&logoColor=white)
![Java](https://img.shields.io/badge/-Java-F89820?style=for-the-badge&logo=java&logoColor=white)
![Kotlin](https://img.shields.io/badge/-Kotlin-7F52FF?style=for-the-badge&logo=kotlin&logoColor=white)


### Arquitetura Limpa
A Arquitetura Limpa visa separar as preocupações no design de software, tornando o sistema mais fácil de gerenciar e modificar. Esta arquitetura divide a aplicação em camadas com responsabilidades distintas, melhorando a modularidade e facilitando o desenvolvimento e teste independentes.

### Camadas da Arquitetura Limpa:
- Camada de Entidades: A camada central da aplicação onde residem os objetos de negócios ou modelos de domínio.
- Camada de Casos de Uso (Interatores): Contém regras de negócios e lógica que são independentes da interface do usuário. Atua como mediador entre as Entidades e os Adaptadores de Interface.
- Camada de Adaptadores de Interface: Esta camada inclui Apresentadores, Controladores e Gateways, fazendo a ponte entre sistemas externos ou frameworks e os casos de uso da aplicação.
- Camada de Frameworks e Drivers: A camada mais externa, interagindo diretamente com o ambiente externo. Inclui bancos de dados, frameworks de UI e serviços de terceiros.

### Programação Orientada a Objetos (OOP)
OOP é um paradigma de programação baseado no conceito de "objetos", que podem conter dados e código: dados na forma de campos (muitas vezes conhecidos como atributos) e código, na forma de procedimentos (muitas vezes conhecidos como métodos).

### Conceitos Chave de OOP:
- Encapsulamento: Agrupar os dados (atributos) e métodos que operam nos dados em uma única unidade ou classe.
- Herança: Mecanismo pelo qual uma nova classe recebe as propriedades e comportamentos de outra classe.
- Polimorfismo: Capacidade de diferentes classes serem tratadas como instâncias da mesma classe através da herança.
- Abstração: Esconder a complexidade real enquanto expõe apenas as partes necessárias.


### Padrões de Design
Padrões de design são soluções típicas para problemas comuns no design de software. Cada padrão é como um modelo que você pode personalizar para resolver um problema de design particular no seu código.

- Padrões de Design Usados Comumente no Flutter:
Método de Fábrica: Usado para criar objetos em uma superclasse, mas permitindo que subclasses alterem o tipo de objetos que serão criados.
- Singleton: Garante que uma classe tenha apenas uma instância, enquanto fornece um ponto de acesso global a esta instância.
- Observer: Onde um assinante se registra com um provedor e é notificado sobre mudanças. Este padrão está profundamente integrado no Flutter usando Streams e ChangeNotifier.

### Princípios SOLID
SOLID representa cinco princípios de design e programação orientada a objetos que contribuem para tornar o software mais compreensível, flexível e mantível.

Princípios SOLID
- Single Responsibility Principle (Princípio da Responsabilidade Única)
O código mostra várias classes que lidam com páginas específicas (por exemplo, SearchPage, ProfilePage, MarketPage), cada uma responsável por gerenciar a UI e a lógica relacionada a essa parte específica do aplicativo. Isso ajuda a manter as classes focadas em uma única responsabilidade.

- Open/Closed Principle (Princípio Aberto/Fechado)
O uso de BlocProvider para injetar dependências (como CoinBloc que depende de GetCoinData e CoinRepositoryImpl) permite que o código seja extensível. Novos blocos ou repositórios podem ser adicionados sem modificar os consumidores existentes, desde que sigam a interface esperada.

- Dependency Inversion Principle (Princípio da Inversão de Dependência)
O código demonstra a inversão de dependência, especialmente na maneira como a CoinBloc é criada. A CoinBloc depende de uma abstração (GetCoinData), não de detalhes concretos. Essa abstração é então implementada pelo CoinRepositoryImpl, que é injetado no Bloc.

### Conceitos de Orientação a Objetos

- Encapsulamento 

A classe _HomePageState encapsula os estados e comportamentos específicos da página inicial, como controle de abas (_tabController) e variáveis de estado (_marketCap, _volume, etc.). O acesso a essas variáveis é controlado dentro da classe, seguindo o conceito de encapsulamento.

- Herança
A classe _HomePageState herda de State<HomePage> com uma mixin SingleTickerProviderStateMixin. Isso permite que _HomePageState utilize métodos e propriedades de sua classe base e da mixin, como métodos de ciclo de vida (initState e dispose) e a capacidade de ser um vsync para animações.

- Polimorfismo
Polimorfismo é demonstrado no uso de widgets e classes que podem ser tratados como suas superclasses ou interfaces. Por exemplo, todos os widgets como MarketCard, SearchPage, etc., são tratados como Widget, permitindo que sejam usados 
genericamente na UI.

- Composição
A composição é amplamente utilizada para construir interfaces complexas a partir de componentes menores, como no uso de MarketCard dentro de uma lista em CarouselSlider ou na composição de abas e visualizações dentro do TabBarView.


### BLoC (Business Logic Component)
BLoC é um padrão de design introduzido pelo Google para gerenciar o estado em aplicações. Ajuda a separar a apresentação da lógica de negócios, tornando seu código modular, testável e fácil de gerenciar.

- Componentes do BLoC:
- Eventos: Entrada que desencadeia qualquer mudança de estado.
- Estados: Saída do BLoC que representa parte da UI.
- Transições: A mudança de um estado para outro, desencadeada por um evento.


### Dio
Dio é um cliente HTTP Dart poderoso para lidar com chamadas de rede no Flutter. Suporta interceptadores, FormData, cancelamento de requisição, download de arquivos, timeouts e muito mais.

### Uso do Dio com BLoC:
- Integração: Implementar lógicas de chamadas de API dentro dos eventos de BLoC.
- Gerenciamento de Erros: Manipulação de exceções API para transição para estados de erro.
- Testabilidade: Facilidade de mock de chamadas de API durante os testes de unidade.
- Conclusão

Este guia oferece uma visão geral de como estruturar e implementar uma aplicação Flutter usando práticas recomendadas de arquitetura e design, com ênfase na manutenção e extensibilidade do código. Adotando essas práticas, para desenvolvimento é possível construir aplicações robustas que são mais fáceis de entender, testar e manter.


### Clone o repositório para sua máquina local.
Navegue até o diretório do projeto em seu terminal.
Execute 
```
flutter pub get
```
para buscar as dependências necessárias.
Execute 
```
flutter run
```
para construir e executar o aplicativo em seu emulador ou dispositivo.

### Conclusão
Em resumo, o Crypto Coin App é um exemplo primoroso de como modernas práticas de desenvolvimento e arquitetura de software podem ser implementadas em um ambiente de desenvolvimento Flutter para criar aplicações que são não apenas funcionais, mas também extensíveis, sustentáveis e de fácil manutenção. Este projeto serve como um modelo valioso para desenvolvedores que procuram criar aplicações comerciais robustas com Flutter, fornecendo um caminho claro para o sucesso no desenvolvimento de software móvel.

### Desenvolvido por:
Emerson Amorim [@emerson-amorim-dev](https://www.linkedin.com/in/emerson-amorim-dev/)
