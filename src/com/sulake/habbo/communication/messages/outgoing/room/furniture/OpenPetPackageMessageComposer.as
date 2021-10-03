package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_339:int;
      
      private var var_2667:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_339 = param1;
         this.var_2667 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_339,this.var_2667];
      }
      
      public function dispose() : void
      {
      }
   }
}
