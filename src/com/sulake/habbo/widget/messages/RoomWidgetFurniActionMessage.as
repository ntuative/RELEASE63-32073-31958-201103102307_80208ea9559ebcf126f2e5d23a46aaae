package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_649:String = "RWFUAM_ROTATE";
      
      public static const const_268:String = "RWFAM_MOVE";
      
      public static const const_822:String = "RWFAM_PICKUP";
      
      public static const const_623:String = "RWFAM_OPEN_WELCOME_GIFT";
       
      
      private var _furniId:int = 0;
      
      private var var_2654:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         this._furniId = param2;
         this.var_2654 = param3;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniCategory() : int
      {
         return this.var_2654;
      }
   }
}
