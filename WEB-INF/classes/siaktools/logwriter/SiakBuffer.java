package siaktools.logwriter;

import java.io.BufferedReader;
import java.io.Serializable;

public class SiakBuffer extends BufferedReader implements Serializable{

  public SiakBuffer(java.io.Reader obj)
  {
    super(obj);
  }
}