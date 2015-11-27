class Temperture
{
  float annual;
  float year;
  
  Temperture(String data)
  {
    String[] parts = data.split(",");
    year = Float.parseFloat(parts[0]);
    annual = Float.parseFloat(parts[13]);
  }
}
