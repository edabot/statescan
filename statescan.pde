
PImage img;  // Declare variable "a" of type PImage
float noiseScale = .02;
int maxValue= 16777216;
int step = 10;
float yVal = 0;
float yStep = .03;
int margin = 20;

void setup() {
  size(640, 620);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("california.png");  // Load the image into the program  
  img.filter(BLUR, 3);
  background(255);
   img.loadPixels();
}

void draw() {
  yVal += yStep;
    background(255);

  // Displays the image at its actual size at point (0,0)
   for (int y = 0; y < img.height - 10; y +=step){
    for (int x=0; x < img.width - 10; x += step) {
      float pixelValue = -6 * img.pixels[y*img.width+x] / maxValue + 1;
      float nextPixelValue = -6 * img.pixels[y*img.width+x+step] / maxValue + 1;
      float noiseVal = noise(x*noiseScale, y*noiseScale + yVal) * pixelValue;
      float nextNoiseVal = noise((x+ step)*noiseScale, y*noiseScale + yVal) * nextPixelValue;
    line(x + margin, y - noiseVal * 10 + margin, x + 10 + margin, y - nextNoiseVal * 10+ margin);
    }
  }   // Displays the image at point (0, height/2) at half of its size
}
