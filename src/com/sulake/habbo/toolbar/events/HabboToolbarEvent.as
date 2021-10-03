package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_68:String = "HTE_INITIALIZED";
      
      public static const const_39:String = "HTE_TOOLBAR_CLICK";
      
      public static const const_544:String = "HTE_TOOLBAR_ORIENTATION";
      
      public static const const_1206:String = "HTE_TOOLBAR_RESIZED";
       
      
      private var var_725:String;
      
      private var var_508:String;
      
      private var var_1114:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_725 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_725;
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_508 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_508;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1114 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1114;
      }
   }
}
