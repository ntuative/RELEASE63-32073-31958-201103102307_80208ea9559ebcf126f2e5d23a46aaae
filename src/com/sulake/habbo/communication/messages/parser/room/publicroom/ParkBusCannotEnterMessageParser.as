package com.sulake.habbo.communication.messages.parser.room.publicroom
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ParkBusCannotEnterMessageParser implements IMessageParser
   {
       
      
      private var var_1351:String = "";
      
      public function ParkBusCannotEnterMessageParser()
      {
         super();
      }
      
      public function get reason() : String
      {
         return this.var_1351;
      }
      
      public function flush() : Boolean
      {
         this.var_1351 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1351 = param1.readString();
         return true;
      }
   }
}
