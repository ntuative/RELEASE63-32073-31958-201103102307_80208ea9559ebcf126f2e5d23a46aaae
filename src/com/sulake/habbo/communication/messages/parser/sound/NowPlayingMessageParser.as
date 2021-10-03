package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1796:int;
      
      private var var_1797:int;
      
      private var var_1798:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get current() : int
      {
         return this.var_1796;
      }
      
      public function get next() : int
      {
         return this.var_1797;
      }
      
      public function get syncCount() : int
      {
         return this.var_1798;
      }
      
      public function flush() : Boolean
      {
         this.var_1796 = -1;
         this.var_1797 = -1;
         this.var_1798 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1796 = param1.readInteger();
         this.var_1797 = param1.readInteger();
         this.var_1798 = param1.readInteger();
         return true;
      }
   }
}
