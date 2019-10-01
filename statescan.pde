
PImage img;  // Declare variable "a" of type PImage
float noiseScale = .02;
int maxValue= 16777216;
int hStep = 7;
int vStep = 15;
float yVal = 0;
float yStep = .01;
float zVal = 0;
float zStep = 0.01;
int margin = 20;
float amplitude = 7;

void setup() {
  size(640, 620);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("california.png");  // Load the image into the program  
  img.filter(BLUR, 5);
  background(255);
   img.loadPixels();
}

void draw() {
  yVal += yStep;
  zVal += zStep;
  background(0);
  stroke(255);
  fill(0);
  smooth();  
  strokeWeight(3);

   for (int y = 0; y < img.height - hStep; y +=hStep){
    beginShape();
    for (int x=0; x < img.width - vStep; x += vStep) {
      float pixelValue = -amplitude * img.pixels[y*img.width+x] / maxValue + 1;
      float noiseVal = noise(x*noiseScale, y*noiseScale + yVal, zVal) * pixelValue;
      curveVertex(x + margin, y - noiseVal * 10 + margin); 
      if (x == 0 || img.width - x < vStep) {
        curveVertex(x + margin, y - noiseVal * 10 + margin); 
      }
    }
    endShape();
  }   
}
