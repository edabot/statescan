/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */

PImage img;  // Declare variable "a" of type PImage
float noiseScale = .02;
int maxValue= 16777216;

void setup() {
  size(640, 620);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("california.png");  // Load the image into the program  
  img.filter(BLUR, 3);
  background(255);
  img.loadPixels();
   for (int y = 0; y < img.height; y +=5){
    for (int x=0; x < img.width; x += 5) {
      float pixelValue = -6 * img.pixels[y*img.width+x] / maxValue + 1;
      float noiseVal = noise(x*noiseScale, y*noiseScale) * pixelValue;
    println("x", x, "y", y, "pixelVal", pixelValue, "noiseVal", noiseVal);
    }
  }  
}

void draw() {
  // Displays the image at its actual size at point (0,0)
  image(img, 0, 0);
  // Displays the image at point (0, height/2) at half of its size
}
