/* Hello and welcome to my CS171 project, created by Martin White, Student No. 19313673.
   This project is based on the topic PM_2: Probabiltiy and Shapes game. 
   The idea behind the game is to have 6 shapes displayed on screen for the user. 
   The user will then be displayed 6 shapes in a sequence and will have to recall and select the shapes
   available to them in order to recreate the sequence they have seen. If a sequence is correct, points will increment. If the 
   sequence is incorrect, lives will decrement. If lives reach zero it is game over and points will be displayed on screen.*/
   
import ddf.minim.*;  //Import Minim to play background music and sound effects.
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.sound.*;
SoundFile soundfile; //Creating two instances of a Sound File to initialise both tracks in the program.
SoundFile soundfile2;
SoundFile soundfile3;
SoundFile soundfile4;
String filename = "SoundTrack.wav";     // Background music file. 
String filename2 = "ButtonClick.wav";  //Shape click effect.
String filename3 = "success.wav";      // Point increment tone.
String filename4 = "failure.wav";     // Life decrement tone.
                                      // All sound files were obtained from freesounds.org.

int points =0, lives =3;                                    // Variables for keeping the player's score and number of lives to keep playing. 
String seq2 = "";                                           // Variable to hold the order in which the player clicks on the shapes.
int ri=0, ro=0, rp=0, ra=0, rs=0, rd=0;                     // Six variables to hold a random number each.
int restart =0;                                             // Variable for the restart button.
String zero = ""; // Empty string used to check whether a player's sequence string is empty.
float hold = 0;  //Varible used to hold which x value for the shapes the sequence will follow

int i = 6;                                                  // I used some code from Topic 3's lab such as arrays to create an array which stores shapes in the form of a class.
Shape[] shapes = new Shape[i];                              // The array contains 6 elements. 


void setup() {
  size(800, 600);                                          // Size of the program window.
  surface.setTitle("Probabaility & Shapes Game");          // I re-used code here from topic 3 to set a title for my program window.
  soundfile = new SoundFile(this,filename);                // These are files to load and loop the audio. 
  soundfile.amp(0.3);                                      // This code was obtained from the Processing.org website.
  soundfile.loop();
  soundfile2= new SoundFile(this, filename2);
  soundfile3= new SoundFile(this, filename3);
  soundfile4= new SoundFile(this, filename4);
 
  
  
  
  
  stroke(0, 0, 0);              // setting the thickness and colour of the borders drawn.
  strokeWeight(4);
  background(255, 255, 255); // Background is white
  
  line(width*0.33, 0, width*0.33, 400);  //Vertical lines
  line(width*0.66, 0, width*0.66, 400);
  
  line(0, 200, width, 200); // Horizontal lines
  line(0, 400, width, 400);
  
  line(0, 2, width, 2); // Borderlines
  line(2, 0, 2, 400);
  line(width-2, 0, width-2, 400);
  
  fill(255, 0, 0);      //Circle grid 1
  circle(132, 100, 152);
  
  fill(255, 215, 0);
  rect(320, 24, 152, 152); // Square grid 2
  
  fill(255, 255, 0);      //Oval grid 3
  ellipse(668, 100, 76, 152);
  
  fill(0, 255, 0);
  rect(56, 276, 152, 76); // Rectangle grid 4
  
  fill(0, 0 , 255);        // Triangle grid 5
  triangle(320, 376 , 396, 224, 472, 376 );
  
  fill(128, 0, 128);
  arc(668, 300, 152, 152, 0, PI); // Semi-Circle grid 6
  
 PFont MyFont;        // I wanted to add some visual elements to my program so I incoporated different fonts. I learned how to do this from the processing.org website.
 MyFont = loadFont("MyFont.vlw");
 textFont(MyFont);
 textSize(30);
 text("Lives: ", 10, height-10);
 

 MyFont = loadFont("MyFont.vlw"); 
 textFont(MyFont);
 textSize(30);
 text("Points: ", width-140, height-10);
 
 MyFont = loadFont("MyFont.vlw");
 textFont(MyFont);
 textSize(30);
 text("Start", width-440, height-10);
 
 shapes[0]= new Circle();    // From here the functionality of the game starts to come into play. From the array created prior, 
 shapes[1]=new Square();     // I initialise the array with 6 different shapes.
 shapes[2]=new Oval();       // I got this idea from watching Daniel Shiffman's series on processing which can be found through the following link,
 shapes[3]=new Rectangle();  // https://www.youtube.com/playlist?list=PLzJbM9-DyOZyMZzVda3HaWviHqfPiYN7e.
 shapes[4]=new Triangle();   // In the series he goes into great detail on creating objects, methods and classes which were fundamental to the creation of this game. 
 shapes[5]=new Semi();       // I also took a lot of inspiration for this project from Processing Forum user, PhiLho. The link to the forum he wrote in can be 
                             // found here: https://forum.processing.org/one/topic/storing-shapes-into-an-array-choosing-them-randomly.html
 



}





