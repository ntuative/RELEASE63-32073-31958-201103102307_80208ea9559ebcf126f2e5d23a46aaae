package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1630:String = "WE_CREATE";
      
      public static const const_1646:String = "WE_CREATED";
      
      public static const const_1415:String = "WE_DESTROY";
      
      public static const const_327:String = "WE_DESTROYED";
      
      public static const const_1604:String = "WE_OPEN";
      
      public static const const_1395:String = "WE_OPENED";
      
      public static const const_1563:String = "WE_CLOSE";
      
      public static const const_1600:String = "WE_CLOSED";
      
      public static const const_1490:String = "WE_FOCUS";
      
      public static const const_320:String = "WE_FOCUSED";
      
      public static const const_1536:String = "WE_UNFOCUS";
      
      public static const const_1458:String = "WE_UNFOCUSED";
      
      public static const const_1579:String = "WE_ACTIVATE";
      
      public static const const_1455:String = "WE_ACTIVATED";
      
      public static const const_1659:String = "WE_DEACTIVATE";
      
      public static const const_796:String = "WE_DEACTIVATED";
      
      public static const const_446:String = "WE_SELECT";
      
      public static const const_64:String = "WE_SELECTED";
      
      public static const const_678:String = "WE_UNSELECT";
      
      public static const const_669:String = "WE_UNSELECTED";
      
      public static const const_1740:String = "WE_ATTACH";
      
      public static const const_1872:String = "WE_ATTACHED";
      
      public static const const_1753:String = "WE_DETACH";
      
      public static const const_1737:String = "WE_DETACHED";
      
      public static const const_1406:String = "WE_LOCK";
      
      public static const const_1473:String = "WE_LOCKED";
      
      public static const const_1394:String = "WE_UNLOCK";
      
      public static const const_1431:String = "WE_UNLOCKED";
      
      public static const const_726:String = "WE_ENABLE";
      
      public static const const_316:String = "WE_ENABLED";
      
      public static const const_869:String = "WE_DISABLE";
      
      public static const const_254:String = "WE_DISABLED";
      
      public static const const_1557:String = "WE_RELOCATE";
      
      public static const const_380:String = "WE_RELOCATED";
      
      public static const const_1494:String = "WE_RESIZE";
      
      public static const const_50:String = "WE_RESIZED";
      
      public static const const_1562:String = "WE_MINIMIZE";
      
      public static const const_1651:String = "WE_MINIMIZED";
      
      public static const const_1605:String = "WE_MAXIMIZE";
      
      public static const const_1609:String = "WE_MAXIMIZED";
      
      public static const const_1471:String = "WE_RESTORE";
      
      public static const const_1642:String = "WE_RESTORED";
      
      public static const const_1843:String = "WE_ARRANGE";
      
      public static const const_1856:String = "WE_ARRANGED";
      
      public static const const_110:String = "WE_UPDATE";
      
      public static const const_1792:String = "WE_UPDATED";
      
      public static const const_1858:String = "WE_CHILD_RELOCATE";
      
      public static const const_515:String = "WE_CHILD_RELOCATED";
      
      public static const const_1836:String = "WE_CHILD_RESIZE";
      
      public static const const_284:String = "WE_CHILD_RESIZED";
      
      public static const const_1893:String = "WE_CHILD_REMOVE";
      
      public static const const_471:String = "WE_CHILD_REMOVED";
      
      public static const const_1861:String = "WE_PARENT_RELOCATE";
      
      public static const const_1870:String = "WE_PARENT_RELOCATED";
      
      public static const const_1897:String = "WE_PARENT_RESIZE";
      
      public static const const_1506:String = "WE_PARENT_RESIZED";
      
      public static const const_183:String = "WE_OK";
      
      public static const const_842:String = "WE_CANCEL";
      
      public static const const_109:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_522:String = "WE_SCROLL";
      
      public static const const_165:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_2020:IWindow;
      
      protected var var_2021:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_2020 = param3;
         this.var_2021 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_2020;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_2021 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_2021;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
