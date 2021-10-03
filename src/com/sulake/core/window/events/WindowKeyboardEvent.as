package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   
   public class WindowKeyboardEvent extends WindowEvent
   {
      
      public static const const_346:String = "WKE_KEY_UP";
      
      public static const const_193:String = "WKE_KEY_DOWN";
      
      public static const const_165:String = "";
       
      
      private var var_693:KeyboardEvent;
      
      public function WindowKeyboardEvent(param1:String, param2:Event, param3:IWindow, param4:IWindow, param5:Boolean = false, param6:Boolean = false)
      {
         _type = param1;
         this.var_693 = KeyboardEvent(param2);
         super(param1,param3,param4,param5,false);
      }
      
      public function get charCode() : uint
      {
         return this.var_693.charCode;
      }
      
      public function get keyCode() : uint
      {
         return this.var_693.keyCode;
      }
      
      public function get keyLocation() : uint
      {
         return this.var_693.keyLocation;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_693.altKey;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_693.shiftKey;
      }
      
      override public function clone() : Event
      {
         return new WindowKeyboardEvent(_type,this.var_693,window,related,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowKeyboardEvent","type","bubbles","cancelable","window","charCode");
      }
   }
}
