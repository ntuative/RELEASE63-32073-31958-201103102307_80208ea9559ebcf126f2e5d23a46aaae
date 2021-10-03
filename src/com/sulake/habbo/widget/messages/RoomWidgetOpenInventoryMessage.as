package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_748:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1201:String = "inventory_effects";
      
      public static const const_1226:String = "inventory_badges";
      
      public static const const_1518:String = "inventory_clothes";
      
      public static const const_1614:String = "inventory_furniture";
       
      
      private var var_2128:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_748);
         this.var_2128 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2128;
      }
   }
}
