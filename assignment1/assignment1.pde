ArrayList<Temperture> data = new ArrayList<Temperture>();

void setup()
{
  size(1280,800);
}


void draw()
{
   
        background(0);
        String[] lines = loadStrings("tempertures.csv"); // Load each line into a String array
         // Create an arraylist
        for(String s:lines)
        {
          // Add each element from the string array to the arrraylist
          Temperture temp = new Temperture(s);
          data.add(temp);
        }
        
        float max = maxtemp(data);
        float min = mintemp(data);
       println(max);
      
      stroke(0, 255, 255);
  
      float border = width * 0.2f;
     
      float firstvalue = data.get(0).annual;
    
      for (int i = 1 ; i < 134 ; i ++)
      {
        float x1 = (i - 1);
        float x2 = (i);
        float y1 = data.get(i - 1).annual;
        float y2 = data.get(i).annual;
        
        float rx1 = map(x1,0,134,border,width - border);
        float rx2 = map(x2,0,134,border,width - border);
        float ry1 = map(y1,min,max,border,height-border);
        float ry2 = map(y2,min,max,border,height-border);
        float zero = map(data.get(0).annual,-47,74,border,height-border);
        
        line(rx1, height - ry1, rx2,height - ry2);
        line(border,height - zero + firstvalue ,width - border,height - zero + firstvalue);
       
      }


      
      
}

// Method for calculating the max

float maxtemp(ArrayList<Temperture> data) 
{
  float max = 0;
  max = data.get(0).annual;
  
  for(int i = 0; i < data.size(); i ++)
  {
    if(data.get(i).annual > max)
    {
      max = data.get(i).annual;
    }
  }
  return max;
  
}

// Method for calculating the min

float mintemp(ArrayList<Temperture> data) 
{
  float min = 0;
  min = data.get(0).annual;
  
  for(int i = 0; i < data.size(); i ++)
  {
    if(data.get(i).annual < min)
    {
      min = data.get(i).annual;
    }
  }
  return min;
  
}


