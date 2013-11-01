  HashMap userMap;
  Iterator i;
  PVector randLoc, target, targetH;


  int margin = 100;
  int tempIndex;
  int t, num;

  float handX;
  float handY;
  float theta = 0.0;
  float easingH = 0.05;
  Boolean controllerOn = false;
  Boolean moveToSec1 = false, moveToSec2 = false, moveToSec3 = false;
  Boolean kill1 = false, kill2 = false, kill3 = false;
  Boolean oscillating1 = false, oscillating2 = false, oscillating3 = false;
  Boolean moving = false, charMoving = false, moveHand1 = false, moveHand2 = false, moveHand3 = false;
  ArrayList<String> namelist;
  ArrayList<Particle> particles;
  ArrayList<PVector> target1list;
  ArrayList<String> idlist;
  PImage bg, kill1, kill2, kill3, obamaP, stevejobsP, ladygagaP, danielshiffmanP, nickiminajP,spongebobP, marilynmonroeP, handP, michaeljacksonP, katyperryP, harrypotterP, mimiP, jacksparrowP, conanP, hitlerP, johnlennonP, homersimpsonP, warioP, marioP, supermanP, batmanP, spidermanP, ironmanP;

  void setup() {
    size(11520, 1080);
    smooth();
    handX = width/2;
    handY = height/2;
    userMap = new HashMap();
    imagelist = new ArrayList<PImage>();
    namelist = new ArrayList<String>();
    particles = new ArrayList<Particle>();
    target1list = new ArrayList<PVector>();
    idlist = new ArrayList<PVector>();

    bg = loadImage("http://itp.nyu.edu/~jj1357/bigscreenImg/bgimgwithculumn.jpg");
    kill1 = loadImage("http://itp.nyu.edu/~jj1357/bigscreenImg/kill1.png");
    kill2 = loadImage("http://itp.nyu.edu/~jj1357/bigscreenImg/kill2.png");
    kill3 = loadImage("http://itp.nyu.edu/~jj1357/bigscreenImg/kill3.png");

    obamaP = loadImage("http://itp.nyu.edu/~jj1357/characters/ObamaF.jpg");
    stevejobsP = loadImage("http://itp.nyu.edu/~jj1357/characters/stevejobsF.jpg");
    ladygagaP = loadImage("http://itp.nyu.edu/~jj1357/characters/ladygagaF.jpg");
    danielshiffmanP = loadImage("http://itp.nyu.edu/~jj1357/characters/danielshiffmanF.jpg");
    nickiminajP = loadImage("http://itp.nyu.edu/~jj1357/characters/nickiminajF.jpg");
    spongebobP = loadImage("http://itp.nyu.edu/~jj1357/characters/spongebobF.jpg");
    marilynmonroeP = loadImage("http://itp.nyu.edu/~jj1357/characters/marilynmonroeF.jpg");
    handP = loadImage("http://itp.nyu.edu/~jj1357/bigscreenImg/hand-shadow-medium.png");
    michaeljacksonP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/michaeljacksonF.jpg");
    katyperryP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/katyperryF.jpg");
    harrypotterP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/harrypotterF.jpg");
    mimiP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/mimiF.jpg");
    jacksparrowP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/jacksparrowF.jpg");
    conanP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/conanF.jpg");
    hitlerP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/hitlerF.jpg");
    johnlennonP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/johnlennonF.jpg");
    homersimpsonP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/homersimpsonF.jpg");
    warioP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/warioF.jpg");
    marioP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/marioF.jpg");
    supermanP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/supermanF.jpg");
    batmanP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/batmanF.jpg");
    spidermanP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/spidermanF.jpg");
    ironmanP = loadImage("http://itp.nyu.edu/~jyp323/ju/wp-content/uploads/2013/10/ironmanF.jpg");

    displayText1 = "bit.ly/chooseordie";
    displayText2 = "bit.ly/chooseordie";
    displayText3 = "bit.ly/chooseordie";



    }

  void getTarget(float x, float y){
    if(x != null || y != null){
      target = new PVector(x, y);
      charMoving = true;
    //console.log(target.x, target.y);
    }


  }


  void getKillSection(int sectionID){
    if(sectionID == 1){
      kill1 = true;
      kill2 = false;
      kill3 = false;
      //console.log("kill1");
    } else if(sectionID ==2){
      kill2 = true;
      kill1 = false;
      kill3 = false;
      //console.log("kill2");
    } else if(sectionID ==3){
      kill3 = true;
      kill1 = false;
      kill2 = false;
      //console.log("kill3");
    }
  }

  void addParticle(String id, String characterName) {

    if(characterName.equals("hand") == true){

      //console.log("processing - controller is on!");
      controllerOn = true;

    }else{

      particles.add(new Particle(random(3840, 7680), height/2));
      userMap.put(id, (particles.size()));
      idlist.add(id);
      namelist.add(characterName);

    }
  }

  void setSection(String id) {

    //charMoving = true;


    i = userMap.entrySet().iterator();  // Get an iterator


    while (i.hasNext()) {
      Map.Entry me = (Map.Entry)i.next();
        if (me.getKey() == id) {
           tempIndex = me.getValue();
           //console.log(tempIndex-1);
        }
     }

  
  }

  void draw() {

    image(bg, 0, 0);

    if(kill1==true){
      //image(kill1, 0, 0);
      removeUsers(1);
    } else if(kill2 ==true){
      //image(kill2, 0, 0);
      removeUsers(2);
    } else if(kill3 == true){
      //image(kill3, 0, 0);
      removeUsers(3);
    }
   
    i = userMap.entrySet().iterator();  // Get an iterator

    while (i.hasNext()) {
      Map.Entry me = (Map.Entry)i.next();

        drawUsers(me.getValue());


    }

    if(charMoving){
      particles.get(tempIndex-1).move(target.x, target.y);
    } 

    if(controllerOn){
      displayHand();

    }


 }

 void displayHand (){

      image(getCharImage("hand"), handX, handY, 1400, 1080);

      if(moving){

        //oscillating2 = false;
        //oscillating3 = false;
        //targetH = new PVector(targetH.x, targetH.y;
        float dx = targetH.x - handX;
        if( abs(dx) > 30) {
          handX += dx * easingH;

        } /*else {

          oscillating1 = true;
        }*/

        float dy = targetH.y - handY;
        if(abs(dy) > 30) {
          handY += dy * easingH;
        }


      } /*else if(moving && moveHand2){
        oscillating1 = false;
        oscillating3 = false;

        //targetH = new PVector(targetH.x, targetH.y;
        float dx = targetH.x - handX;
        if( abs(dx) > 30) {
          handX += dx * easingH;

        } else {

          oscillating2 = true;
        }

        float dy = targetH.y - handY;
        if(abs(dy) > 30) {
          handY += dy * easingH;
        }


      } else if(moving && moveHand3){
        oscillating2 = false;
        oscillating1 = false;
        //targetH = new PVector(targetH.x, targetH.y;
        float dx = targetH.x - handX;
        if( abs(dx) > 30) {
          handX += dx * easingH;

        } else {

          oscillating3 = true;
        }

        float dy = targetH.y - handY;
        if(abs(dy) > 30) {
          handY += dy * easingH;
        }


      } 

      if(oscillating1){
        handX = (sin(theta) + 1)/2 * 2140; 
        theta += 0.05;
      } else if (oscillating2){
        handX = (((sin(theta) + 1)/2)+1) * 3000; 
        theta += 0.05;
      } else if (oscillating3){
        handX = (((sin(theta) + 1)/2)+1) * 6380; 
        theta += 0.05;
      }

*/
  }

  void moveHand(float x, float y){
    moving = true;

    if(x != null || y != null){
    
      targetH = new PVector(x, y);
      console.log(targetH.x, targetH.y);
    }


}
  void drawUsers(int index){


      fill(255);

      image(getCharImage(namelist.get(index-1)),particles.get(index-1).getX(), particles.get(index-1).getY(), 150, 150);

      fill(255,120,120);
      textSize(20);
      text(index, particles.get(index-1).getX(),particles.get(index-1).getY());

  }

  void removeUsers(int s){

    //console.log(id + "is removed.");

    if(s == 1){
      for(int j = 0; j<particles.size(); j++){
        if(particles.get(j).getX()>=2109 && particles.get(j).getX()<=2700 && particles.get(j).getY()>=0 && particles.get(j).getY()<=780){
          deleteUser(j);
        }
      }
    }

    
  }

  void deleteUser(int j){
    i = userMap.entrySet().iterator();  // Get an iterator
      while (i.hasNext()) {
        Map.Entry me = (Map.Entry)i.next();
        if (me.getKey() == idlist.get(j)) {
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

      } else if(name.equals("michaeljackson") == true){
        return michaeljacksonP;

      } else if(name.equals("katyperry") == true){
        return katyperryP;

      } else if(name.equals("harrypotter") == true){
        return harrypotterP;

      } else if(name.equals("mimi") == true){
        return mimiP;

      } else if(name.equals("jacksparrow") == true){
        return jacksparrowP;

      } else if(name.equals("conan") == true){
        return conanP;

      } else if(name.equals("hitler") == true){
        return hitlerP;

      } else if(name.equals("johnlennon") == true){
        return johnlennonP;

      } else if(name.equals("homersimpson") == true){
        return homersimpsonP;

      } else if(name.equals("wario") == true){
        return warioP;

      } else if(name.equals("mario") == true){
        return marioP;

      } else if(name.equals("superman") == true){
        return supermanP;

      } else if(name.equals("batman") == true){
        return batmanP;

      } else if(name.equals("spiderman") == true){
        return spidermanP;

      } else if(name.equals("ironman") == true){
        return ironmanP;

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

  }


  void move(float _tx, float _ty){
    tx = _tx;
    ty = _ty;

    float dx = tx - loc_x;
    if(abs(dx) > 1) {
      loc_x += dx * easing;
    }

    float dy = ty - loc_y;
    if(abs(dy) > 1) {
      loc_y += dy * easing;
    }
  }


  float getX(){
    return loc_x;
  }
  float getY(){
    return loc_y;
  }

}