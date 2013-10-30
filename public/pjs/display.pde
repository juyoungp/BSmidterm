  HashMap userMap;
  Iterator i; 
  PVector randLoc, target1, target2, target3;
   
  int margin = 100;
  int tempIndex;
  int t;
  
  Boolean controllerOn = false;
  Boolean moveToSec1 = false;
  Boolean moveToSec2 = false;
  Boolean moveToSec3 = false;
  ArrayList<String> namelist;
  ArrayList<Particle> particles;
  PImage obamaP, stevejobsP, ladygagaP, danielshiffmanP, nickiminajP, spongebobP, marilynmonroeP, handP; 
  
  void setup() {
    size(11520, 1080);
 
    userMap = new HashMap();
    imagelist = new ArrayList<PImage>();
    namelist = new ArrayList<String>();
    particles = new ArrayList<Particle>();

    obamaP = loadImage("http://itp.nyu.edu/~jj1357/characters/ObamaF.jpg");
    stevejobsP = loadImage("http://itp.nyu.edu/~jj1357/characters/stevejobsF.jpg");
    ladygagaP = loadImage("http://itp.nyu.edu/~jj1357/characters/ladygagaF.jpg");
    danielshiffmanP = loadImage("http://itp.nyu.edu/~jj1357/characters/danielshiffmanF.jpg");
    nickiminajP = loadImage("http://itp.nyu.edu/~jj1357/characters/nickiminajF.jpg");
    spongebobP = loadImage("http://itp.nyu.edu/~jj1357/characters/spongebobF.jpg");
    marilynmonroeP = loadImage("http://itp.nyu.edu/~jj1357/characters/marilynmonroeF.jpg");
    handP = loadImage("http://itp.nyu.edu/~jj1357/characters/hand-shadow.png");

    displayText1 = "bit.ly/chooseordie";
    displayText2 = "bit.ly/chooseordie";
    displayText3 = "bit.ly/chooseordie";
    

    
    }

  void addParticle(String id, String characterName) {

    if(characterName.equals("hand") == true){

      console.log("processing - controller is on!");
      controllerOn = true;

    }else{

      particles.add(new Particle(random(3840, 7680), height/2));
      userMap.put(id, (particles.size()));
      namelist.add(characterName);
    
    }
  }

  void setSection(String id, int sectionID) {
 

    
    i = userMap.entrySet().iterator();  // Get an iterator
    

    while (i.hasNext()) {
      Map.Entry me = (Map.Entry)i.next();
        if (me.getKey() == id) {
           tempIndex = me.getValue();
           console.log(tempIndex-1);
           //tempP = particles.get(tempIndex-1);
        }
     }   

      if(sectionID == 1){
      
          moveToSec1 = true;
          moveToSec2 = false;
          moveToSec3 = false;
         

      } else if(sectionID == 2){

          moveToSec1 = false;
          moveToSec2 = true;
          moveToSec3 = false;
          
      } else if(sectionID == 3){

          moveToSec1 = false;
          moveToSec2 = false;
          moveToSec3 = true;
          
         
      } 




  }

  void draw() {

    background(255);
    
   
    noStroke();
    fill(255);

    textMode(CENTER);
    fill(140,21,15);
    rect(0, 0, 3840, height);
    fill(255,80);
    textSize(100);
    text(displayText1, width / 12 - textWidth(displayText1) / 2, height/2);
    fill(255, 204, 0);
    rect(3840, 0, 7680, height);
    fill(255,80);
    textSize(100);
    text(displayText2, width*5 / 12 - textWidth(displayText2) / 2, height/2);
    fill(102, 0, 102);
    rect(7680, 0, 11520, height);
    fill(255,80);
    textSize(100);
    text(displayText3, width*9/12 - textWidth(displayText3) / 2, height/2);
    
    


    //physics.update();
    

    


    i = userMap.entrySet().iterator();  // Get an iterator
    
    while (i.hasNext()) {
      Map.Entry me = (Map.Entry)i.next();
     
        drawUsers(me.getValue()); 
     
          
    }

    if(moveToSec1){
      particles.get(tempIndex-1).move(random(0, 3840), height/2);
    } else if (moveToSec2){
      particles.get(tempIndex-1).move(random(3840, 7680), height/2);
    } else if(moveToSec3){
      particles.get(tempIndex-1).move(random(7680, 11520), height/2);
    }

    if(controllerOn){
      displayHand();
    }


 }

 void displayHand (){

      fill(255);

      if(moveToSec1){
        target1 = new PVector(random(0, 3840), height/2);
        particles.get(tempIndex-1).move(target1.x, target1.y);
        
      } 

      if(moveToSec2){
        target2 = new PVector(random(3840, 7680), height/2);
        particles.get(tempIndex-1).move(target2.x, target2.y);
       
      } 

      if(moveToSec3){
        target3 = new PVector(random(7680, 11520), height/2);
        particles.get(tempIndex-1).move(target3.x, target3.y);
        
      } 

      image(getCharImage("hand"), width/2, height/2, 700, 800);


      fill(255,120,120);
      textSize(20);
      
  }

  void drawUsers(int index){


      fill(255);

      image(getCharImage(namelist.get(index-1)), particles.get(index-1).getX(), particles.get(index-1).getY(), 150, 150);

      fill(255,120,120);
      textSize(20);
      text(index, particles.get(index-1).getX(), particles.get(index-1).getY()); 

  }

  void removeUsers(String id){

    console.log(id + "is removed.");

    i = userMap.entrySet().iterator();  // Get an iterator
    while (i.hasNext()) {
        Map.Entry me = (Map.Entry)i.next();
        if (me.getKey() == id) {
           i.remove();
        }
    }
  }

  PImage getCharImage(String name){

    if(name.equals("obama") == true){
      return obamaP;
        
      } else if(name.equals("stevejobs") == true){
        return stevejobsP;
        
      } else if(name.equals("ladygaga") == true){
        return ladygagaP;
        
      } else if(name.equals("danielshiffman") == true){
        return danielshiffmanP;
        
      } else if(name.equals("nickiminaj") == true){
        return nickiminajP;
        
      } else if(name.equals("spongebob") == true){
        return spongebobP;
        
      } else if(name.equals("marilynmonroe") == true){
        return marilynmonroeP;
      
      } else if(name.equals("hand") == true){
        return handP;
        
      }

  }


class Particle{

  float loc_x;
  float loc_y;
  float tx, ty;
  float easing = 0.03;
  
  Particle(float x, float y){
    loc_x = x;
    loc_y = y;
    //tx = _tx;
    //ty = _ty;
  }


  void move(float _tx, float _ty){
    tx = _tx; 
    ty = _ty;

    float dx = tx - loc_x;
      if(abs(dx) > 1) {
        loc_x += dx * easing;
      }
  
      //float targetY = random(30, height-30);
      float dy = ty - loc_y;
      if(abs(dy) > 1) {
        loc_y += dy * easing;
      }
    //ellipse(loc_x, loc_y, 30, 30);
  }

  
  float getX(){
    return loc_x;
  }
  float getY(){
    return loc_y;
  }
  
}