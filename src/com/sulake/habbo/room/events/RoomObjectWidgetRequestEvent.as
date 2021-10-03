package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectWidgetRequestEvent extends RoomObjectEvent
   {
      
      public static const const_145:String = "ROWRE_WIDGET_REQUEST_PLACEHOLDER";
      
      public static const ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI:String = "ROWRE_WIDGET_REQUEST_CREDITFURNI";
      
      public static const const_133:String = "ROWRE_WIDGET_REQUEST_STICKIE";
      
      public static const const_147:String = "ROWRE_WIDGET_REQUEST_PRESENT";
      
      public static const const_155:String = "ROWRE_WIDGET_REQUEST_TROPHY";
      
      public static const const_128:String = "ROWRE_WIDGET_REQUEST_TEASER";
      
      public static const const_152:String = "ROWRE_WIDGET_REQUEST_ECOTRONBOX";
      
      public static const const_139:String = "ROWRE_WIDGET_REQUEST_DIMMER";
      
      public static const const_107:String = "ROWRE_WIDGET_REMOVE_DIMMER";
      
      public static const const_141:String = "ROWRE_WIDGET_REQUEST_CLOTHING_CHANGE";
       
      
      public function RoomObjectWidgetRequestEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
