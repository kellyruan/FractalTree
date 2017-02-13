private double fractionLength = .9; 
private int smallestBranch = 8; 
private double branchAngle = .4;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(102,51,0);
	strokeWeight(50);
	line(320,480,320,405);   
	stroke(0,255,0);   
	strokeWeight(1);
	drawBranches(320,380,80,3*Math.PI/2);  
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle+1.5*branchAngle;
	double angle2 = angle-1.5*branchAngle;
	branchLength*=fractionLength;  
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);  
	if (branchLength>smallestBranch) {
		drawBranches(endX1,endY1,branchLength*fractionLength,angle1);
		drawBranches(endX2,endY2,branchLength*fractionLength,angle2);
	}
	else {
		if(branchLength<80) {
		ellipse(endX1,endY1,7,7);
		ellipse(endX2,endY2,7,7);
		}
	}
} 
