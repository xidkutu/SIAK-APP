package com.valueList;

public class IteratorException extends Exception  implements java.io.Serializable{
String msg="";

  public IteratorException(String msg)
  {
    this.msg=msg;
  }
  public String toString()
  {
    return msg;
  }
}
