package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      protected var var_2018:int;
      
      protected var var_2016:int;
      
      protected var _songName:String;
      
      protected var var_2017:String;
      
      private var var_2528:Number = 0.0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2018 = param1;
         this.var_2016 = param2;
         this._songName = param3;
         this.var_2017 = param4;
      }
      
      public function get id() : int
      {
         return this.var_2018;
      }
      
      public function get length() : int
      {
         return this.var_2016;
      }
      
      public function get name() : String
      {
         return this._songName;
      }
      
      public function get creator() : String
      {
         return this.var_2017;
      }
      
      public function get startPlayHeadPos() : Number
      {
         return this.var_2528;
      }
      
      public function set startPlayHeadPos(param1:Number) : void
      {
         this.var_2528 = param1;
      }
   }
}