void mousePressed(){
  
  if(mouseX>320 && mouseX<460 && mouseY>height-40 && mouseY<height-5 && restart%2 ==0) // Here I created a start button. This is crucial to the scoring and flow of the game from one round to next.
  {                                                                                    // On clicking start, the variable 'restart' will increment. On clicking restart, the x position of all the shapes 
    restart++; hold =0;                                                                //resets. A new random integer is created (This code was reused from my CS161 labs) between 0 and 6 (not including 6). 
    x=0; y=0; z=0; a=0; b=0; c=0;                                                      //The player's sequence and the shape's sequence resets and a new round begins.
    IntList il = IntList.fromRange(0, 6);                                              // I used an integer list here to ensure that all random values were unique. 
    il.shuffle(this);                                                                  // I learned how to do this from processing.org.
    il.resize(6);                                                                      // I had to use unique values as I was having trouble when two shapes of the same type were created.             
    ri= il.get(0);
    ro= il.get(1);
    rp= il.get(2);
    ra= il.get(3);
    rs= il.get(4);
    rd= il.get(5);
    seq ="";
    seq2="";
    c1=x; c2=y; c3=z; c4=a; c5=b; c6=c;
    
   
    
    if(ri == 0)                                                                        //ri is the first shape that spawns. It is an integer value between 0 and 5 that calls the shape in a 
    {                                                                                  // shape from the array. Depending on which shape is called a different value for hold will be used.
      hold = c1;                                                                       // The variable hold holds either c1,c2,c3,c4,c5,c6 which are just the x values of the shapes stored in different
    }                                                                                  // variables i.e c1 holds the x value for circle. Depending on which shape spawns first, the following shapes will spawn 
     if(ri == 1)                                                                       // depending on the x value of the first shape that spawns. For example if circle spawns first and then square then rectangle,
    {                                                                                  // the x value for circle will increase as it traverses across the screen. When the x value reaches 250 then the square will
      hold = c2;                                                                       // spawn, at 500 the rectangle will spawn etc.
    }
     if(ri == 2)
    {
      hold = c3;
    }
     if(ri == 3)
    {
      hold = c4; 
    }
     if(ri == 4)
    {
      hold = c5;
    }
     if(ri == 5)
    {
      hold = c6; 
    }
    
    
  }
  
else if(mouseX>320 && mouseX<460 && mouseY>height-40 && mouseY<height-5 && restart%2 !=0) //Restart works by incrementing and if the varibale restart is not even then the game restarts and resets the variables.
{
    restart++;
 if(seq2.equals(seq)& !seq.equals(zero)& !seq2.equals(zero)) //Here if the two sequences equal to one another and do not equal zero, their points will increment when restart is clicked.
 {
   points++;
   soundfile3.play();
 }
 
 else if(!seq2.equals(seq)) //Here if the two sequences do not equal then lives will decrement.
 {
   lives--;
   soundfile4.play();
 }
}
}

