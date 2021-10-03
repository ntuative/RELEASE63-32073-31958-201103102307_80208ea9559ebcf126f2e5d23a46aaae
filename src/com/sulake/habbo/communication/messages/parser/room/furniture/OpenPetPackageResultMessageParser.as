package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_339:int = 0;
      
      private var var_1553:int = 0;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_339;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1553;
      }
      
      public function flush() : Boolean
      {
         this.var_339 = 0;
         this.var_1553 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_339 = param1.readInteger();
         this.var_1553 = param1.readInteger();
         return true;
      }
   }
}
