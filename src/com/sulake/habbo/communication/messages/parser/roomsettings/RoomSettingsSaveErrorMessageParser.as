package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1796:int = 1;
      
      public static const const_1764:int = 2;
      
      public static const const_1882:int = 3;
      
      public static const const_1941:int = 4;
      
      public static const const_1462:int = 5;
      
      public static const const_1894:int = 6;
      
      public static const const_1668:int = 7;
      
      public static const const_1443:int = 8;
      
      public static const const_1752:int = 9;
      
      public static const const_1601:int = 10;
      
      public static const const_1398:int = 11;
      
      public static const const_1588:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1565:int;
      
      private var var_1469:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1565 = param1.readInteger();
         this.var_1469 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1565;
      }
      
      public function get info() : String
      {
         return this.var_1469;
      }
   }
}
