if(!_global.com)
{
   _global.com=new Object();
}
if(!_global.com.jeroenwijering)
{
   _global.com.jeroenwijering=new Object();
}
if(!_global.com.jeroenwijering.feeds)
{
   _global.com.jeroenwijering.feeds=new Object();
}
if(!_global.com.jeroenwijering.feeds.ATOMParser)
{
   register1=function()
   {
      super();
   };
   com.jeroenwijering.feeds.ATOMParser=function()
   {
      super();
   };
   com.jeroenwijering.feeds.ATOMParser extends com.jeroenwijering.feeds.AbstractParser
   register2=register1.prototype;
   register2.setElements=function()
   {
      this.elements=new Object();
      this.elements.title="title";
      this.elements.id="id";
   };
   register2.parse=function(xml)
   {
      register10=new Array();
      register6=xml.firstChild.firstChild;
      register9=undefined;
      while(!(register6==null))
      {
            if(register6.nodeName.toLowerCase()=="entry")
            {
               register3=new Object();
               register8=0;
               while(register8<register6.childNodes.length)
               {
                  register2=register6.childNodes[register8];
                  register4=register2.nodeName.toLowerCase();
                  if(!(this.elements[register4]==undefined))
                  {
                     register3.this.elements[register4]=register2.firstChild.nodeValue;
                  }
                  else
                  {
                     if(register4=="link"&&register2.attributes.rel=="alternate")
                     {
                        register3.link=register2.attributes.href;
                     }
                     else
                     {
                        if(register4=="summary")
                        {
                           register3.description=com.jeroenwijering.utils.StringMagic.stripTagsBreaks(register2.firstChild.nodeValue);
                        }
                        else
                        {
                           if(register4=="published")
                           {
                              register3.date=this.iso2Date(register2.firstChild.nodeValue);
                           }
                           else
                           {
                              if(register4=="updated")
                              {
                                 register3.date=this.iso2Date(register2.firstChild.nodeValue);
                              }
                              else
                              {
                                 if(register4=="modified")
                                 {
                                    register3.date=this.iso2Date(register2.firstChild.nodeValue);
                                 }
                                 else
                                 {
                                    if(register4=="category")
                                    {
                                       register3.category=register2.attributes.term;
                                    }
                                    else
                                    {
                                       if(register4=="author")
                                       {
                                          register5=0;
                                          while(register5<register2.childNodes.length)
                                          {
                                             if(register2.childNodes[register5].nodeName=="name")
                                             {
                                                register3.author=register2.childNodes[register5].firstChild.nodeValue;
                                             }
                                             register5=register5+1;
                                          }
                                       }
                                       else
                                       {
                                          if(register4=="link"&&register2.attributes.rel=="enclosure")
                                          {
                                             register7=register2.attributes.type.toLowerCase();
                                             if(!(this.mimetypes[register7]==undefined))
                                             {
                                                register3.file=register2.attributes.href;
                                                register3.type=this.mimetypes[register7];
                                                if(register3.file.substr(0,4)=="rtmp")
                                                {
                                                   register3.type="rtmp";
                                                }
                                             }
                                             else
                                             {
                                                if(!(register3.type==undefined)&&register7=="video/x-flv")
                                                {
                                                   register3.fallback=register2.attributes.href;
                                                }
                                             }
                                          }
                                          else
                                          {
                                             if(register4=="link"&&register2.attributes.rel=="captions")
                                             {
                                                register3.captions=register2.attributes.href;
                                             }
                                             else
                                             {
                                                if(register4=="link"&&register2.attributes.rel=="audio")
                                                {
                                                   register3.audio=register2.attributes.href;
                                                }
                                                else
                                                {
                                                   if(register4=="link"&&register2.attributes.rel=="image")
                                                   {
                                                      register3.image=register2.attributes.href;
                                                   }
                                                }
                                             }
                                          }
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                  }
                  register8=register8+1;
               }
               !(register3.author==undefined)?null:register0;
               register10.push(register3);
            }
            else
            {
               if(register6.nodeName=="title")
               {
                  register9=register6.firstChild.nodeValue;
               }
            }
            register6=register6.nextSibling;
      }
      return register10;
   };
}
