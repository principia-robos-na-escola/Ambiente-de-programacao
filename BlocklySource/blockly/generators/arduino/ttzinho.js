var definition_ttzinho = "#include <analogWrite.h>\n" +
	"#define IN1 21\n"+
	"#define IN2 19\n"+
	"#define IN3 18\n"+
	"#define IN4 5\n\n"+
	"int velocidade = 100;\n\n"; 

var setup_ttzinho = " pinMode(IN1, OUTPUT);\n"+
 " pinMode(IN2, OUTPUT);\n"+
 " pinMode(IN3, OUTPUT);\n"+
 " pinMode(IN4, OUTPUT);\n"+
 " analogWriteFrequency(200);  \n"+
 " analogWrite(IN1, 0);\n"+
 " analogWrite(IN2, 0);\n"+
 " analogWrite(IN3, 0);\n"+
 " analogWrite(IN4, 0);";

function code_ttzinho(a1,b1,a2,b2,TEMPO){
	return "analogWrite(IN1,"+a1+");\n" +
  " analogWrite(IN2,"+b1+");\n"+
	" analogWrite(IN3,"+a2+");\n"+
  " analogWrite(IN4, "+b2+");\n"+
	" for(int i = 0;i < (int)" + TEMPO + ";i++) {\n"+
	" \tdelay(10);\n"+
	" \tArduinoOTA.handle();\n"+
	" \tserver.handleClient();\n"+
	" }\n";
}

var definitions_OTA = '#include <ArduinoOTA.h>\n'+
'#include <WiFi.h>\n'+
'#include <WebServer.h>\n'+
'const char *ssid = "ESP32 Access Point";\n'+
'const char *password = "your-password";\n'+
'WebServer server(80);\n'+
'void handleRoot() {\n'+
'  server.send(200, "text/plain", "Hello from ESP32 !");\n'+
'}\n'+
'void handleNotFound() {\n'+
'  String message = "File Not Found\\n\\n";\n'+
'  message += "URI: ";\n'+
'  message += server.uri();\n'+
'  message += "\\nMethod: ";\n'+
'  message += (server.method() == HTTP_GET) ? "GET" : "POST";\n'+
'  message += "\\nArguments: ";\n'+
'  message += server.args();\n'+
'  message += "\\n";\n'+
'  for (uint8_t i = 0; i < server.args(); i++) {\n'+
'    message += " " + server.argName(i) + ": " + server.arg(i) + "\\n";\n'+
'  }\n'+
'  server.send(404, "text/plain", message);\n'+
'}\n';


var setup_OTA = '\n'+
'  Serial.println("Booting");\n'+
'  WiFi.softAP(ssid, password);\n'+
'  Serial.print("Access Point ");\n'+
'  Serial.print(ssid);\n'+
'  Serial.println(" started");\n'+
'  Serial.print("IP address:   ");\n'+
'  Serial.println(WiFi.softAPIP());\n'+
'  server.on("/", handleRoot);\n'+
'  server.onNotFound(handleNotFound);\n'+
'  server.on("/ligaled", []() {\n'+
'    server.send(200, "text/plain", "ligou");\n'+
'    digitalWrite(LED_BUILTIN, HIGH);\n'+
'  });\n'+
'  server.on("/desligaled", []() {\n'+
'    server.send(200, "text/plain", "apagou");\n'+
'    digitalWrite(LED_BUILTIN, LOW);\n'+
'  });\n'+
'  server.begin();\n'+
'  Serial.println("HTTP server started");\n'+
'  ArduinoOTA.onStart([]() {\n'+
'    String type;\n'+
'    if (ArduinoOTA.getCommand() == U_FLASH) {\n'+
'      type = "sketch";\n'+
'    } else {\n'+
'      type = "filesystem";\n'+
'    }\n'+
'    Serial.println("Start updating " + type);\n'+
'  });\n'+
'  ArduinoOTA.onEnd([]() {\n'+
'    Serial.println("\\nEnd");\n'+
'  });\n'+
'  ArduinoOTA.onProgress([](unsigned int progress, unsigned int total) {\n'+
'    Serial.printf("Progress: %u%%\\r", (progress / (total / 100)));\n'+
'  });\n'+
'  ArduinoOTA.onError([](ota_error_t error) {\n'+
'    Serial.printf("Error[%u]: ", error);\n'+
'    if (error == OTA_AUTH_ERROR) {\n'+
'      Serial.println("Auth Failed");\n'+
'    } else if (error == OTA_BEGIN_ERROR) {\n'+
'      Serial.println("Begin Failed");\n'+
'    } else if (error == OTA_CONNECT_ERROR) {\n'+
'      Serial.println("Connect Failed");\n'+
'    } else if (error == OTA_RECEIVE_ERROR) {\n'+
'      Serial.println("Receive Failed");\n'+
'    } else if (error == OTA_END_ERROR) {\n'+
'      Serial.println("End Failed");\n'+
'    }\n'+
'  });\n'+
'  ArduinoOTA.begin();\n'+
'  Serial.println("Ready");\n';

