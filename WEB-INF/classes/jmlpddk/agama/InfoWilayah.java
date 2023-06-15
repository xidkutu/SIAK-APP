package jmlpddk.agama;

import java.io.Serializable;
import java.util.Vector;

public class InfoWilayah implements Serializable
{
  private Vector vProp, vKab, vKec, vKel;

  public InfoWilayah(Vector vProp,Vector vKab,Vector vKec,Vector vKel)
  {
    this.vProp = (vProp==null)? new Vector() : vProp;
    this.vKab = (vKab==null)? new Vector() : vKab;
    this.vKec = (vKec==null)? new Vector() : vKec;
    this.vKel = (vKel==null)? new Vector() : vKel;
  }
  public InfoWilayah(Vector vKab,Vector vKec,Vector vKel)
  {
    this.vKab = (vKab==null)? new Vector() : vKab;
    this.vKec = (vKec==null)? new Vector() : vKec;
    this.vKel = (vKel==null)? new Vector() : vKel;
  }
  public InfoWilayah(Vector vKec,Vector vKel)
  {
    this.vKec = (vKec==null)? new Vector() : vKec;
    this.vKel = (vKel==null)? new Vector() : vKel;
  }

  public InfoWilayah(Vector vKel)
  {
    this.vKel = (vKel==null)? new Vector() : vKel;
  }

  public void setVProp(Vector vProp)
  {
    this.vProp = vProp;
  }
  public Vector getVProp()
  {
    return vProp;
  }

  public void setVKab(Vector vKab)
  {
    this.vKab = vKab;
  }
  public Vector getVKab()
  {
    return vKab;
  }
  public void setVKec(Vector vKec)
  {
    this.vKec = vKec;
  }
  public Vector getVKec()
  {
    return vKec;
  }
  public void setVKel(Vector vKel)
  {
    this.vKel = vKel;
  }
  public Vector getVKel()
  {
    return vKel;
  }

}