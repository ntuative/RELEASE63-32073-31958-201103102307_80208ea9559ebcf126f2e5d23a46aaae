package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_1682:Boolean;
      
      private var _roomId:int;
      
      private var var_904:String;
      
      private var var_2275:int;
      
      private var var_2276:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1682 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_904 = param1.readString();
         this.var_2275 = param1.readInteger();
         this.var_2276 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_1682;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_904;
      }
      
      public function get enterHour() : int
      {
         return this.var_2275;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2276;
      }
   }
}
