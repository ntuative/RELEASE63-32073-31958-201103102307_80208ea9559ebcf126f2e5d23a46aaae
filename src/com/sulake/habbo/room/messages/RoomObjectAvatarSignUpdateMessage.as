package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarSignUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2250:int;
      
      public function RoomObjectAvatarSignUpdateMessage(param1:int)
      {
         super();
         this.var_2250 = param1;
      }
      
      public function get signType() : int
      {
         return this.var_2250;
      }
   }
}
