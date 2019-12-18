### Welcome to Blocky do Princípia Robos na Escola

--> Este projeto é um Fork do [BlocklyDuino](https://github.com/BlocklyDuino/BlocklyDuino)
--> No qual adicionamos a capacidade de programar o ESP32 via WIFI, além dos outros Arduinos (Nano, Uno...)

### Como fazer tudo funcionar para ESP32

1) Instale a biblioteca `python-serial`

`sudo apt install python-serial`

2) Execute:

`python esp32_web_server.py`

### Como Mudar para o Português

--> Para traduzir para português, basta editar o index.html, que setá em:

`/home/simoes/Documents/github/RobosNaEscola/BlockySource/blockly/apps/blocklyduino`

--> E trocar a OITAVA LINHA de:

```html
<script type="text/javascript" src="../../msg/js/en.js"></script>
```

--> Para:

```html
<script type="text/javascript" src="../../msg/js/pt-br.js"></script>
```

### Como usar os blocos do Tira Tampa

1) **Sempre** comece com ESP32\_OTA\_Server.

Sem ele a proxima vez que programar vai ter que ser no cabo.

2) Use os Bloquinhos Frente, Direita, Esquerda e Para.
Como parâmetro passe o tempo em milisegundos que você quer que ele fique nessa direção.
Chamar com parâmetro 0 é o mesmo que não chamar (ao menos que você chama o bloco Fim logo em seguida).

3) Para mudar a velocidade use o bloco Velocidade.
Ele aceita argumentos de 0 a 255.
Por padrão começa em 100.
Ele também muda a velocidade de virar.

4) Para finalizar **SEMPRE** acabe com Para, e depois Fim.
Se não ele vai começar os comandos de novo ou ficar se movendo para sempre.

### Como criar um novo Bloco

--> Para criar mais Blocos, tem que editar 3 coisas!! E depois Re-build o python

1) Crie um novo arquivo em

`/home/simoes/Documents/github/RobosNaEscola/BlockySource/blockly/blocks`

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

`/home/simoes/Documents/github/RobosNaEscola/BlockySource/blockly/generators/arduino/principia.js`

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
`/home/simoes/Documents/github/RobosNaEscola/BlockySource/blockly/apps/blocklyduino/index.html`

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

-> Vá para pasta:

`/home/simoes/Documents/github/RobosNaEscola/BlockySource/blockly/`

-> Execute:

`python build.py`

==> No me caso bugou dizendo:
Error: Closure not found.  Read this:
https://developers.google.com/blockly/hacking/closure

Pra resolver:
`
sudo apt install npm
npm install google-closure-library
`

=====> Daí ele instala como uma subpasta da pasta que voce estiver no terminal (troço porco!!!)
=====> Entao, tem que mover para a pasta do:\~/Documents/github/RobosNaEscola/BlockySource/
=====> E trocar o nome para closure-library   (tirando a parte google-)

Daí vai conseguir buildar!!!

Quando você for recarregar a página use Ctrl+Shift+R (pelo menos no Chrome), se não ele usa os arquivos antigos.

### More Info on BlocklyDuino

BlocklyDuino is a **web-based visual programming editor for [Arduino](http://www.arduino.cc/)**.

BlocklyDuino is based on [Blockly](https://developers.google.com/blockly/), the web-based, graphical programming editor. Provide static type language blocks and code generators for Arduino programming.

BlocklyDuino also support [Grove](http://www.seeedstudio.com/wiki/GROVE_System) blocks to easily get started with microcontroller-based experimentation and learning.

[We also have Google+ Page](https://plus.google.com/111979846292233941175).

### Features

* Programming Arduino with visually drag and drop code blocks
* Generate fully compatible Arduino source code
* Interactive Arduino board with 10+ predefined Grove sensor blocks
* Load different on-site examples with url parameters

### Demo

BlocklyDuino is a web tool. You can give it a try at
[Web](http://blocklyduino.github.io/BlocklyDuino/blockly/apps/blocklyduino/) to see the working BlocklyDuino.

You can link directly to examples
* [demo 1](http://blocklyduino.github.io/BlocklyDuino/blockly/apps/blocklyduino/index.html?url=examples/blink.xml) make default LED blink
* [demo 2](http://blocklyduino.github.io/BlocklyDuino/blockly/apps/blocklyduino/index.html?url=examples/servo_potentio.xml) control servo with potentio rotator
* [demo 3](http://blocklyduino.github.io/BlocklyDuino/blockly/apps/blocklyduino/index.html?url=examples/click_color.xml) click button to change LED colors

Or watch the [video demos](http://www.youtube.com/watch?v=_swiyXcUvNY)

### Run locally on your web browser

If you want to install it locally. Get code from github and open `blockly/apps/blocklyduino/index.html` in your browser.

The preffered way is to put the BlocklyDuino/web folder into a web server and open the url like localhost/public/blockly/apps/blocklyduino/index.html for use.

### Integrated Arduino upload

To avoid the tedious step of manually pasting code to the Arduino IDE, you can run a mini webserver that uses
the [Arduino IDE](https://www.arduino.cc/en/Main/Software) to upload the code to a connected Arduino board on Windows, Mac OS X and Linux systems.
Invoke this command from the BlocklyDuino root folder:

```
python arduino_web_server.py
```

You can optionally specify the port with `--port=COM3` (or `--port=/dev/tty.foo` on Linux and Mac); if you don't, it will try and guess which port to use.

When the webserver is running, you can access BlocklyDuino itself on [http://127.0.0.1:8080/](http://127.0.0.1:8080/).

### Usage

1. Open browser to BlocklyDuino, drag and drop blocks to make an Arduino program
2. Select the 'Arduino' tab and copy all of the source code into an existing or new project in the Arduino IDE
3. Press the 'Upload' button in the Arduino IDE to burn the code into a connected Arduino board

OR (if running `ino_web_server.py`):

1. Open browser to BlocklyDuino, drag and drop blocks to make an Arduino program.
2. Select the 'Arduino' tab and press the 'Upload' button. (press the 'Reset' button to upload an empty program)

### ChangeLog

Check changelog [here](https://github.com/BlocklyDuino/BlocklyDuino/blob/master/CHANGELOG.txt)

### Authors and Contributors
Fred Lin (@gasolin) .

Thanks Neil Fraser, Q.Neutron from Blockly https://developers.google.com/blockly/
Thanks Dale Low (gumbypp) for contribute the python server to pipe BlocklyDuino source to arduino board.
Thanks Arduino and Seeeduino guys for Arduino and Grove blocks.

The project is also inspired by [arduiblock](https://github.com/taweili/ardublock) and [modkit](http://www.modk.it/)

### License

Copyright (C) 2018~2019 Principia principia@icmc.usp.br
Copyright (C) 2012~2015 Fred Lin gasolin+blockly@gmail.com

 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
