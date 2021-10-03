package com.sulake.habbo.widget.events
{
   public class RoomWidgetChatInputContentUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_837:String = "RWWCIDE_CHAT_INPUT_CONTENT";
      
      public static const const_1160:String = "whisper";
      
      public static const const_1532:String = "shout";
       
      
      private var var_2168:String = "";
      
      private var _userName:String = "";
      
      public function RoomWidgetChatInputContentUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_837,param3,param4);
         this.var_2168 = param1;
         this._userName = param2;
      }
      
      public function get messageType() : String
      {
         return this.var_2168;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
   }
}
