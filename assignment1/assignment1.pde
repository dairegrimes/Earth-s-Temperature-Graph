ArrayList<Temperture> data = new ArrayList<Temperture>();
float max;
float min;

void setup()
{
  size(700,700);

}


void draw()
{
   
        background(177);
        stroke(255);
        loaddata();
        max = maxtemp(data);
        min = mintemp(data);
        drawgraph();
        //circleyears();

}


void loaddata()
{
  String[] lines = loadStrings("tempertures.csv"); 
         
        for(String s:lines)
        {
          Temperture temp = new Temperture(s);
          data.add(temp);
        }
}


void drawgraph()
{
      
      stroke(0, 255, 255);
      float border = width * 0.15f;
      
      int border2 = 25;
     
      float firstvalue = data.get(0).annual;
    
      for (int i = 1 ; i < 82 ; i ++)
      {
        
        float x1 = (i - 1);
        float x2 = (i);
        float y1 = data.get(i - 1).annual;
        float y2 = data.get(i).annual;

        float rx1 = map(x1,0,81,border,width - border);
        float rx2 = map(x2,0,81,border,width - border);
        float ry1 = map(y1,min,max,border,height-border);
        float ry2 = map(y2,min,max,border,height-border);
        
        line(rx1, height - ry1, rx2,height - ry2);

         
      }
         float zero = map(data.get(0).annual,-47,74,border,height-border);
              
         text(0,border-border2,height - zero + firstvalue+5);
         
         text((int)max,border-border2,border);
        
         text((int)min,border-border2,height - border);
      
   stroke(0,0,255);
   //0-axis
   line(border,height - zero + firstvalue ,width - border,height - zero + firstvalue);
  //y-axis
  line(border,border,border,height-border);
  //x-axis
  line(border,height-border,width-border,height-border);
}// end draw graph



// Method for calculating the max

float maxtemp(ArrayList<Temperture> data) 
{
  float max = 0.0f;
  max = data.get(0).annual;
  
  for(int i = 0; i < data.size(); i ++)
  {
    if(data.get(i).annual > max)
    {
      max = data.get(i).annual;
    }
  }
  return max;
  
}//end max

// Method for calculating the min

float mintemp(ArrayList<Temperture> data) 
{
  float min = 0.0f;
  min = data.get(0).annual;
  
  for(int i = 0; i < data.size(); i ++)
  {
    if(data.get(i).annual < min)
    {
      min = data.get(i).annual;
    }
  }
  return min;
  
} // end min


void circleyears()
{
   float xborder = width * 0.15f;

 
   int i = 81;
  
  
  for (float y = xborder ; y < height - xborder; y += 55)
  {
    for (float x = xborder ; x < width - xborder; x += 55)
    {
      
        if(data.get(i).annual > 0)
        {
          fill(255,0,0);
        }
        else
        {
          fill(0,0,255);
        }
        
        float x1 = map(data.get(i).annual,min,max,-55,55);
       
        
        
        ellipse(x + 27.5, y  + 27.5,x1,x1);
        
        
        i--;
     }
     
  }
  
}