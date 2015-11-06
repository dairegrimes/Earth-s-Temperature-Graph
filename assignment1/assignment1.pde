void setup()
{
  size(500,500);
}


void draw()
{
   
      
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
      

      for (int i = 1 ; i < sumdata.size() ; i ++)
      {
        float x1 = (i - 1);
        float x2 = (i);
        float y1 = sumdata.get(i - 1);
        float y2 = (sumdata.get(i));
        
        float rx1 = map(x1,0,sumdata.size(),0,width);
        float rx2 = map(x2,0,sumdata.size(),0,width);
        float ry1 = map(y1,0,max,0,width);
        float ry2 = map(y2,0,max,0,width);
        
        line(rx1, height - ry1, rx2,height -  ry2);
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
