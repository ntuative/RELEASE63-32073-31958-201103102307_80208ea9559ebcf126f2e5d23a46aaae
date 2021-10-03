package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1807:int;
      
      private var var_2342:String;
      
      private var var_284:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1807 = param1.readInteger();
         this.var_2342 = param1.readString();
         this.var_284 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1807;
      }
      
      public function get nodeName() : String
      {
         return this.var_2342;
      }
      
      public function get visible() : Boolean
      {
         return this.var_284;
      }
   }
}
