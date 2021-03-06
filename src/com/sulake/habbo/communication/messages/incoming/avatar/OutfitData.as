package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1943:int;
      
      private var var_2483:String;
      
      private var var_990:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1943 = param1.readInteger();
         this.var_2483 = param1.readString();
         this.var_990 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1943;
      }
      
      public function get figureString() : String
      {
         return this.var_2483;
      }
      
      public function get gender() : String
      {
         return this.var_990;
      }
   }
}
