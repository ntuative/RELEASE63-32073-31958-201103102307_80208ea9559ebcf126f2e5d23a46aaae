package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_750:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_1203:int = 0;
      
      public static const const_1545:Array = [2,3,4];
       
      
      private var var_84:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_750);
         this.var_84 = param1;
      }
      
      public function get style() : int
      {
         return this.var_84;
      }
   }
}
