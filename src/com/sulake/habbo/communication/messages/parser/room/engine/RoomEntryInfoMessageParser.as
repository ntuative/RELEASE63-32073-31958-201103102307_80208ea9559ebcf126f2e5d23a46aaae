package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1677:Boolean;
      
      private var var_2333:int;
      
      private var var_396:Boolean;
      
      private var var_1099:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1677;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2333;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1099;
      }
      
      public function get owner() : Boolean
      {
         return this.var_396;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1099 != null)
         {
            this.var_1099.dispose();
            this.var_1099 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1677 = param1.readBoolean();
         if(this.var_1677)
         {
            this.var_2333 = param1.readInteger();
            this.var_396 = param1.readBoolean();
         }
         else
         {
            this.var_1099 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
