class Temperture
{
  float annual;
  
  Temperture(String data)
  {
    String[] parts = data.split(",");
    annual = Float.parseFloat(parts[13]);
  }
}
