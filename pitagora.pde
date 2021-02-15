//2-3-30 2620190619
//SekiguchiYuto
//pitagora

import fisica.*;
PFont font;

FWorld world;
FBox obstacle;
FCircle circle;

int a=0;
float x=0;
float time=0;
float h=0;
int A=0;


void setup()
{
  size(1024, 576);
  Fisica.init(this);
  world=new FWorld();
  world.setGravity(0, 300);

  for (int i=0; i<3; i++)//最初の四角三個（左）
  {
    obstacle = new FBox(100, 10);
    obstacle.setRotation(PI/7);
    obstacle.setPosition(40, 70+i*100);
    obstacle.setStatic(true);
    obstacle.setFill(129, 87, 42);
    obstacle.setRestitution(0);
    obstacle.setNoStroke();
    world.add(obstacle);
  } 
  for (int i=0; i<3; i++)//最初の四角三個（右）
  {
    obstacle = new FBox(100, 10);
    obstacle.setRotation(-PI/7);
    obstacle.setPosition(115, 110+i*100);
    obstacle.setStatic(true);
    obstacle.setFill(129, 87, 42);
    obstacle.setRestitution(0);
    obstacle.setNoStroke();
    world.add(obstacle);
  }
  //道
  obstacle = new FBox(150, 10);
  obstacle.setRotation(PI/4);
  obstacle.setPosition(40, 68+3*100);
  obstacle.setStatic(true);
  obstacle.setFill(129, 87, 42);
  obstacle.setRestitution(0);
  obstacle.setNoStroke();
  world.add(obstacle);
  obstacle = new FBox(250, 10);
  obstacle.setPosition(215, 420);
  obstacle.setStatic(true);
  obstacle.setFill(129, 87, 42);
  obstacle.setNoStroke();
  obstacle.setRestitution(0);
  world.add(obstacle);
  obstacle = new FBox(90, 10);
  obstacle.setPosition(100, 385);
  obstacle.setStatic(true);
  obstacle.setFill(129, 87, 42);
  obstacle.setNoStroke();
  obstacle.setRestitution(0);
  world.add(obstacle);
  for (int i=0; i<7; i++)//ドミノ
  {

    obstacle = new FBox(7, 51);
    obstacle.setDensity(1000);
    obstacle.setPosition(150+20*i, 389);
    obstacle.setFill(0, 35*i, 0);
    obstacle.setRestitution(0);
    world.add(obstacle);
  }

  //土台
  FPoly poly = new FPoly();
  poly.setFill(129, 87, 42);
  poly.vertex(550, height-100);
  poly.vertex(700, height-100);
  poly.vertex(700, height);
  poly.vertex(450, height);
  poly.setStatic(true);
  poly.setRestitution(0);
  world.add(poly);

  //てこ１
  obstacle = new FBox(350, 10);
  obstacle.setPosition(550, height-107);
  obstacle.setFill(193, 55, 59);
  obstacle.setRestitution(0);
  obstacle.setNoStroke();
  world.add(obstacle);

  //てこの上に乗ってるボール1
  FCircle ball2=new FCircle(15);
  ball2.setPosition(690, height-120);
  ball2.setDensity(0.012);
  ball2.setFill(255, 0, 0);
  ball2.setFriction(0);
  world.add(ball2);

  //てこの上の三角形
  poly = new FPoly();
  poly.setFill(129, 87, 42);
  poly.vertex(500, height-300);
  poly.vertex(600, height-200);
  poly.vertex(500, height-200);
  poly.setStatic(true);
  poly.setRestitution(0.5 );
  world.add(poly);

  //ジャンプ台1
  obstacle = new FBox(50, 10);
  obstacle.setPosition(730, height-30);
  obstacle.setFill(50, 134, 94);
  obstacle.setRestitution(2);
  obstacle.setStatic(true);
  obstacle.setNoStroke();
  world.add(obstacle);

  //ジャンプ台2
  obstacle = new FBox(50, 10);
  obstacle.setPosition(795, height-130);
  obstacle.setFill(50, 134, 94);
  obstacle.setRestitution(2);
  obstacle.setRotation(PI/30);
  obstacle.setStatic(true);
  obstacle.setNoStroke();
  world.add(obstacle);

  //ジャンプ台3
  obstacle = new FBox(50, 10);
  obstacle.setPosition(875, height-160);
  obstacle.setFill(50, 134, 94);
  obstacle.setRestitution(3.5);
  obstacle.setRotation(-PI/20);
  obstacle.setStatic(true);
  obstacle.setNoStroke();
  world.add(obstacle);

  //曲線
  for (float t=0; t<1.0; t+=0.01) {
    float A=(1-t)*(1-t)*(1-t);
    float B=(1-t)*(1-t)*3*t;
    float C=3*t*t*(1-t);
    float D=t*t*t;
    float x1=A*(630)+B*(680)+C*(790)+D*(830);
    float y1=A*(100)+B*(270)+C*(300)+D*(290);
    ball2=new FCircle(3);
    ball2.setPosition(x1, y1);
    ball2.setNoStroke();
    ball2.setFill(255-255*t, 255-255*t, 255-255*t);
    ball2.setStatic(true);
    ball2.setFriction(0);
    world.add(ball2);
  }
  //ジグザグの道
  poly = new FPoly();
  poly.setFill(255, 142, 3);
  poly.vertex(970, height-200);
  poly.vertex(950, height-150);
  poly.vertex(970, height-100);
  poly.vertex(950, height-50);
  poly.vertex(970, height);
  poly.vertex(950, height+50);
  poly.vertex(970, height+100);
  poly.vertex(990, height+100);
  poly.vertex(970, height+50);
  poly.vertex(990, height);
  poly.vertex(970, height-50);
  poly.vertex(990, height-100);
  poly.vertex(970, height-150);
  poly.vertex(990, height-200);
  poly.setStatic(true);
  poly.setRestitution(0);
  world.add(poly);
  poly = new FPoly();
  poly.setFill(255, 142, 3);
  poly.vertex(1010, height-200);
  poly.vertex(990, height-150);
  poly.vertex(1010, height-100);
  poly.vertex(990, height-50);
  poly.vertex(1010, height);
  poly.vertex(990, height+50);
  poly.vertex(1010, height+100);
  poly.vertex(1030, height+100);
  poly.vertex(1010, height+50);
  poly.vertex(1030, height);
  poly.vertex(1010, height-50);
  poly.vertex(1030, height-100);
  poly.vertex(1010, height-150);
  poly.vertex(1030, height-200);
  poly.setStatic(true);
  poly.setRestitution(0);
  world.add(poly);

  //道
  obstacle = new FBox(800, 5);
  obstacle.setDensity(1000);
  obstacle.setPosition((width/2)+180, height+517);
  obstacle.setFill(0, 0, 0);
  obstacle.setRestitution(0);
  obstacle.setStatic(true);
  obstacle.setRotation(PI/40);
  world.add(obstacle);

  //道
  obstacle = new FBox(500, 5);
  obstacle.setDensity(1000);
  obstacle.setPosition((width/2)+400, height+130);
  obstacle.setFill(0, 0, 0);
  obstacle.setRestitution(0);
  obstacle.setStatic(true);
  obstacle.setRotation(-PI/30);
  world.add(obstacle);

  obstacle = new FBox(30, 5);
  obstacle.setDensity(1000);
  obstacle.setPosition((width/2)+120, height+163);
  obstacle.setFill(0, 0, 0);
  obstacle.setRestitution(0);
  obstacle.setStatic(true);
  world.add(obstacle);

  poly = new FPoly();
  poly.setFill(255, 255, 0);
  poly.vertex(600, height+230);
  poly.vertex(800, height+240);
  poly.vertex(800, height+250);
  poly.vertex(600, height+240);
  poly.setStatic(true);
  world.add(poly);

  poly = new FPoly();
  poly.setFill(255, 255, 0);
  poly.vertex(700, height+280);
  poly.vertex(1000, height+280);
  poly.vertex(1000, height+290);
  poly.vertex(700, height+290);
  poly.setStatic(true);
  world.add(poly);

  for (int i=0; i<7; i++)//ドミノ
  {
    obstacle = new FBox(5, 51);
    obstacle.setDensity(0.05*i+0.01);
    obstacle.setPosition(810+20*i, height+250);
    obstacle.setFill(0, 35*i, 0);
    obstacle.setRestitution(0);
    world.add(obstacle);
  }

  obstacle = new FBox(70, 5);
  obstacle.setDensity(1000);
  obstacle.setPosition((width/2)+610, height+570);
  obstacle.setFill(7, 216, 180);
  obstacle.setRestitution(10);
  obstacle.setRotation(PI/8);
  obstacle.setStatic(true);
  world.add(obstacle);

  obstacle=new FBox(10, 150);
  obstacle.setPosition((width/2)+1000, height+270);
  obstacle.setFill(255);
  obstacle.setRestitution(0);
  obstacle.setStatic(true);
  world.add(obstacle);

  obstacle = new FBox(300, 5);
  obstacle.setDensity(1000);
  obstacle.setPosition((width/2)-50, height+250);
  obstacle.setFill(255, 255, 0);
  obstacle.setRestitution(0);
  obstacle.setStatic(true);
  obstacle.setRotation(-PI/8);
  world.add(obstacle);


  obstacle = new FBox(200, 5);
  obstacle.setDensity(1000);
  obstacle.setPosition((width/2)-200, height+370);
  obstacle.setFill(0, 0, 0);
  obstacle.setRestitution(0);
  obstacle.setStatic(true);
  obstacle.setRotation(PI/4);
  world.add(obstacle);

  obstacle = new FBox(50, 5);
  obstacle.setDensity(1000);
  obstacle.setPosition((width/2)-290, height+270);
  obstacle.setFill(0, 0, 0);
  obstacle.setRestitution(0);
  obstacle.setStatic(true);
  obstacle.setRotation(-PI/3);
  world.add(obstacle);

  //時計の上の道

  obstacle = new FBox(180, 2);
  obstacle.setDensity(1000);
  obstacle.setPosition((width/2)-35, height+59);
  obstacle.setFill(0, 0, 0);
  obstacle.setRestitution(0);
  obstacle.setStatic(true);
  obstacle.setRotation(PI/100);
  world.add(obstacle);
  obstacle = new FBox(250, 2);
  obstacle.setDensity(1000);
  obstacle.setPosition((width/2)+50, height+95);
  obstacle.setFill(0, 0, 0);
  obstacle.setRestitution(0);
  obstacle.setStatic(true);
  obstacle.setRotation(-PI/100);
  world.add(obstacle);

  //てこ
  obstacle = new FBox(250, 5);
  obstacle.setDensity(0.1);
  obstacle.setPosition((width/2)+50, height+353);
  obstacle.setFill(0, 0, 0);
  obstacle.setRestitution(0);
  world.add(obstacle);

  //ゴール地点の箱
  poly=new FPoly();
  poly.setFill(0, 0, 0);
  poly.vertex((width/2)+950, height+460);
  poly.vertex((width/2)+945, height+460);
  poly.vertex((width/2)+945, height+580);
  poly.vertex((width/2)+995, height+580);
  poly.vertex((width/2)+995, height+460);
  poly.vertex((width/2)+990, height+460);
  poly.vertex((width/2)+990, height+575);
  poly.vertex((width/2)+950, height+575);
  poly.setStatic(true);
  world.add(poly);

  //てこの下の三角1
  poly=new FPoly();
  poly.setDensity(1000);
  poly.setRestitution(0);
  poly.setFill(0, 0, 255);
  poly.vertex((width/2)+50, height+350);
  poly.vertex((width/2)+65, height+370);
  poly.vertex((width/2)+35, height+370);
  poly.setStatic(true);
  world.add(poly);
  //てこの下の三角2
  poly=new FPoly();
  poly.setDensity(1);
  poly.setRestitution(0);
  poly.setFill(0, 0, 255);
  poly.vertex((width/2)-40, height+350);
  poly.vertex((width/2)-55, height+370);
  poly.vertex((width/2)-25, height+370);
  poly.setStatic(true);
  world.add(poly);



  //小さいボールが入る箱
  poly=new FPoly();
  poly.setStatic(true);
  poly.setFill(0);
  poly.vertex((width/2)+185, height+400);
  poly.vertex((width/2)+185, height+420);
  poly.vertex((width/2)+205, height+420);
  poly.vertex((width/2)+205, height+400);
  poly.vertex((width/2)+210, height+400);
  poly.vertex((width/2)+210, height+425);
  poly.vertex((width/2)+180, height+425);
  poly.vertex((width/2)+180, height+400);
  world.add(poly);

  //ドミノの横にあるボール
  FCircle ball=new FCircle(30);
  ball.setPosition(295, 398);
  ball.setFill(7, 82, 2);
  ball.setFriction(0);
  ball.setDensity(1000);
  world.add(ball);

  //下画面1番初めのボール
  ball=new FCircle(30);
  ball.setPosition((width/2)+135, height+135);
  ball.setFill(255, 3, 171);
  ball.setFriction(0);
  ball.setRestitution(0);
  ball.setDensity(0.001);
  world.add(ball);

  //下画面ドミノ横のボール
  ball=new FCircle(30);
  ball.setPosition(980, height+220);
  ball.setFill(21, 128, 255);
  ball.setRestitution(0);
  ball.setFriction(0);
  ball.setDensity(0.1);
  world.add(ball);

  //てこの上のボール
  ball=new FCircle(30);
  ball.setPosition((width/2)-60, height+330);
  ball.setFill(255, 112, 3);
  ball.setFriction(0);
  ball.setDensity(0.001);
  ball.setRestitution(0);
  world.add(ball);

  //時計の針
  obstacle=new FBox(5, 90);
  obstacle.setPosition(393, height+126);
  obstacle.setFill(0);
  obstacle.setRotation(PI/3);
  obstacle.setStatic(true);
  obstacle.setRestitution(0);
  world.add(obstacle);

  obstacle=new FBox(5, 100);
  obstacle.setPosition(333, height+195);
  obstacle.setFill(0);
  obstacle.setRotation(PI/8);
  obstacle.setStatic(true);
  obstacle.setRestitution(0);
  world.add(obstacle);

  frameRate(1000);
}

