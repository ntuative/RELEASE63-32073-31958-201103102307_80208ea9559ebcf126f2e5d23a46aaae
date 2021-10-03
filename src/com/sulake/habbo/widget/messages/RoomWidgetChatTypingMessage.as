package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_731:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_621:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_731);
         this.var_621 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_621;
      }
   }
}
