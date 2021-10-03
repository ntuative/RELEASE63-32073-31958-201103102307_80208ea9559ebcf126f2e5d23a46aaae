package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_32;
      
      private static var var_123:Stage;
      
      private static var var_284:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_662:Boolean = true;
      
      private static var var_108:DisplayObject;
      
      private static var var_1265:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_123 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_108)
            {
               var_123.removeChild(var_108);
               var_123.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_123.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_123.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_123.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_662 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_284;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_284 = param1;
         if(var_284)
         {
            if(var_108)
            {
               var_108.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_108)
         {
            var_108.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_662)
         {
            _loc1_ = var_1265[_type];
            if(_loc1_)
            {
               if(var_108)
               {
                  var_123.removeChild(var_108);
               }
               else
               {
                  var_123.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_123.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_123.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_123.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_108 = _loc1_;
               var_123.addChild(var_108);
            }
            else
            {
               if(var_108)
               {
                  var_123.removeChild(var_108);
                  var_123.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_123.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_123.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_123.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_108 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_32:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_289:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_1476:
                  case MouseCursorType.const_268:
                  case MouseCursorType.const_1541:
                  case MouseCursorType.const_1393:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_662 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1265[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_108)
         {
            var_108.x = param1.stageX - 2;
            var_108.y = param1.stageY;
            if(_type == MouseCursorType.const_32)
            {
               var_284 = false;
               Mouse.show();
            }
            else
            {
               var_284 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_108 && _type != MouseCursorType.const_32)
         {
            Mouse.hide();
            var_284 = false;
         }
      }
   }
}
