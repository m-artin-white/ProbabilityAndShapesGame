float x = 0; //This tab is used to create a class based around the shapes that are displayed on screen.
float y = 0; // Starting from the top I have declared multiple global variables that will be used in the class and the main program.
float z =0; //x,y,z,a,b,c are each the shapes corresponding x values.
float a = 0;
float b = 0;
float c = 0;
String seq =""; //Sequence holder for the drawn shapes
float randomS = 2; //Speed of sequence.
float c1 =x, c2=y, c3=z, c4=a,c5=b,c6=c; //Variables used to capture the x value for each shape. 


interface Shape //https://forum.processing.org/one/topic/storing-shapes-into-an-array-choosing-them-randomly.html
{                // This code was reused from a processsing forum created by user PhiLHo.
 void draw();     //It allows me to create a multiple classes which each containing a unique shape.   
}                  //It then allows me to reference the interface Shape and call the function draw on each class. 
                    // I added additional shapes, and also added the idea of a sequence to my class however, which differs from the original code.

public class Circle implements Shape
{

  
  
  Circle(){  // Each class contains a unique shape. It holds the both data and functionality of each shape.
             

  }
  
  void draw(){
  stroke(0, 0, 0);
  strokeWeight(4);
  fill(255, 0, 0);      
  circle(x, 500, 100);
  x = x+randomS;
  c1 = x;
  
  if(x==400.00)  //The drawn shapes sequence "seq" gets created once the x value of each shape reaches the middle of the screen. 
  {              
    seq = seq + "1";
    println("Shapes Sequence: "+seq);
  }
  
  }
  
}

public class Square implements Shape //Square class
{
  
  
  
  Square(){ 

  }
  
  void draw(){
  stroke(0, 0, 0);
  strokeWeight(4);
  fill(255, 215, 0);
  rect(y, 450 , 100, 100);
  y = y+randomS;
  c2 = y;
  
  if(y == 400)
  {
    seq = seq + "2";
    println("Shapes Sequence: "+seq);
  }
  
  }
  
}

public class Oval implements Shape //Oval class
{
  
  
  
  Oval(){ 

  }
  
  void draw(){
  stroke(0, 0, 0);
  strokeWeight(4);
  fill(255, 255, 0);      
  ellipse(z, 500, 60, 100);
  z = z + randomS;
  c3 =z;
  
  if(z == 400)
  {
    seq = seq + "3";
    println("Shapes Sequence: "+seq);
  }
  
  }
  
}

public class Rectangle implements Shape //Rectangle class
{

  
  Rectangle(){ 

  }
  
  
  
  void draw(){
  stroke(0, 0, 0);
  strokeWeight(4);
  fill(0, 255, 0);
  rect(a, 450, 150, 76); 
  a = a + randomS;
  c4 = a; 
  
  if(a == 400)
  {
    seq = seq + "4";
    println("Shapes Sequence: "+seq);
  } 
  }
}

public class Triangle implements Shape //Triangle class
{
  
  
  
  Triangle(){ 
  

  }
  
  void draw(){
  stroke(0, 0, 0);
  strokeWeight(4);
  fill(0, 0 , 255);        
  triangle(b, 550 ,b+50 , 450, b+100 , 550 );
  b = b + randomS;
  c5 = b;
  
  
  if(b == 400)
  {
    seq = seq + "5";
    println("Shapes Sequence: "+seq);
  }
  
  }
  
}

public class Semi implements Shape //Semi-Circle class
{
  
  
  
  Semi(){ 
 

  }
  
  void draw(){
  stroke(0, 0, 0);
  strokeWeight(4);
  fill(128, 0, 128);
  arc(c, 500, 100, 100, 0, PI);
  c = c + randomS;
  c6 = c;
  
  if(c == 400)
  {
    seq = seq + "6";
    println("Shapes Sequence: "+seq);
  }
  
  }
}
