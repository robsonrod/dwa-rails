/*
Obetivo: Ler dados do LDR (Sensor de Luminosidade) e disponibiliza-los via porta serial
Funcinamento: Quanto menos luz mais LEDS acesos e quanto mais luz menos leds acesos
*/

int ledPins[] = { 14,1,2,3,4,5,8,6,13 }; // Lista de Leds a serem ligados
int valor; //Variavel para guardar o valor de luminosidade
int analogin = 5; // Pino onde vamos ligar a LDR

void setup(){

    Serial.begin(9600); // Inicia A comunicação da porta Serial para que possamos ver o valor do LDR

    for(int x =0; x < 9; x++){
        pinMode(ledPins[x], OUTPUT);
    }

}

void loop(){
  valor = analogRead(analogin); //Lê o valor da luminosidade do LDR

  Serial.print("O valor do LDR e igual a: ");  // Mostrar no console a frase “O valor do LDR e igual a: “
  Serial.println(valor); // Mostra no Serial Monitor o valor da variavel “valor”
  delay(100); // Faz uma pequena pausa de 100 Milisegundos

  int ledParaLigar = map (valor, 0, 850, 0, 9); // Mapeia o valor do LDR, verifica o range (0 .. 850) e esse valor
                                                //a um de para com os leds menor que 9


  for (int x = 0; x < ledParaLigar; x++){ // Varre a lista de leds para ligar conforme a luminosidade
      digitalWrite(ledPins[x], HIGH); // Liga os lead
      delay(100);  // Faz uma pequena pausa de 100 Milisegundos
  }

  for (int x = 0; x < ledParaLigar; x++){ // Varre a lista de leds para apagar conforme a luminosidade
      digitalWrite(ledPins[x], LOW); // Apaga os Leds
      delay(100);  // Faz uma pequena pausa de 100 Milisegundos
  }

}

