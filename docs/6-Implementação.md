# Projeto da Solução

<span style="color:red">Pré-requisitos: <a href="4-Gestão-Configuração.md"> Ambiente e Ferramentas de Trabalho</a></span>

## Tecnologias Utilizadas

> Para o desenvolvimento do aplicativo em questão definimos que a melhor 
> opção é utilizar o flutter, uma ferramenta de desenvolivmento da Google que 
> permite a criação de aplicativos compilados nativamente, tornando o aplicativo 
> mais rapido e o seu desenvolvimento mais simples.
> O Flutter permite a utilização de várias APIs, no entanto para o projeto
> é necessário apenas algumas funcionalidades do celular, entre elas:
>   - Maps
>   - Contatos
>   - Câmera e mídia 
>   - Microfone  

> O projeto do aplicativo será feito através do ambiente de desenvolvimento [Android Studio](https://developer.android.com/studio)
> mobile devido a sua facilidade de 
> interação com os dispositivos, além de ter um excelente arsenal para emulação android.
> O Android Studio cria todos os arquivos necessários para o desenvolvemtno além de os 
> organiza-los com as melhores praticas para o desenvolvimento mobile. No entanto para fazer 
> a edição do codigo a melhor opção e é a que iremos utilizar é o [Visial Studio Code](https://code.visualstudio.com/).
> O visual Studio disponibiliza extensões que auxiliam o criação de código.
> Algumas extensões que utilizamos para a criação do projeto:
>  - Flutter v3.21.0
>  - Dart v3.21.1
>  - Code spell checker
>  - Git e suas extensões

## Arquitetura da solução

> A interface da aplicação Doar é composta de 6 telas principais, a ideia é ter uma usabilidade 
> simples e dinâmica. A primeira tela apresenta a logo e nome da aplicação e os campos de entrada 
> (login - e-mail\senha) da aplicação. Apresenta os meios para realizar uma nova conta, de forma 
> rápida utilizando a conta Google e do Facebook, ou inscrevendo-se com um endereço de e-mail.
> 
> Na tela de criação da nova conta, o usuário entra com o e-mail e com a senha e posteriormente 
> tem acesso ao perfil onde o usuário preenche os dados visíveis como: nome, texto biográfico e 
> inserção de até 6 fotos. Outros dados são requeridos no background do perfil como localidade, 
> número telefônico, data de nascimento. Ainda na tela de perfil existe um botão que permite o 
> usuário fazer/buscar uma doação.
> 
> Na tela de doações é possível visualizar as doações disponibilizadas, o tipo e data em que foi 
> adicionada. No parte superior tem os botões de voltar e de adicionar um nova doação, ao realizar 
> um nova doação o usuário cadastrar a doação e ao clicar em uma doação disponível o usuário pode 
> visualizar a descrição da doação e data, se houver interesse, o usuário pode inicializar um chat 
> de conversa com o doador. 
> 
> Na tela de chat os usuários podem conversar e acordar como será realizada a doação. O doador então 
> pode disponibilizar um botão com o link da doação, isso permite que o outro usuário tenha acesso à 
> próxima tela que disponibiliza a geolocalização, endereço, data e horário e o número de contato.

## Projeto gráfico do User Flow

![image](https://github.com/ProfKleberSouza/projeto-pratico-brunosamuelfernandogleydiston/blob/0d35e6b3bb9b4044ab0d7622a01a701433480858/docs/img/newinterfece_v1.png)
