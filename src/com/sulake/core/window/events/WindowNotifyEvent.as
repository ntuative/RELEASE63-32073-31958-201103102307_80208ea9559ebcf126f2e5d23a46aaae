package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1552:String = "WN_CRETAE";
      
      public static const const_1641:String = "WN_CREATED";
      
      public static const const_1140:String = "WN_DESTROY";
      
      public static const const_1143:String = "WN_DESTROYED";
      
      public static const const_1192:String = "WN_OPEN";
      
      public static const const_1006:String = "WN_OPENED";
      
      public static const const_1183:String = "WN_CLOSE";
      
      public static const const_1042:String = "WN_CLOSED";
      
      public static const const_1230:String = "WN_FOCUS";
      
      public static const const_1002:String = "WN_FOCUSED";
      
      public static const const_1069:String = "WN_UNFOCUS";
      
      public static const const_1232:String = "WN_UNFOCUSED";
      
      public static const const_1189:String = "WN_ACTIVATE";
      
      public static const const_392:String = "WN_ACTVATED";
      
      public static const const_1100:String = "WN_DEACTIVATE";
      
      public static const const_1164:String = "WN_DEACTIVATED";
      
      public static const const_442:String = "WN_SELECT";
      
      public static const const_340:String = "WN_SELECTED";
      
      public static const const_752:String = "WN_UNSELECT";
      
      public static const const_624:String = "WN_UNSELECTED";
      
      public static const const_992:String = "WN_LOCK";
      
      public static const const_1096:String = "WN_LOCKED";
      
      public static const const_1091:String = "WN_UNLOCK";
      
      public static const const_1165:String = "WN_UNLOCKED";
      
      public static const const_1158:String = "WN_ENABLE";
      
      public static const const_630:String = "WN_ENABLED";
      
      public static const const_1120:String = "WN_DISABLE";
      
      public static const const_712:String = "WN_DISABLED";
      
      public static const const_894:String = "WN_RESIZE";
      
      public static const const_187:String = "WN_RESIZED";
      
      public static const const_1153:String = "WN_RELOCATE";
      
      public static const const_553:String = "WN_RELOCATED";
      
      public static const const_1046:String = "WN_MINIMIZE";
      
      public static const const_1185:String = "WN_MINIMIZED";
      
      public static const const_1095:String = "WN_MAXIMIZE";
      
      public static const const_1018:String = "WN_MAXIMIZED";
      
      public static const const_1214:String = "WN_RESTORE";
      
      public static const const_1005:String = "WN_RESTORED";
      
      public static const const_1932:String = "WN_ARRANGE";
      
      public static const const_1884:String = "WN_ARRANGED";
      
      public static const const_1855:String = "WN_UPDATE";
      
      public static const const_1917:String = "WN_UPDATED";
      
      public static const const_378:String = "WN_CHILD_ADDED";
      
      public static const const_803:String = "WN_CHILD_REMOVED";
      
      public static const const_287:String = "WN_CHILD_RESIZED";
      
      public static const const_303:String = "WN_CHILD_RELOCATED";
      
      public static const const_250:String = "WN_CHILD_ACTIVATED";
      
      public static const const_570:String = "WN_PARENT_ADDED";
      
      public static const const_1021:String = "WN_PARENT_REMOVED";
      
      public static const const_456:String = "WN_PARENT_RESIZED";
      
      public static const const_1166:String = "WN_PARENT_RELOCATED";
      
      public static const const_615:String = "WN_PARENT_ACTIVATED";
      
      public static const const_533:String = "WN_STATE_UPDATED";
      
      public static const const_430:String = "WN_STYLE_UPDATED";
      
      public static const const_549:String = "WN_PARAM_UPDATED";
      
      public static const const_1739:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_2020,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
