# Avaliação da Aplicação

## Plano de Testes

> Cenários de testes utilizados durante o desenvolvimento da aplicação.
> 
> Nessa etapa foi enumerado quais cenários de testes foram selecionados para teste. 
> Para isso foi adotado uma desenvolvimento dinâmico onde o processo de teste já acontece em paralelo com 
> o codificação da aplicação, dado ao número reduzido de membros na equipe. Sendo todos responsáveis neste 
> ciclo pela manutenção as etapas de desenvolvimento, teste das funcionalidades da aplicação e se o objetivo 
> referente as estas etapas estão sendo atendidos.
>
|ATIVIDADES  |EQUIPE DE DESENVOLVIMENTO                       |OBJETIVO  |
|------------|------------------------------------------------|----------|
|Estudo do Projeto|Desenvolve a aplicação|Implementar telas, elementos e navegação da aplicação|
|Estudo das Funcionaliades|Executa continua testagem das funcionalidades durante o desenvolvimento|Tornar a aplicação funcional|
|Estudo dos Integrações|Executa continua testagem das integrações como o Firebase durante o desenvolvimento|Manter a integridade dos dados|
|Estudo das Melhorias|Desenvolve novas soluções para problemas de interface e de design|Deixar a aplicação mais fluída para o usuário|

