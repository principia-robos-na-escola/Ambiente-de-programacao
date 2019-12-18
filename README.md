# Ambiente-de-programacao

Este é um projeto baseado no [BlocklyDuino](https://github.com/BlocklyDuino/BlocklyDuino)
no qual adicionamos a capacidade de programar um ESP32 via Wi-Fi.

## Como Instalar
### Este tutorial ensina a fazer a instalação em um sistema Ubuntu - testado no 18.04

- *clone* este repositório com

`git clone https://github.com/principia-robos-na-escola/Ambiente-de-programacao.git`

- O software de programação do ESP32 necessita da biblioteca python-serial. Instale-a com

`sudo apt install python-serial`

- Mude para o diretório 'BlocklySource'

`cd Ambiente-de-programacao/BlocklySource`

- Para executar o BlocklyDuino, use o comando

`python esp32_web_server.py`

**Obs:** Atualmente o padrão do Ubuntu tem python como *symlink* para o python2.
Caso haja algum erro após a execução desse último comando, pode ser que a sua versão do Ubuntu
tenha atualizado este *link* para python3. Re-execute o comando substituindo `python` por `python2`


## Esquemático do Robozinho

![Esquematico TiraTampinha](imgs/tt.jpg)
