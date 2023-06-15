package siaktools.logwriter;

import java.io.FileReader;
import java.io.Serializable;


public class SiakFileReader extends FileReader implements Serializable{

  public SiakFileReader(String filename) throws Exception
  {
      super(filename);
  }

}