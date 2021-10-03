package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1848:int = 0;
      
      public static const const_1502:int = 1;
      
      public static const const_1650:int = 2;
      
      public static const const_1802:int = 3;
      
      public static const const_1846:int = 4;
      
      public static const const_1765:int = 5;
      
      public static const const_1507:int = 10;
      
      public static const const_1754:int = 11;
      
      public static const const_1961:int = 12;
      
      public static const const_1849:int = 13;
      
      public static const const_1851:int = 16;
      
      public static const const_1966:int = 17;
      
      public static const const_1798:int = 18;
      
      public static const const_1883:int = 19;
      
      public static const const_1821:int = 20;
      
      public static const const_1939:int = 22;
      
      public static const const_1860:int = 23;
      
      public static const const_1746:int = 24;
      
      public static const const_1841:int = 25;
      
      public static const const_1925:int = 26;
      
      public static const const_1748:int = 27;
      
      public static const const_1789:int = 28;
      
      public static const const_1786:int = 29;
      
      public static const const_1759:int = 100;
      
      public static const const_1800:int = 101;
      
      public static const const_1943:int = 102;
      
      public static const const_1832:int = 103;
      
      public static const const_1867:int = 104;
      
      public static const const_1937:int = 105;
      
      public static const const_1859:int = 106;
      
      public static const const_1889:int = 107;
      
      public static const const_1903:int = 108;
      
      public static const const_1780:int = 109;
      
      public static const const_1964:int = 110;
      
      public static const const_1922:int = 111;
      
      public static const const_1928:int = 112;
      
      public static const const_1960:int = 113;
      
      public static const const_1743:int = 114;
      
      public static const const_1969:int = 115;
      
      public static const const_1766:int = 116;
      
      public static const const_1795:int = 117;
      
      public static const const_1842:int = 118;
      
      public static const const_1916:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get method_13() : String
      {
         switch(this.reason)
         {
            case const_1502:
            case const_1507:
               return "banned";
            case const_1650:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
