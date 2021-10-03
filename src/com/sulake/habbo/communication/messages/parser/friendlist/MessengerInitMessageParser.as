package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2641:int;
      
      private var var_2642:int;
      
      private var var_2639:int;
      
      private var var_2640:int;
      
      private var var_97:Array;
      
      private var var_223:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_97 = new Array();
         this.var_223 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2641 = param1.readInteger();
         this.var_2642 = param1.readInteger();
         this.var_2639 = param1.readInteger();
         this.var_2640 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_97.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_223.push(new FriendData(param1));
            _loc4_++;
         }
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2641;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2642;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2639;
      }
      
      public function get categories() : Array
      {
         return this.var_97;
      }
      
      public function get friends() : Array
      {
         return this.var_223;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2640;
      }
   }
}
