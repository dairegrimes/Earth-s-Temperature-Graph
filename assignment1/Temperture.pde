class Temperture
{
  float annual;
  float year;
  
  Temperture(String s)
  {
    String[] parts = s.split(",");
    year = Float.parseFloat(parts[0]);
    annual = Float.parseFloat(parts[13]); 
  }
}