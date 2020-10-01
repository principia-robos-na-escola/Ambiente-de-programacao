<h1 align="center">BlocklyPrincipia</h1>

Interface de um editor de programação visual com blocos, para uso com ESP32. Este projeto é um fork de [BlocklyDuino](https://github.com/BlocklyDuino/BlocklyDuino), no qual adicionamos algumas funcionalidades como:

- descrições em português dos blocos
- suporte a programação via Wi-Fi, utilizando a ESP32
- suporte a outros modelos de arduino, como Nano e Uno
- blocos relacionados ao robô utilizado pela [organização](http://principia.icmc.usp.br/).

# Como fazer TUDO funcionar para ESP32!! Jeito fácil.

1) Instale a biblioteca `python-serial`

`sudo apt install python-serial`

2) Execute:

`python esp32_web_server.py`

### Como fazer TUDO funcionar para Arduino Nano!!

1) Crie um servidor WEB para abrir no Browser:

Va' para pasta do Blocklysource (no meu caso)= \~/Documents/github/RobosNaEscola/BlockySource$

python arduino_web_server.py --port=/dev/ttyUSB0 --command=/home/simoes/arduino-1.8.9/arduino --board=arduino:avr:nano

--> Pra terminar click Ctrl+C

2) Abra o link que o pyton criou no Browser
Blocklyduino can now be accessed at http://127.0.0.1:8080/

3) Crie ou Abra um projeto com LOAD XML na interface
(no meu caso fica em) -->
/home/simoes/Documents/github/RobosNaEscola/SoftwareEscola/Blocky/

4) Programe o Arduino:
clique em upload e REZA pra o nome do arduino estar correto!!

5) Tambem e' possivel salvar o programa em C para programar com a IDE do Arduino
Clia em Sav Arduino Code
--> Ele salva no Downloads
--> Abra normalmente o .ino na IDE do Arduino e programe!

### JEITO ANTIGO!!!! USE O JEITO FÁCIL NO COMEÇO DO README.
### Como fazer TUDO funcionar para Programar ESP32 via WIFI!!
### Jeito Automatico !!

1) Conecte-se na rede WIFI que o ESP32 criou.

2) Crie um servidor WEB para abrir no Browser:

--> Va' para pasta do Blocklysource (no meu caso)= \~/Documents/github/RobosNaEscola/BlockySource$

--> Digite: python arduino_web_server.py --port=192.168.4.1 --command=/home/simoes/arduino-1.8.9/arduino --esp True

--> OBS.: Pra acabar com o Servidor, click Ctrl+C

3) Abra o link que o pyton criou no Browser
Blocklyduino can now be accessed at http://127.0.0.1:8080/

4) Crie ou Abra um projeto com LOAD XML na interface
(no meu caso fica em) -->
/home/simoes/Documents/github/RobosNaEscola/SoftwareEscola/Blocky/

5) Programe o ESP32:
clique em upload e ele deve encontrar AUTOMATICAMENTE o ESP32 na WIFI


### JEITO ANTIGO!!!! USE O JEITO FÁCIL NO COMEÇO DO README.
### Como fazer TUDO funcionar para Programar ESP32 via WIFI!!
### Jeito Gambiarra !!

1) Abra a interface do Arduino, conecte-se na rede WIFI que o ESP32 criou.

2) Configure a Board como ESP32 Dev Module   e   Configure a porta como IP 192.168.4.1

3) Programe o ESP32 via WIFI normalmente (obviamente com um programa que tenha WIFI e OTA)

4) Salve oprograma e FECHE a IDE do Arduino
  --> Ele vai atualizar um arquivo de Preferencias com o nome da board e a porta IP
  --> No meu caso esta' em: /home/simoes/.arduino15/preferences.txt
  --> Com esse aqurivo,ele se auto configura para o Blokly usar o ESP32 na WIFI

5) Crie um servidor WEB para abrir no Browser:

--> Va' para pasta do Blocklysource (no meu caso)= \~/Documents/github/RobosNaEscola/BlockySource$

--> Digite: python arduino_web_server.py --port=192.168.4.1 --command=/home/simoes/arduino-1.8.9/arduino

--> OBS.: Pra acabar com o Servidor, click Ctrl+C

6) Abra o link que o pyton criou no Browser
Blocklyduino can now be accessed at http://127.0.0.1:8080/

7) Crie ou Abra um projeto com LOAD XML na interface
(no meu caso fica em) -->
/home/simoes/Documents/github/RobosNaEscola/SoftwareEscola/Blocky/

8) Programe o ESP32:
clique em upload e REZA pra ele encontrar o ESP32 na WIFI como default




