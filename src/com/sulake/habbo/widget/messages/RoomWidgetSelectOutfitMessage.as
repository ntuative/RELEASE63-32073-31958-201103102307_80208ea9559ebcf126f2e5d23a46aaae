package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_1025:String = "select_outfit";
       
      
      private var var_2480:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_1025);
         this.var_2480 = param1;
      }
      
      public function get outfitId() : int
      {
         return this.var_2480;
      }
   }
}
