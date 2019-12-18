goog.provide('Blockly.Blocks.ttzinho');

goog.require('Blockly.Blocks');

Blockly.Blocks['TTzinho_Frente'] = {
  init: function() {
    this.setColour(35);
    this.appendValueInput("TEMPO", 'Number')
        .appendField("TTzinho Frente")
        .setCheck('Number');
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setTooltip('Faz o Tira Tampa andar para frente.');
  }
};

Blockly.Blocks['TTzinho_Direita'] = {
  init: function() {
    this.setColour(35);
    this.appendValueInput("TEMPO", 'Number')
        .appendField("TTzinho Direita");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setTooltip('Vira o Tira Tampa virar para Direita.');
  }
};

Blockly.Blocks['TTzinho_Velocidade'] = {
  init: function() {
    this.setColour(35);
    this.appendValueInput("VELOCIDADE", 'Number')
        .appendField("TTzinho Velocidade");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setTooltip('Muda a velocidade do TTzinho. Aceita de 0 à 255.');
  }
};

Blockly.Blocks['TTzinho_Esquerda'] = {
  init: function() {
    this.setColour(35);
    this.appendValueInput("TEMPO", 'Number')
        .appendField("TTzinho Esquerda");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setTooltip('Vira o Tira Tampa virar para Esquerda.');
  }
};

Blockly.Blocks['TTzinho_Para'] = {
  init: function() {
    this.setColour(35);
    this.appendValueInput("TEMPO", 'Number')
        .appendField("TTzinho Para");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setTooltip('Para o Tira Tampa.');
  }
};

Blockly.Blocks['TTzinho_Tras'] = {
  init: function() {
    this.setColour(35);
    this.appendValueInput("TEMPO", 'Number')
        .appendField("TTzinho Tras");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setTooltip('Para o Tira Tampa.');
  }
};

