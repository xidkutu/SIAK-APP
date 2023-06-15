package com.helpdesk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface HelpDesk extends javax.ejb.EJBObject {
public boolean postMessage(String id,String prop,String kab,String kec,String mod_code,String prio,String catgry,String ins_date,String pr_desc,String sample,String note)   throws RemoteException;

}