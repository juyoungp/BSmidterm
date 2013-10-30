/*var  VerletPhysics2D = toxi.physics2d.VerletPhysics2D,
     VerletParticle2D = toxi.physics2d.VerletParticle2D,
     AttractionBehavior = toxi.physics2d.behaviors.AttractionBehavior,
     GravityBehavior = toxi.physics2d.behaviors.GravityBehavior,
     Vec2D = toxi.geom.Vec2D,
     Rect = toxi.geom.Rect;

  import toxi.geom.*;
  import toxi.physics2d.*;
  import toxi.physics2d.behaviors.*;
  
  
  VerletPhysics2D physics;
  VerletPhysics2D target1;
  VerletPhysics2D target2;
  VerletPhysics2D target3;
  AttractionBehavior mouseAttractor;
  AttractionBehavior attractorSec1;
  AttractionBehavior attractorSec2; 
  AttractionBehavior attractorSec3;
  //String characterId;
*/
  HashMap userMap;
  Iterator i; 
  PVector target1, target2, target3;
  //Vec2D core;  
  int margin = 100;
  int tempIndex;
  int t;
  //float easing = 0.05;
  Boolean moveToSec1 = false;
  Boolean moveToSec2 = false;
  Boolean moveToSec3 = false;
  ArrayList<String> namelist;
  ArrayList<Particle> particles;
  PImage obamaP, stevejobsP, ladygagaP, danielshiffmanP, nickiminajP, spongebobP, img6, img7, img8, img9, stevejobs0; 
  
  void setup() {
    size(11520, 1080);
    //frameRate(50);
    // setup physics with 10% drag
    //physics = new VerletPhysics2D();
    //physics.setDrag(0.05);
    //physics.setWorldBounds(new Rect(margin, margin, width-margin, height-margin));
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
    img6 = loadImage("http://itp.nyu.edu/~jj1357/characters/spongebobF.jpg");

    displayText1 = "bit.ly/chooseordie";
    displayText2 = "bit.ly/chooseordie";
    displayText3 = "bit.ly/chooseordie";
    

    
    }

  void addParticle(String id, String characterName) {

   //Vec2D randLoc = Vec2D.randomVector().scale(5).addSelf(width / 2, height/2);
   PVector randLoc = new PVector(random(200, width-200), height/2);
   //VerletParticle2D p = new VerletParticle2D(randLoc, 30);
   //float randx = random(200, width-200);
   //PVector p = new PVector(randLoc.x, 30);
   Particle p = new Particle(randLoc.x, randLoc.y);
   particles.add(p);
   //console.log("Paricle number = "+physics.particles.length+","+id);
   //console.log(particles.size());
   userMap.put(id, (particles.size()));
   //console.log("HashMap: " +userMap.size());
    characterId = characterName;
    //core = randLoc;
    //natureF = new AttractionBehavior(core, 5, -1.2, 0.01);
    //physics.addBehavior(natureF);

    namelist.add(characterName);
    console.log("processing says: "+ characterName);
  }

  void setSection(String id, int sectionID) {
 

    //Vec2D sec1loc = Vec2D.randomVector().scale(5).addSelf(width / 6, height/2);
    //Vec2D sec2loc = Vec2D.randomVector().scale(5).addSelf(width / 2, height/2);
    //Vec2D sec3loc = Vec2D.randomVector().scale(5).addSelf(width*5 / 6, height/2);
    

   
    //VerletParticle2D tempP;
    //Particle tempP;
    
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

          //core = sec1loc;
          //natureF = new AttractionBehavior(core, 5, -1.2, 0.01);
          

          //physics.addBehavior(natureF);
          
          moveToSec1 = true;
          moveToSec2 = false;
          moveToSec3 = false;
         

      }else if(sectionID == 2){

          //core = sec2loc;
          //natureF = new AttractionBehavior(core, 5, -1.2, 0.01);


          //physics.addBehavior(natureF);
          
          moveToSec1 = false;
          moveToSec2 = true;
          moveToSec3 = false;
          
      }else if(sectionID == 3){

          //core = sec3loc;
          //natureF = new AttractionBehavior(core, 5, -1.2, 0.01);
          
          //physics.addBehavior(natureF);
          
          moveToSec1 = false;
          moveToSec2 = false;
          moveToSec3 = true;
          
         
      } 

      //console.log("Processing = User id: " + id +" , section: "+sectionID);
      //moveToSec1 = false;
      //moveToSec2 = false;
      //moveToSec3 = false;

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
    /*
      if(moveToSec1){
        particles.get(tempIndex-1).move(target1.x, target1.y);
      } else(moveToSec2){
        particles.get(tempIndex-1).move(target2.x, target2.y);
      } else(moveToSec3){
        particles.get(tempIndex-1).move(target3.x, target3.y);
      }
    */


    i = userMap.entrySet().iterator();  // Get an iterator
    
    while (i.hasNext()) {
      Map.Entry me = (Map.Entry)i.next();
     
        drawUsers(me.getValue()); 
      
      
          
    }


 }

  void drawUsers(int index){

      //VerletParticle2D tempP = physics.particles[index-1];
      //Particle tempP = particles.get(index-1);
 
      fill(255);

      if(moveToSec1){
        target1 = new PVector(random(0, 3840), height/2);
        particles.get(tempIndex-1).move(target1.x, target1.y);
        //image(getCharImage(namelist.get(index-1)), particles.get(index-1).getX(), particles.get(index-1).getY(), 150, 150);

      } 

      if(moveToSec2){
        target2 = new PVector(random(3840, 7680), height/2);
        particles.get(tempIndex-1).move(target2.x, target2.y);
        //image(getCharImage(namelist.get(index-1)), particles.get(index-1).getX(), particles.get(index-1).getY(), 150, 150);

      } 

      if(moveToSec3){
        target3 = new PVector(random(7680, 11520), height/2);
        particles.get(tempIndex-1).move(target3.x, target3.y);
        //image(getCharImage(namelist.get(index-1)), particles.get(index-1).getX(), particles.get(index-1).getY(), 150, 150);

      } 
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
      } 

  }


class Particle{

  float loc_x;
  float loc_y;
  float tx, ty;
  float easing = 0.05;
  
  Particle(float x, float y){
    loc_x = x;
    loc_y = y;
    //tx = _tx;
    //ty = _ty;
  }


  void move(float _tx, float _ty){
    tx = _ty; 
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