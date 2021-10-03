package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_845:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1374:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_845);
         this.var_1374 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1374;
      }
   }
}
