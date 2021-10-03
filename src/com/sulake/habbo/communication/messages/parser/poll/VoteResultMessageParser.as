package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1091:String;
      
      private var var_1353:Array;
      
      private var var_1077:Array;
      
      private var var_1681:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1091;
      }
      
      public function get choices() : Array
      {
         return this.var_1353.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1077.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1681;
      }
      
      public function flush() : Boolean
      {
         this.var_1091 = "";
         this.var_1353 = [];
         this.var_1077 = [];
         this.var_1681 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1091 = param1.readString();
         this.var_1353 = [];
         this.var_1077 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1353.push(param1.readString());
            this.var_1077.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1681 = param1.readInteger();
         return true;
      }
   }
}