### Como Mudar para o Português


--> Para traduzir para Portugues, basta Editar o Index.HTML, que setá em:
/home/simoes/Documents/github/RobosNaEscola/BlockySource/blockly/apps/blocklyduino
--> E trocar a OITAVA LINHA de:    <script type="text/javascript" src="../../msg/js/en.js"></script>
--> Para:   <script type="text/javascript" src="../../msg/js/pt-br.js"></script>

### Como usar os blocos do Tira Tampa

1) Sempre comece com ESP32_OTA_Server.
Sem ele a proxima vez que programar vai ter que ser no cabo.

2) Use os Bloquinhos Frente, Direita, Esquerda e Para.
Como parâmetro passe o tempo em milisegundos que você quer que ele fique nessa direção.
Chamar com parâmetro 0 é o mesmo que não chamar (ao menos que você chama o bloco Fim logo em seguida).

3)Para mudar a velocidade use o bloco Velocidade.
Ele aceita argumentos de 0 a 255.
Por padrão começa em 100.
Ele também muda a velocidade de virar.

4)Para finalizar SEMPRE acabe com Para, e depois Fim.
Se não ele vai começar os comandos de novo ou ficar se movendo para sempre.

### Como criar um novo Bloco

--> Para criar mais Blocos, tem que editar 3 coisas!! E depois Re-build o python

# Cuidado: TEM QUE LIMPAR O CACHE DO BROWSER --> F12 (CheckBox Disable Cache) e F5

1) Crie um novo arquivo em

/home/simoes/Documents/github/RobosNaEscola/BlockySource/blockly/blocks

Ex: /home/simoes/Documents/github/RobosNaEscola/BlockySource/blockly/blocks/principia.js

```
goog.provide('Blockly.Blocks.Principia');

goog.require('Blockly.Blocks');

Blockly.Blocks['serial_print'] = {
  helpUrl: 'http://www.arduino.cc/en/Serial/Print',
  init: function() {
    this.setColour(230);
    this.appendValueInput("CONTENT", 'String')
        .appendField("Serial Print");
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setTooltip('Prints data to the console/serial port as human-readable ASCII text.');
  }
};
```

2) Descreva o SW que será adicionado com o novo bloco em

/home/simoes/Documents/github/RobosNaEscola/BlockySource/blockly/generators/arduino/principia.js

```
Blockly.Arduino.serial_print = function() {
  var content = Blockly.Arduino.valueToCode(this, 'CONTENT', Blockly.Arduino.ORDER_ATOMIC) || '0'
  //content = content.replace('(','').replace(')','');

  Blockly.Arduino.setups_['setup_serial_' + profile.default.serial] = 'Serial.begin(' + profile.default.serial + ');\n';

  var code = 'Serial.print(' + content + ');\n';
  return code;
};
```

3) Adicione uma nova seção em
/home/simoes/Documents/github/RobosNaEscola/BlockySource/blockly/apps/blocklyduino/index.html

-> Crie uma nova categoria no final do arquivo (parte em XML):
```
    <category name="Principia">
      <block type="serial_println">
        <value name="CONTENT">
          <block type="text">
            <field name="TEXT"></field>
          </block>
        </value>
      </block>
    </category>
```

4) Re-build o python

-> Va' para pasta: /home/simoes/Documents/github/RobosNaEscola/BlockySource/blockly/

-> Execute: python build.py

==> No me caso bugou dizendo:
Error: Closure not found.  Read this:
https://developers.google.com/blockly/hacking/closure

Pra resolver:
sudo apt install npm
npm install google-closure-library

=====> Dai' ele instala como uma subpasta da pasta que voce estiver no terminal (troco porco!!!)
=====> Entao, tem que mover para a pasta do:\~/Documents/github/RobosNaEscola/BlockySource/
=====> E trocar o nome para closure-library   (tirando a parte google-)

Dai' vai conseguir buildar!!!

# Cuidado: TEM QUE LIMPAR O CACHE DO BROWSER --> F12 (CheckBox Disable Cache) e F5


### More Info on BlocklyDuino



BlocklyDuino is a **web-based visual programming editor for [Arduino](http://www.arduino.cc/)**.

BlocklyDuino is based on [Blockly](https://developers.google.com/blockly/), the web-based, graphical programming editor. Provide static type language blocks and code generators for Arduino programming.

BlocklyDuino also support [Grove](http://www.seeedstudio.com/wiki/GROVE_System) blocks to easily get started with microcontroller-based experimentation and learning.

Google+ Page](https://plus.google.com/111979846292233941175).
