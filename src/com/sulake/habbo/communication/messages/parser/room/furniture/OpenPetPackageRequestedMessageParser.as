package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageRequestedMessageParser implements IMessageParser
   {
       
      
      private var var_339:int = -1;
      
      private var var_1067:int = -1;
      
      private var var_1602:int = -1;
      
      private var _color:String = "";
      
      public function OpenPetPackageRequestedMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_339;
      }
      
      public function get petType() : int
      {
         return this.var_1067;
      }
      
      public function get breed() : int
      {
         return this.var_1602;
      }
      
      public function get color() : String
      {
         return this._color;
      }
      
      public function flush() : Boolean
      {
         this.var_339 = -1;
         this.var_1067 = -1;
         this.var_1602 = -1;
         this._color = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_339 = param1.readInteger();
         this.var_1067 = param1.readInteger();
         this.var_1602 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
   }
}
