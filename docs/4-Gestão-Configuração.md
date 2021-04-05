# Gestão de Configuração

## Controle de Versão

> A ferramenta de controle de versão adotada no projeto foi o [Git](https://git-scm.com/), sendo que o [Github](https://github.com) foi utilizado para hospedagem do repositório `upstream`.


#### Branchs

> O projeto segue a seguinte convenção para o nome de branchs:

- `master`: versão estável já testada do software
- `homologação`: versão de homologação do software, todo desenvolvimento deve passar pela branch para testes, antes de ir para homologação, para executar de testes antes de ir para homologação.
- `H-xx`: A equipe de desenvolvimento deve clonar a ultima versão da branch de homologação e criar uma branch com o H-`número da história(xx)`

#### Tags

> <p> Quanto as tags escolhidas para gerência de issues, devem ser usados no projeto a seguinte convenção para etiquetas: </p>

- `bugfix`: uma funcionalidade encontra-se com problemas
- `hot-bugfix`: uma funcionalidade encontra-se com problemas e ação rápida para resolução
- `feature`: uma nova funcionalidade precisa ser introduzida
- `melhoria`: uma funcionalidade precisa ser melhorada
- `analise`: uma analise de uma funcionalidade a ser criada
- `reuniões`: para agendamento reuniões

#### Commits e Merges

> Os commits e mergers deverão seguir a convenção de  [Conventional Commits](https://www.conventionalcommits.org/pt-br/v1.0.0-beta.4/#resumo)
> exemplo da estrutura:

```
   <tipo>[escopo opcional]: <descrição>

   [corpo opcional]

   [rodapé opcional]

```

> **Links Úteis**:

- [Tutorial GitHub](https://guides.github.com/activities/hello-world/)
- [Git e Github](https://www.youtube.com/playlist?list=PLHz_AreHm4dm7ZULPAmadvNhH6vk9oNZA)
- [Git Tutorial](https://nvie.com/posts/a-successful-git-branching-model/)
- [Git Flow](https://danielkummer.github.io/git-flow-cheatsheet/)
- [Conventional Commits](https://www.conventionalcommits.org/pt-br/v1.0.0-beta.4)

## Hospedagem

> Será descrita após a execução da mesma, escolhemos a utilização a priori do Firebase.
> 
> **Links Úteis**:
> 
- [Firebase](https://firebase.google.com/docs)
