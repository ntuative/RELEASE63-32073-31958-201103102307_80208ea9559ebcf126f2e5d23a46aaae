package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_683:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2445:int;
      
      private var var_2443:int;
      
      private var _color:uint;
      
      private var var_1137:int;
      
      private var var_2444:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_683);
         this.var_2445 = param1;
         this.var_2443 = param2;
         this._color = param3;
         this.var_1137 = param4;
         this.var_2444 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2445;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2443;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1137;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2444;
      }
   }
}
