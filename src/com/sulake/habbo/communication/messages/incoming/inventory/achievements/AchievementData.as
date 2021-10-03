package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1263:int;
      
      private var var_282:String;
      
      private var var_2395:int;
      
      private var var_2031:int;
      
      private var var_1516:int;
      
      private var var_2396:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1263 = param1.readInteger();
         this.var_282 = param1.readString();
         this.var_2395 = param1.readInteger();
         this.var_2031 = param1.readInteger();
         this.var_1516 = param1.readInteger();
         this.var_2396 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_282;
      }
      
      public function get level() : int
      {
         return this.var_1263;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2395;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2031;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1516;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2396;
      }
   }
}
