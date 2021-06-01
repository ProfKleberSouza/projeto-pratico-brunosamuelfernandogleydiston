## Dependências do Projeto
```
    -- Instalar Node 14
    -- Arquivo de credenciais firebase.js
        -- Criar pasta e adicionar o arquivo <pasta-root-projeto>/database/firebase.js
```

## Executar Projeto
- npm install # Instala dependências
- npm run expo # Inicia o Projeto
- npm run web # Abre uma webview que fácilita os testes



### Devido a uma Issue aberta no React Native é necessário seguir os seguintes passos:
Issue: https://github.com/facebook/react-native/issues/12981

    1 - Abrir o Arquivo node_modules/react-native/Libraries/Core/Timers/JSTimers.js
    2 - Mudar o valor da linha: const MAX_TIMER_DURATION_MS = 60 * 1000;
        para: const MAX_TIMER_DURATION_MS = 500 * 10000;