void draw()
{
  smooth();

  if ((a>=1&&x>=-270))
  {
    x-=0.1;
  }
  translate(x, h);
  background(#CEAD89);
  for (int ly=0; ly<height+600; ly+=50)
  {
    strokeWeight(2);
    stroke(#C19769);
    line(0, ly, width+1000, ly);
  }
  for (int lx=0; lx<width+1000; lx+=200)
  {
    for (int ly=0; ly<height+600; ly+=100)
    {
      line(lx, ly, lx, ly+50);
    }
  }
  for (int lx=100; lx<width+1000; lx+=200)
  {
    for (int ly=50; ly<height+600; ly+=100)
    {
      line(lx, ly, lx, ly+50);
    }
  }
  if (time>=150&&time<=180)
  {
    h-=2;
  }
  if (time>=250&&time<=300)
  {
    x-=0.5;
  }

  if (a>=1)
  {
    time+=0.1;
  }
  //時計
  stroke(0);
  fill(255);
  ellipse(350, height+150, 200, 200);
  ellipse(350, height+150, 5, 5);
  textSize(30);
  fill(0);
  text("12", 330, height+80);
  text("11", 290, height+95);
  text("10", 260, height+125);
  text("9", 255, height+160);
  text("8", 265, height+200);
  text("7", 295, height+230);
  text("6", 335, height+245);
  text("5", 385, height+230);
  text("4", 415, height+200);
  text("3", 425, height+160);
  text("2", 415, height+120);
  text("1", 385, height+90);
  world.step();
  world.draw();
  if (time>=369)
  {
    fill(255, 255, 255);
    font=createFont("MS P明朝", 20);
    textFont(font);
    text("ピ", width+455, height+483);
    text("タ", width+440, height+510);
    text("ゴ", width+455, height+540);
    text("ラ", width+440, height+570);
  }
  if (time>=370)
  {
    fill(255, 0, 0);
    textSize(50);
    text("Congratulations!!", width, height+400);
  }

  //バスケットゴール
  for (float t=0; t<1.0; t+=0.05) {
    float A=(1-t)*(1-t)*(1-t);
    float B=(1-t)*(1-t)*3*t;
    float C=3*t*t*(1-t);
    float D=t*t*t;
    float x1=A*((width/2)+993)+B*((width/2)+985)+C*((width/2)+980)+D*((width/2)+980);
    float y1=A*(height+300)+B*(height+317)+C*(height+327)+D*(height+347);
    strokeWeight(2);
    stroke(127);
    ellipse(x1, y1, 1, 1);
  }
  for (float t=0; t<1.0; t+=0.05) {
    float A=(1-t)*(1-t)*(1-t);
    float B=(1-t)*(1-t)*3*t;
    float C=3*t*t*(1-t);
    float D=t*t*t;
    float x1=A*((width/2)+934)+B*((width/2)+942)+C*((width/2)+947)+D*((width/2)+947);
    float y1=A*(height+300)+B*(height+317)+C*(height+327)+D*(height+347);
    ellipse(x1, y1, 1, 1);
  }
  strokeWeight(5);
  stroke(222, 92, 92);
  fill(255);
  ellipse((width/2)+963, height+300, 60, 10);
}

void keyPressed()
{
  if (key==' ') {
    a++;
    if (a==1)
    {
      FCircle ball=new FCircle(20);
      ball.setDensity(1000);
      ball.setPosition(0, 0);
      ball.setFill(255, 0, 0);
      ball.setFriction(0);
      world.add(ball);
    }
  }
}
