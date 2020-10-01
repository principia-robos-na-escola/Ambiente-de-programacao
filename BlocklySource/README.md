<h1 align="center">BlocklyPrincipia</h1>

Interface de um editor de programação visual com blocos, para uso com ESP32. Este projeto é um fork de [BlocklyDuino](https://github.com/BlocklyDuino/BlocklyDuino), no qual adicionamos algumas funcionalidades como:

- descrições em português dos blocos
- suporte a programação via Wi-Fi, utilizando a ESP32
- suporte a outros modelos de arduino, como Nano e Uno
- blocos relacionados ao robô utilizado pela [organização](http://principia.icmc.usp.br/).

Para utilizar, basta iniciar a interface gráfica.  

`python esp32_web_server.py`

## Como contribuir?

A contribuição para esse projeto pode ser possível de várias formas:

- Resolver traduções parciais encontradas na interface
- Adicionar ou melhorar o funcionamento de blocos
- Otimizações no funcionamento da plataforma
- Sugestões de novas features interessantes

Pull requests serão avaliados caso a caso.

### Tradução

TODO

### Como usar os blocos do Tira Tampa

1. Sempre comece com ESP32_OTA_Server : sem ele, não é possível utilizar OTA e a próxima chamada para programar o dispositivo exigirá conexão via cabo.

2. Use os bloquinhos `Frente`, `Direita`, `Esquerda` e `Para`.  
   Como parâmetro, tempo em milisegundos para execução do bloco.

3. Para mudar a velocidade use o bloco `Velocidade`.   
   Valores entre 0 e 255, padrão é 100.

4. Para finalizar, utilize o bloco `Para` seguido de `Fim`.   
   Sem uma finalização, o robô interpretará o algoritmo como loop, por padrão, repetindo a rotina programada.

### Como criar um novo Bloco

0. Instale as dependências relacionadas. Para ubuntu, segue o trecho de código.

```
   sudo apt install npm
   npm install google-closure-library
   mv node_modules/google-closure-library closure-library
```
1. Crie um novo arquivo no diretório `blockly/blocks`:

   `touch blockly/blocks/example.js`

2. Descreva o software que será adicionado com o novo bloco num arquivo de mesmo nome no diretório em `blockly/generators/arduino`

   `touch blockly/generators/arduino/example.js`

3. Adicione o bloco em `index.html`, na seção em _XML_. É possível inserir o novo bloco numa categoria nova ou em uma já existente. 

   `vim blockly/apps/blocklyduino/index.html`

```
    <category name="Categoria Exemplo">
      <block type="Bloco de Exemplo">
        <value name="CONTENT">
          <block type="text">
            <field name="TEXT">Hello World</field>
          </block>
        </value>
      </block>
    </category>
```

4. Faça a build da nova versão do projeto.   
   ```python build.py```

### Troubleshooting

 - Mudanças no código que não se refletem no browser podem ser devido ao acesso, por do navegador, da versão disponível em cache ao invés da versão nova. 
   Soluções: desabilizar o uso de cache na aba em questão. Utilizando F12, acesse a aba `network` e selecione a checkbox `Disable Cache`. Deste ponto, basta recarregar a página. Testado nos browsers Firefox e Chrome.
