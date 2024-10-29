// the number of rows to draw
int numRows;
// the number of rectangles in the starting (bottom) row
int rowLength;
// the X coordinate of the first rectangle in the bottom row
int startX ;
// the Y coordinate of the first rectangle in the bottom row
int startY ;
// the width of each rectangle
int rectWidth;
// the height of each rectangle
int rectHeight;
// when isColour is false , all rectangles are filled in white
// otherwise a random fill colour is chosen

boolean isColour;
float r = 255;
float g = 255;
float b = 255;

void setup() {
  size(900, 400);
  stroke(0) ; // pen colour black
  numRows = 1; // initially one row of rectangles is drawn
  rowLength = 10; // 10 rectangles in the first row
  startX = 50;
  startY = 350;
  rectWidth = 75; // each rectangle 75 pixels wide
  rectHeight = 30; // each rectangle 30 pixels wide
  isColour = false ; // no colour to start with
}

void draw() {
  background(255);
  // don't change the line above
  // rect(startX, startY, rectWidth, rectHeight);
  int rectXLocal; // define and intialise local variable to control x position
  int rectYLocal = startY; // define and intialise local variable to control y position
  // draws row of rect, increases height, draws rect again
  // until int variable i is equal to numRows

  for (int i = 0; i < numRows; i++) {
    int rowLengthLocal = rowLength - i; // row length for current row, assign to local variable#
    // rectXLocal = startX; // moves row back to startX position to create columns

    // takes startX position and index for row, divides by 2/rectWidth
    // pushes row to the right
    rectXLocal = startX + i * (rectWidth/2); // half width of rect then push to right
    rectYLocal -= rectHeight; // move up by rectHeight

    // make sure row length isn't negative
    if (rowLengthLocal > 0) {
      for (int j = 0; j < rowLengthLocal; j++) {
        fill(r, g, b);
        rect(rectXLocal, rectYLocal, rectWidth, rectHeight);
        rectXLocal += rectWidth; // move to the right by rectWidth
      }
    }
  }
}

void mousePressed() {
  numRows++; // numRows + 1 everytime mouse pressed
  // once numRows reaches 11, set numRows to 0.
  if (numRows == 11) {
    numRows = 0;
  }
  if ((numRows == 1)) {
    isColour = !isColour; // changes value of isColour when numRows = 0.
  }
  if ((numRows == 1) && (isColour == true)){
    r = random(255);
    b = random(255);
    g = random(255);
  }else if (isColour == false){
    r = 255;
    b = 255;
    g = 255;
  }
  println(numRows); // prints the value of numRows
  println(isColour); // prints value of boolean isColour
}