Blockly.Arduino.TTzinho_Frente = function() {
	var TEMPO = Blockly.Arduino.valueToCode(this, 'TEMPO', Blockly.Arduino.ORDER_ATOMIC) || '0';
	TEMPO /= 10;
	Blockly.Arduino.definitions_['define_pins_WIFIServer_OTA'] = definitions_OTA;
	Blockly.Arduino.setups_['setup_serial_' + profile.default.serial] = 'Serial.begin(' + profile.default.serial + ');\n';
	Blockly.Arduino.setups_['setup_output_2'] = 'pinMode(LED_BUILTIN, OUTPUT);\n';
	Blockly.Arduino.setups_['setup_OTA_principia'] = setup_OTA;
	Blockly.Arduino.definitions_['definition_tiratampa_'] = definition_ttzinho;
	Blockly.Arduino.setups_['setup_tiratampa_'] = setup_ttzinho;
	var code = code_ttzinho("velocidade",0,"velocidade",0,TEMPO);
	return code;
};

Blockly.Arduino.TTzinho_Velocidade = function() {
	var VELOCIDADE = Blockly.Arduino.valueToCode(this, 'VELOCIDADE', Blockly.Arduino.ORDER_ATOMIC) || '0';
	Blockly.Arduino.definitions_['definition_tiratampa_'] = definition_ttzinho;
	Blockly.Arduino.setups_['setup_tiratampa_'] = setup_ttzinho;
	var code = ' velocidade = '+VELOCIDADE+';';
	return code;
};

Blockly.Arduino.TTzinho_Esquerda = function() {
	var TEMPO = Blockly.Arduino.valueToCode(this, 'TEMPO', Blockly.Arduino.ORDER_ATOMIC) || '0';
	TEMPO /= 10;
	Blockly.Arduino.definitions_['define_pins_WIFIServer_OTA'] = definitions_OTA;
	Blockly.Arduino.setups_['setup_serial_' + profile.default.serial] = 'Serial.begin(' + profile.default.serial + ');\n';
	Blockly.Arduino.setups_['setup_output_2'] = 'pinMode(LED_BUILTIN, OUTPUT);\n';
	Blockly.Arduino.setups_['setup_OTA_principia'] = setup_OTA;
	Blockly.Arduino.definitions_['definition_tiratampa_'] = definition_ttzinho;
	Blockly.Arduino.setups_['setup_tiratampa_'] = setup_ttzinho;
	var code = code_ttzinho("velocidade",0,0,"velocidade",TEMPO);
	return code;
};

Blockly.Arduino.TTzinho_Direita = function() {
	var TEMPO = Blockly.Arduino.valueToCode(this, 'TEMPO', Blockly.Arduino.ORDER_ATOMIC) || '0';
	TEMPO /= 10;
	Blockly.Arduino.definitions_['define_pins_WIFIServer_OTA'] = definitions_OTA;
	Blockly.Arduino.setups_['setup_serial_' + profile.default.serial] = 'Serial.begin(' + profile.default.serial + ');\n';
	Blockly.Arduino.setups_['setup_output_2'] = 'pinMode(LED_BUILTIN, OUTPUT);\n';
	Blockly.Arduino.setups_['setup_OTA_principia'] = setup_OTA;
	Blockly.Arduino.definitions_['definition_tiratampa_'] = definition_ttzinho;
	Blockly.Arduino.setups_['setup_tiratampa_'] = setup_ttzinho;
	var code = code_ttzinho(0,"velocidade","velocidade",0,TEMPO);
	return code;
};

Blockly.Arduino.TTzinho_Tras = function() {
	var TEMPO = Blockly.Arduino.valueToCode(this, 'TEMPO', Blockly.Arduino.ORDER_ATOMIC) || '0';
	TEMPO /= 10;
	Blockly.Arduino.definitions_['define_pins_WIFIServer_OTA'] = definitions_OTA;
	Blockly.Arduino.setups_['setup_serial_' + profile.default.serial] = 'Serial.begin(' + profile.default.serial + ');\n';
	Blockly.Arduino.setups_['setup_output_2'] = 'pinMode(LED_BUILTIN, OUTPUT);\n';
	Blockly.Arduino.setups_['setup_OTA_principia'] = setup_OTA;
	Blockly.Arduino.definitions_['definition_tiratampa_'] = definition_ttzinho;
	Blockly.Arduino.setups_['setup_tiratampa_'] = setup_ttzinho;
	var code = code_ttzinho(0,"velocidade",0,"velocidade",TEMPO);
	return code;
};

Blockly.Arduino.TTzinho_Para = function() {
	var TEMPO = Blockly.Arduino.valueToCode(this, 'TEMPO', Blockly.Arduino.ORDER_ATOMIC) || '0';
	TEMPO /= 10;
	Blockly.Arduino.definitions_['define_pins_WIFIServer_OTA'] = definitions_OTA;
	Blockly.Arduino.setups_['setup_serial_' + profile.default.serial] = 'Serial.begin(' + profile.default.serial + ');\n';
	Blockly.Arduino.setups_['setup_output_2'] = 'pinMode(LED_BUILTIN, OUTPUT);\n';
	Blockly.Arduino.setups_['setup_OTA_principia'] = setup_OTA;
	Blockly.Arduino.definitions_['definition_tiratampa_'] = definition_ttzinho;
	Blockly.Arduino.setups_['setup_tiratampa_'] = setup_ttzinho;
	var code = code_ttzinho(0,0,0,0,TEMPO);
	return code;
};