void draw() 
{
 stroke(255);
 fill(255);
 rect(0, 412, width, 150);
 fill(255);
 rect(width-50, height -30, 25, 40);
 fill(255, 0, 0);
 textSize(30);
 text(points, width-40, height-10);//Number of points drawn on screen as they increase.
 fill(255);
 rect(85, height -33, 30, 30);
 fill(255,0, 0);
 textSize(30);
 text(lives, 90, height -10);//Number of lives drawn on screen as they decrement.
 
 if(restart%2 ==1) //When the game starts up, restart is equal to zero. When the player clicks restart the variable restart increments and multiple random values are created and placed within the 
 {                 // array and the function draw calls each shape to be drawn on screen.
   shapes[ri].draw(); //The entire sequence depends on the x position of the first drawn shape.
   hold = hold + randomS;
   if(hold > 250.0) //The shapes will only draw if the shape ahead of it has reached a certain position.
   { 
     shapes[ro].draw();     
   }
   if(hold > 500.0)
   {
     shapes[rp].draw();
   }
   if(hold > 750.0)
   {
     shapes[ra].draw();
   }
   if(hold > 1000.0)
   {
     shapes[rs].draw();
   }
   if(hold > 1250.0)
   {
    shapes[rd].draw();
   }
   
 }
 
 if(lives==0)
 {
 PFont MyFont;
 MyFont = loadFont("MyFont.vlw");    //If the player loses all their lives the game ends and 'Game Over' is printed on screen. The
 textFont(MyFont);                   // The points accumulated by the player are also displayed on screen.
 textSize(60);
 text("Game Over!", width-555, height/2);
 
 MyFont = loadFont("MyFont.vlw");
 textFont(MyFont);
 textSize(40);
 text("New Score: "+points, width-520, 500);
 
 if(mouseX>340 && mouseX<460 && mouseY>height-40 && mouseY<height-10)
{
  saveFrame("game-#####.png");
  exit(); // If the player tries to press restart after all their lives are gone, the game will exit.
}
 
} 
}

void mouseClicked() // A lot this code was created using Topic 3's lab as reference. I have it setup so that depending on which part of the user clicks on a different shape will be selected. 
{                    // The shapes cannot be clicked on until the sequence is nearly over. This adds a level of difficulty to the game. To be exact the last shape that is drawn needs to reach the centre of the screen before the player can recall the sequence.
  if(mouseX > 0 & mouseX < width*0.33 & mouseY > 0 & mouseY < height*0.33 & hold > 1650) //Top Left
  {
    soundfile2.play();           // A sound will play when the user clicks on the each shape.
    seq2 = seq2 + "1";          // As the player clicks on the shapes a sequence will be created which is a global sequence available to all shapes.    
    
                }
  else if(mouseX > width*0.33 & mouseX < width*0.66 & mouseY > 0 & mouseY < height*0.33 & hold > 1650) //Top Middle
  {
  soundfile2.play();
  seq2 = seq2 + "2";
                }
  else if(mouseX > width*0.66 & mouseX < width & mouseY > 0 & mouseY < height*0.33 & hold > 1650) //Top Right
  { 
  soundfile2.play();
  seq2 = seq2 + "3";
                }
  else if(mouseX > 0 & mouseX < width*0.33 & mouseY > height*0.33 & mouseY < height*0.66 & hold > 1650) //Bottom Left
  { 
  soundfile2.play();
  seq2 = seq2 + "4";
                }
  else if(mouseX > width*0.33 & mouseX < width*0.66 & mouseY > height*0.33 & mouseY < height*0.66 & hold > 1650) //Bottom Middle
  { 
  soundfile2.play();
  seq2 = seq2 + "5";
                }
  else if(mouseX > width*0.66 & mouseX < width & mouseY > height*0.33 & mouseY < height*0.66 & hold > 1650) //Bottom Right
  { 
  soundfile2.play();
  seq2 = seq2 + "6";
                }
                
  println("Player's Sequence: "+seq2); //New string created as the player clicks on the shapes. Used to compare to the sequence created by the shapes.
         
}


 

 
  

  
