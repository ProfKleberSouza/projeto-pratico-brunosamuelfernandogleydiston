# Especificações Do Projeto

<span style="color:red">Pré-requisitos: <a href="1-Contexto.md"> Documentação de Contexto</a></span>


# Estamos revisando e ajustando as histórias a partir dos feedbacks obtidos no dia 01-03-2021

## Personas


|PERSONA|SOBRE                        |
|-------|-----------------------------|
| Lúcio | Um professor de cálculo de 33 anos, é casado e voluntário na assistência social da igreja. Além de sempre ajudar, ele se move para conscientizar as pessoas da necessidade de ajudar pessoas vulneráveis, e que mesmo pequenas contribuições fazem grandes diferenças. Na assistência social ele desempenha o papel de  encontrar doadores, organizar doações e encontrar pessoas que necessitam de ajuda, com sua equipe de voluntários. |
|Mário|Um vendedor de salgados de 35 anos que mora num suburbio de Vespasiano, casado e com 3 filhos que perdeu clientes devido a pandemia foi despejado da sua casa e precisou buscar auxílio de ONGs e doações para manter sua família. Foi recebido pelo grupo de apoio de Minas Gerais que o acolheu e disponibilizou Abrigo e alimento. |




## Histórias de Usuários

Com base na análise das personas forma identificadas as seguintes histórias de usuários:

|EU COMO... PERSONA|QUERO/PRECISO ... FUNCIONALIDADE	|PARA ... MOTIVO/VALOR|
|-----------|-------------------------|----------|
| Lúcio | Criar uma lista, onde diversas pessoas possam contribuir com determinado item até determinada data limite para doações, e definir locais para receber as doações. | Possibilitar diversas pessoas contribuírem de maneira organizada. |
|Mário|Criar uma forma de ajudar pessoas que buscam abrigo e alimento para manter não apenas a sua pessoa, mas sim toda a sua família.|Permitir que os usuários busquem auxílio de 1 ou mais modalidade de suporte de forma mais simples.|




## Requisitos

As tabelas que se seguem apresentam os requisitos funcionais e não funcionais que detalham o escopo do projeto.

### Requisitos Funcionais


**Requisitos Funcionais**


|ID     |Descrição do Requisito	  |Prioridade|
|-------|-------------------------|----------|
|RF-001|Permitir a criação de Lista de Doações, com descrições bem detalhadas sobre qual o fim da lista.|Alta|
|RF-002|Permitir cadastro de usuários com dois tipos de perfis(Doador, Necessitado )|Alta|
|RF-003|Cadastrar Locais para entrega de Doações|Média|
|RF-004|Permitir doadores acessarem lista de Doações|Alta|
|RF-005|Sinalizar um pedido de ajuda, com base na Geolocalização| Alta|
|RF-007|Permitir usuário cria um perfil onde pode relatar história pessoal|Alta|
|RF-008|Permitir usuário doador sinalizar disponibilidade para doações|Alta|
|RF-009|Permitir compartilhamento de listas de doaçoes em ferramentas de mídias sociais|Baixa|
|RF-010|Permitir que o usuário doador converse com o usuário receptor através de um chat|Baixa|


### Requisitos não Funcionais

|ID     | Descrição do Requisito  |Prioridade |
|-------|-------------------------|-----------|
|RNF-001|Visar segurança de doadores|Alta|
|RNF-002|Criar aplicativo intuitivo para qualquer público|Alta|




## Restrições

O projeto está restrito pelos itens apresentados na tabela a seguir.

|ID| Restrição                                             |
|--|-------------------------------------------------------|
|01| O projeto deverá ser entregue até o final do primeiro semestre de 2021 |
|02| O projeto se limita a atender todos os requisitos funcionais especificados nesta documentação |
|03| Não pode ser desenvolvido um módulo de backend |


