package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2681:int;
      
      private var var_2679:int;
      
      private var var_2682:int;
      
      private var var_2680:String;
      
      private var var_1885:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2681 = param1.readInteger();
         this.var_2679 = param1.readInteger();
         this.var_2682 = param1.readInteger();
         this.var_2680 = param1.readString();
         this.var_1885 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2681;
      }
      
      public function get minute() : int
      {
         return this.var_2679;
      }
      
      public function get chatterId() : int
      {
         return this.var_2682;
      }
      
      public function get chatterName() : String
      {
         return this.var_2680;
      }
      
      public function get msg() : String
      {
         return this.var_1885;
      }
   }
}
