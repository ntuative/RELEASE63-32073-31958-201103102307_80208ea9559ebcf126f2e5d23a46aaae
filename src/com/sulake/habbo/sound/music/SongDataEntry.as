package com.sulake.habbo.sound.music
{
   import com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.ISongInfo;
   
   public class SongDataEntry extends PlayListEntry implements ISongInfo
   {
       
      
      private var var_1031:IHabboSound = null;
      
      private var var_1558:String;
      
      public function SongDataEntry(param1:int, param2:int, param3:String, param4:String, param5:IHabboSound)
      {
         this.var_1031 = param5;
         this.var_1558 = "";
         super(param1,param2,param3,param4);
      }
      
      override public function get id() : int
      {
         return var_2018;
      }
      
      override public function get length() : int
      {
         return var_2016;
      }
      
      override public function get name() : String
      {
         return _songName;
      }
      
      override public function get creator() : String
      {
         return var_2017;
      }
      
      public function get loaded() : Boolean
      {
         return this.var_1031 == null ? false : Boolean(this.var_1031.ready);
      }
      
      public function get soundObject() : IHabboSound
      {
         return this.var_1031;
      }
      
      public function get songData() : String
      {
         return this.var_1558;
      }
      
      public function set soundObject(param1:IHabboSound) : void
      {
         this.var_1031 = param1;
      }
      
      public function set songData(param1:String) : void
      {
         this.var_1558 = param1;
      }
   }
}
