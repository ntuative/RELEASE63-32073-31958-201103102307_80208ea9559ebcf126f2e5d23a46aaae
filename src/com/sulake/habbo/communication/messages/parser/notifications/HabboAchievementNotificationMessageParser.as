package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1263:int;
      
      private var var_1938:int;
      
      private var var_2031:int;
      
      private var var_1516:int;
      
      private var var_1264:int;
      
      private var var_2193:String = "";
      
      private var var_2626:String = "";
      
      private var var_2625:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1263 = param1.readInteger();
         this.var_2193 = param1.readString();
         this.var_1938 = param1.readInteger();
         this.var_2031 = param1.readInteger();
         this.var_1516 = param1.readInteger();
         this.var_1264 = param1.readInteger();
         this.var_2625 = param1.readInteger();
         this.var_2626 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1263;
      }
      
      public function get points() : int
      {
         return this.var_1938;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2031;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1516;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1264;
      }
      
      public function get badgeID() : String
      {
         return this.var_2193;
      }
      
      public function get achievementID() : int
      {
         return this.var_2625;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2626;
      }
   }
}
