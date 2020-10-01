<p align="center">
  <img src="imgs/logo.jpg"/>
  <h1 align="center">Ambiente de Programação</h1>
</p>

Este é um projeto baseado no [BlocklyDuino](https://github.com/BlocklyDuino/BlocklyDuino)
no qual adicionamos a capacidade de programar um ESP32 via Wi-Fi.

O 'sistema' é baseado no IDF da Espressif para a compilação dos programas, junto com um script
feito pelo [Soneca](https://www.github.com/FranPedrosa) que é significativamente mais rápido na compilação dos
programas quando comparado à IDE do Arduino.

# Como Instalar e executar
Este tutorial ensina a fazer a instalação em um sistema Ubuntu - testado no 18.04.

- Instale as dependências do projeto.
  
  `sudo apt install python-serial`

- *clone* este repositório com

  `git clone https://github.com/principia-robos-na-escola/Ambiente-de-programacao.git`

- Mude para o diretório 'BlocklySource'

  `cd Ambiente-de-programacao/BlocklySource`

- Execute o script de precompilação com

  `sh precompile.sh`

   A *IDE* do Arduino recompila todas as bibliotecas sempre que o *sketch* é alterado, gastando tempo uma vez que as bibliotecas não mudam. O _precompile.sh_ elimina esse processo compilando-as uma única vez, gerando o arquivo `core.a`.

- Para executar o BlocklyDuino, use o comando

   `python esp32_web_server.py`

**Obs:** Atualmente o padrão do Ubuntu tem python como *symlink* para o python2.
Caso haja algum erro após a execução desse último comando, pode ser que a sua versão do Ubuntu
tenha atualizado este *link* para python3. Re-execute o comando substituindo `python` por `python2`

## Exemplos de códigos para os Robozinhos

Alguns exemplos podem ser encontrado [neste repositório](https://www.github.com/principia-robos-na-escola/SoftwareESP32).

Em um dos [exemplos incluídos](https://github.com/principia-robos-na-escola/SoftwareESP32/blob/master/Anda-com-Sonar/RobotControlAndroidSonar2.ino),
o robô detecta obstáculos com o uso dos sonares e *tenta* desviar desses obstáculos.

O segundo exemplo permite o controle via Wi-Fi, usando um [aplicativo para celulares Android](https://github.com/simoesusp/Android_Remote_Control). O envio de comandos é feito via requisições GET,
logo podemos também controlar o robô via *web-browser* (não recomendamos, porém).


## Esquemático do Robozinho

![Esquematico TiraTampinha](imgs/tt.jpg)
