void setup()
{
  size(500,500);
}


void draw()
{
   
        background(0);
        String[] lines = loadStrings("oil.txt"); // Load each line into a String array
        ArrayList<Float> sumdata = new ArrayList<Float>(); // Create an arraylist
        for(String s:lines)
        {
        // Add each element from the string array to the arrraylist
        float f = Float.parseFloat(s);
        sumdata.add(f);
        }
        
        float max = maxprice(sumdata);

      
      stroke(0, 255, 255);
      
      float border = width * 0.1f;
      
      for (int i = 1 ; i < sumdata.size() ; i ++)
      {
        float x1 = (i - 1);
        float x2 = (i);
        float y1 = sumdata.get(i - 1);
        float y2 = (sumdata.get(i));
        
        float rx1 = map(x1,0,sumdata.size(),border,width - border);
        float rx2 = map(x2,0,sumdata.size(),border,width - border);
        float ry1 = map(y1,0,max,border,height - border);
        float ry2 = map(y2,0,max,border,height - border);
        
        line(rx1, height - ry1, rx2,height -  ry2);
      }
      
      
      
      for(int i = 0; i < sumdata.size(); i ++)
      {
        line(50, border,50,border + 50);
        border += 50;
      }
      
      for(int i = 0; i < sumdata.size(); i ++)
      {
        line(border, height - border,border + 50,height - border);
        border += 50;
      }
      
      
}

// Method for calculating the max
float maxprice(ArrayList<Float> sumdata) 
{
  float max = 0;
  max = sumdata.get(0);
  
  for(int i = 0; i < sumdata.size(); i ++)
  {
    if(sumdata.get(i) > max)
    {
      max = sumdata.get(i);
    }
  }
  return max;
  
}


