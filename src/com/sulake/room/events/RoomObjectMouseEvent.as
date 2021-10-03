package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_240:String = "ROE_MOUSE_CLICK";
      
      public static const const_1868:String = "ROE_MOUSE_ENTER";
      
      public static const const_498:String = "ROE_MOUSE_MOVE";
      
      public static const const_1751:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1899:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_511:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1871:String = "";
      
      private var var_2165:Boolean;
      
      private var var_2167:Boolean;
      
      private var var_2163:Boolean;
      
      private var var_2161:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1871 = param2;
         this.var_2165 = param5;
         this.var_2167 = param6;
         this.var_2163 = param7;
         this.var_2161 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1871;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2165;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2167;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2163;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2161;
      }
   }
}