> Foi adotado um modelo DevOps baseado no Design Thinking para que desenvolvimento e os testes da aplicação 
> ocorram em paralelo, isso porque as mudanças no sistema entravam em produção mais rapidamente, o plano foi 
> automatizar todo o pipeline, para atingir o tão desejado “continuous delivery”, o DevOps visou otimizar e 
> se aplicar a cada etapa do processo de desenvolvimento de software, desde o planejamento até a entrega.
> 
## Modelo DevOps
![image](https://github.com/ProfKleberSouza/projeto-pratico-brunosamuelfernandogleydiston/blob/e29c0c27721ffeb95f33aa5947914a14e145454d/docs/img/developer_model.png)
>
> [ 1 ] Essas são as etapas da produção da aplicação. O fluxo mostra desde o planejamento até o monitoramento, 
> passando por todas as que fazem parte do cotidiano dos desenvolvedores e operadores.
>
![image](https://github.com/ProfKleberSouza/projeto-pratico-brunosamuelfernandogleydiston/blob/db9be57cedf5777477cfc9b8f42e3733788bedaa/docs/img/1.png)
>
>[ 2 ] Acrescentar agora as ferramentas que nos auxiliam em cada uma dessas fases.
>
![image](https://github.com/ProfKleberSouza/projeto-pratico-brunosamuelfernandogleydiston/blob/11efb3765efc506a1779f3b6cdc69ee7c3021a0c/docs/img/2.png)
>
>[ 3 ] Adicionaremos as práticas de DevOps que vão otimizar os processos.
>
![image](https://github.com/ProfKleberSouza/projeto-pratico-brunosamuelfernandogleydiston/blob/a82573a4b58dfe4b8bf00ff8357c8cb4f0313a56/docs/img/3.png)
>
>[ 4 ] E por baixo dessas práticas, há a base que sustenta toda essa intrincada estrutura: a qualidade.
>
> São: testes unitários, funcionais, de interface gráfica, integrados — todos eles compõem a esfera da qualidade 
> que viabiliza a produção sustentável da aplicação. 
>
![image](https://github.com/ProfKleberSouza/projeto-pratico-brunosamuelfernandogleydiston/blob/b36559c5354d73901396c4efb3cf312753d8bf5a/docs/img/4.png)
## Referências das Ferramentas de Testes 
> - [Ferramentas de Test para Java Script](https://geekflare.com/javascript-unit-testing/)
> - [UX Tools](https://uxdesign.cc/ux-user-research-and-user-testing-tools-2d339d379dc7)

# Avaliação Prática

> Em suma, já no estágio inicial do desenvolvimento foram realizados os Testes Unitários no processo, estes 
> ocorram no "continuous deploy", "integration" e "delivery" da aplicação.
> 
## Os principais tipos de testes aplicados no desenvolvimento da aplicação:

### Testes unitários

> Foram os testes de unidades ou componentes individuais da aplicação: as menores partes testáveis do software. 
> Geralmente, eles tiveram apenas um ou poucos inputs e outputs, nesse caso, inicialmente feito individualmente 
> nas telas da aplicação. Trata-se do primeiro nível de automação de testes e é geralmente feito sob o nível de 
> métodos.

### Testes funcionais

> Foram aqueles pelos quais o sistema é testado contra as especificações ou requisitos funcionais. Isso se extende 
> desde o cadastro a ultizacação da aplicação em si. As funções foram testadas por meio da entrada de inputs 
> realizados pela equipe de desenvolvimento e a análise do resultado foi utilizada para garantir que os requisitos 
> sejam satisfatoriamente cumpridos. Esses testes são também chamados de end-to-end. 

### Testes de interface de usuário (GUI)

> Graphical User Interface é a interação com o computador por meio de imagens em vez de texto. Esses foram os 
> testes de interface de usuário sendo, então, aqueles que envolvem checar as telas com controles, como menus, 
> botões, ícones etc.

### Testes integrados

> Foram os testes nos quais se validam a integração de módulos ou sistemas, nesses caso, a intração e a persistência 
> dos dados com o Firebase. O objetivo foi de garantir que a interface do sistema esteja de acordo com a especificação 
> e que os sistemas estão se conversando conforme o esperado. São um pouco mais complexos de se executar, uma vez 
> que dependem de se ter mais de um sistema no ar. É o tipo de teste que utilizou das técnicas de Mocking.

### Test-Driven Bugfixing (TDB)

> Foram aplicados TDD (Test Driven Development) já no inicio do processo de desenvolvimento para correção de bugs. 
> Bug é por natureza um cenário do sistema que falha que ocorreram com frequência. Então, identificado um bug no 
> sistema, foi adotado o seguinte procedimento:
> 
> 1. Analisar a origem do bug;
> 2. Executa o teste da aplicação (compliação), como esperado;
> 3. Corrije o bug;
> 4. Execute o teste e veja se dessa vez passa.

### Teste de Usabilidade

> Envolveu o registro do desempenho de usuários típicos, realizando tarefas típicas.
> Ambiente controlado.
> Usuários são observados e cronometrados.
> Os dados são usados para calcular os tempos gastos pelos usuários nas tarefas, bem como para identificar e explicar erros.
> Satisfação do usuário é avaliada por meio de questionários e entrevistas que são compilados em avaliação POSITIVA e NEGATIVA.

### Recrutamento de Participantes

> O participantes escolidos para realizar os testes da aplicação foram os integrantes da equipe de desenvolvimento da 
> aplicação assim como participaram tambem membros das familia de cada participante.

### Condução do teste

> As tarefas escolhidas para o teste devem corresponder ao uso esperado e natural do sistema.
> O número de variáveis que possam gerar resultados inválidos ou mascarar os resultados obtidos deve ser reduzido o mais possível.
> As sessões foram padronizadas.
> Os testes pilotos (dry run) das sessões de teste foram realizados para melhorar a clareza da fala do administrador de testes, 
> verificar a viabilidade da execução das tarefas, aprimorar as estimativas de duração das sessões.

# Resultados

## Resutados dos testes durante o desenvolvimento

> O objetivo era validar que um bug foi corrigido e evita que o mesmo bug ocorra no futuro por conta de outras alterações 
> no código, portanto, adotar DevOps, permitiu acelerara a entrega de novas funcionalidades. Isso permitiu aumenta da qualidade 
> da entrega, aumento da previsibilidade, segurança para refactoring, redução de custos e aumento da satisfação dos desenvolvedores.

## Resutados dos testes com usuários 

> O objetivo era validar a usabilidade da aplicação, os tarefas escolhidas para o teste devem corresponder ao uso esperado e natural do sistema.

### Compilação e análise dos dados coletados

> Essa etapa tiveram os testes limitados, pois os objetivos eram de obter resultados claros, concisos e específicos de usabilidade da aplicação por 
> outros usuários que não fossem os envolvidos no desenvolvimento do projeto:
> 
> 1. Avaliação empírica apoia somente em experiências vividas pelos usuários.
> 2. Detectar problemas de usabilidade por meio da observação do usuário interagindo com o sistema da aplicação.
>
> Dentro dessa etapa foram executados testes de usabilidade em dois níveis:
> 1. Resultados obtidos no protótipo de baixa fidelidade (representações provisórias da aplicação).
> 
|POSITIVAS                   |NEGATIVAS                        |
|----------------------------|---------------------------------|
|Idéia do projeto|Instabiliade da aplicação e bugs de navegação|
|Design agradável| |
|Simplicidade da aplicação| |
> 
> 2. Resultados obtidos no protótipo de alta fidelidade (representados muitos próximos da versão final da aplicação).
> 
|POSITIVAS                   |NEGATIVAS                        |
|----------------------------|---------------------------------|
|Idéia do projeto|Poderia ter a opção de realizar chamada telefônica automáticas entre os usuários|
|Design agradável|Poderia ter a geolocalização da localização, ou filtrar as doações com base na localização dos usuários;|
|Simplicidade da aplicação|Questão de segurança entre os usuários com relação a entrega da doação|
|Navegação dentro da aplicação.| |
