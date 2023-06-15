function LimitAttach(form, file, image)
    {
        extArray = new Array(".gif", ".jpg");
        var filename =file;
        allowSubmit = false;
        if (!file) return;
        while (file.indexOf("\\") != -1)
           file = file.slice(file.indexOf("\\") + 1);
           ext = file.slice(file.indexOf(".")).toLowerCase();
       for (var i = 0; i < extArray.length; i++)
       {
           if (extArray[i] == ext) { allowSubmit = true; break; }
       }

       if (allowSubmit)
       {
            image.src = "file://"+filename;
            image.style.visibility='visible';

          if (document.all['pjbpath']!=null)
          document.all['pjbpath'].value=document.all['imgdokumen'].src
       }
       else
          alert("Please only upload files that end in types:  "
          + (extArray.join("  ")) + "\nPlease select a new "
          + "file to upload");
    }
