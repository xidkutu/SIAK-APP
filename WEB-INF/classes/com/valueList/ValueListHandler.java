package com.valueList;

import java.util.*;

public class ValueListHandler implements ValueListIterator,java.io.Serializable {
  protected List list;
 protected ListIterator listIterator;

public ValueListHandler() {
   }

protected void setList(List list)
   throws IteratorException {
     this.list = list;
     if(list != null)
       listIterator =  list.listIterator();
     else
       throw new IteratorException("List empty");
}

public Collection getList(){
    return list;
  }


 public int getSize() throws IteratorException{
    int size = 0;

    if (list != null)
      size = list.size();
    else
      throw new IteratorException("Size Not Available"); //No Data

    return size;
  }

  public Object getCurrentElement()
  throws IteratorException {

    Object obj = null;
    // Will not advance iterator
    if (list != null)
    {
      int currIndex = listIterator.nextIndex();
      obj = list.get(currIndex);
    }
    else
      throw new IteratorException("Current Element Fetch Error");
    return obj;

  }

  public List getPreviousElements(int count)
  throws IteratorException {
    int i = 0;
    Object object = null;
    LinkedList list = new LinkedList();
    if (listIterator != null) {
      while (listIterator.hasPrevious() && (i < count)){
        object = listIterator.previous();
        list.add(object);
        i++;
      }
    }// end if
    else
      throw new IteratorException("Previous Element Fetch Error"); // No data

    return list;
  }

  public List getNextElements(int count)
   throws IteratorException {
     int i = 0;
     Object object = null;
     LinkedList list = new LinkedList();
     if(listIterator != null){
       while(  listIterator.hasNext() && (i < count) ){
         object = listIterator.next();
         list.add(object);
         i++;
       }
     } // end if
     else
       throw new IteratorException("Next Element Fetch Error"); // No data

     return list;
   }

   public void resetIndex() throws IteratorException{
       if(listIterator != null){
         listIterator = list.listIterator();
       }
       else
         throw new IteratorException("Index Reset"); // No data
     }

public void removeList()
     {
       list.clear();
       list=null;
     }
}
