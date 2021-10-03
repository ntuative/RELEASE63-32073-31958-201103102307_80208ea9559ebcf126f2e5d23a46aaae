package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1726:int;
      
      private var var_2409:int;
      
      private var var_1343:int;
      
      private var var_2410:int;
      
      private var var_115:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1726 = param1.readInteger();
         this.var_2409 = param1.readInteger();
         this.var_1343 = param1.readInteger();
         this.var_2410 = param1.readInteger();
         this.var_115 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1726);
      }
      
      public function get callId() : int
      {
         return this.var_1726;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2409;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1343;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2410;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_115;
      }
   }
}
