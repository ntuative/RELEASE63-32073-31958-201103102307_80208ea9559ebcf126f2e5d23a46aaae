package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2374:int;
      
      private var var_2373:int;
      
      private var var_1231:int;
      
      private var var_1232:int;
      
      private var var_1647:int;
      
      private var var_2372:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2374 = param1.readInteger();
         this.var_2373 = param1.readInteger();
         this.var_1231 = param1.readInteger();
         this.var_1232 = param1.readInteger();
         this.var_1647 = param1.readInteger();
         this.var_2372 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2374;
      }
      
      public function get charges() : int
      {
         return this.var_2373;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1231;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1232;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2372;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1647;
      }
   }
}
