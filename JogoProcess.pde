PImage img;
PImage blue;
PImage orange;
PImage yellow;
PImage green;
PImage cross;
PImage aim;
PFont FontVCR;
PFont FontVCR36;
boolean a;
float Xb = 0;
float Yb = 300;
float V = 3;
float VBost = 0.005; 
float Dist = 0;
float angle, angle2;
float radius = 50;
float frequency = 5;
float frequency2 = 5;
int Min = 0;
int Seg = 15;
int var1 = 1;
int Azul = 150;
int Opacidade = 200;
int Opacidade2 = 255;
int Voltas = 0;
int XB1 = 20;
int YB1 = 30;
int XB2 = 150;
int YB2 = 30;
int XB3 = 340;
int YB3 = 30;
int XB4 = 480;
int YB4 = 30;
int Pts = 0;
int Time = 1500;
int Time2 = 0;
int Time3 = 0;

void setup() {
  size(598, 396);
  //fullScreen();
  img = loadImage("imagem.jpg");
  blue = loadImage("blueB.png");
  orange = loadImage("orangeB.png");
  green = loadImage("greenB.png");
  yellow = loadImage("yellowB.png");
  cross = loadImage("shot.png");
  aim = loadImage("aim.png");
  FontVCR = createFont("VCR OSD Mono.ttf", 72);
  FontVCR36 = createFont("VCR OSD Mono.ttf", 36);
}

void boneco(float Xp, float Yp, int Tipo) {
  switch(Tipo) {
  case 1:
    image(yellow, Xp, Yp, 120, 68);
    break;
  case 2:
    image(blue, Xp, Yp, 120, 68);
    break;
  case 3:
    image(orange, Xp, Yp, 120, 68);
    break;
  case 4:
    image(green, Xp, Yp, 120, 68);
    break;
  case 0:
    noStroke();
    fill(0, 0, 0, 0);
    ellipse(Xp, Yp, 20, 20);
  }
}

void mousePressed() {
  //if((mouseX>180) && (mouseX<410) && (mouseY>120) && (mouseY<190))
  a = true;
  if ((mouseX>XB1) && (mouseX<XB1+100) && (mouseY>YB1) && (mouseY<YB1+48)) var1=1;
  if ((mouseX>XB4) && (mouseX<XB4+100) && (mouseY>YB4) && (mouseY<YB4+48)) var1=4;
  if ((mouseX>XB2) && (mouseX<XB2+100) && (mouseY>YB2) && (mouseY<YB2+48)) var1=2;
  if ((mouseX>XB3) && (mouseX<XB3+100) && (mouseY>YB3) && (mouseY<YB3+48)) var1=3;
  //if((mouseX>(Xb-25)) && (mouseX<(Xb+25)) && (mouseY>(Yb-65)) && (mouseY<(Yb+25))) var1=0;
  if ((mouseX>Xb) && (mouseX<(Xb+120)) && (mouseY>Yb) && (mouseY<(Yb+68))) { 
    Pts = Pts + 1;
    V = V + 1;
  }
  // if((mouseX>548) && (mouseX<588) && (mouseY>346) && (mouseY<386)) V=V+1;
  //if((mouseX>10) && (mouseX<50) && (mouseY>346) && (mouseY<386)) V=V-1;
}

void draw() {
  background(img);


  // botão 1
  image(yellow, XB1, YB1, 100, 48);
  // botão 2
  image(blue, XB2, YB2, 100, 48);
  // botão 3
  image(orange, XB3, YB3, 100, 48);
  // botão 4
  image(green, XB4, YB4, 100, 48);
  // botão 5
  //noStroke();
  // fill(255,255,255,Opacidade);
  // triangle(10,366,50,346,50,386);
  //botão 6
  // fill(255,255,255,Opacidade);
  //triangle(588,366,548,346,548,386);

  //---------------------------

  //---------------------------

  if (a) {

    noCursor();
    Opacidade2 = Opacidade2 - 2;
    boneco(Xb, Yb, var1);
    //V = V + VBost;
    Xb = Xb + V;
    Yb = 225 + sin(radians(angle))*(radius);
    angle -= frequency;
    Time2++;

    // Cross -------------------
    image(aim, mouseX-16, mouseY-16, 32, 32);
    image(cross, mouseX, height-100, 300, 100);


    if (Xb>(width+30)) { 
      Xb = -30; //Vai e volta para o começo da tela
      //V = V * -1; // Vai e volta 
      //angle = 0 ------ (Reset of the angle at the final of the screen)
    }
    if (Xb<-30) {
      Xb = 627; //Vai e volta para o começo da tela
      // V = V * -1; // Vai e volta
      //angle = 0; ----- (Reset of the angle at the final of the screen)
    }
    if (Xb == -30) Voltas = Voltas + 1;
    if (V>0) Dist = Dist + V;
    if (V<0) Dist = Dist + V;

    Time--;
    Time3++;
    if (Time3>=100) {
      Time3=0;
      Seg--;
    }
    if (Time <= 0) {
      Xb = 0;
      Xb = Xb;
      Yb = 0;
      Yb = Yb + 0;
      Time = 0;
      V = 0;
      Dist = Dist + 0;
      fill(255);
      rect(0, 0, 598, 398);
      textFont(FontVCR);
      fill(0);
      text("Time Over", width/2, 150);
      text(Pts, width/2, 250);
    }
    if (Time2 >= 1500) {
      Time2 = 1500;
    }
  }

  // Placar-------------------- 

  textFont(FontVCR);
  //textSize(72);
  fill(255, 255);
  text(Pts, 299, 355);
  textAlign(CENTER, CENTER);
  //fill(0);
  fill(0, Opacidade2);
  text("Start", width/2, 145);
  fill(255);
  textFont(FontVCR36);
  text(Seg, 299, 40);


  // Console -----------------

  String T1 = "A Velocidade é";
  String T2 = "A posição X é";
  String T3 = "Boneco Número";
  String T4 = "//";
  String T5 = "Volta Numero";
  String T6 = "Distância Percorrida";
  String T7 = "px";
  String T8 = "Pontos";
  String T9 = "Time";
  String T10 = "/1500";
  String T11 = "A posição Y é";
  println(T8, Pts, T4, T9, Time2, T10, T4, T1, V, T4, T5, Voltas, T4, T6, Dist, T7, T4, T2, Xb, T4, T11, Yb, T4, T3, var1);
}