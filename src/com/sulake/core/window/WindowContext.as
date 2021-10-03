package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_483:uint = 0;
      
      public static const const_1487:uint = 1;
      
      public static const const_1912:int = 0;
      
      public static const const_1810:int = 1;
      
      public static const const_1863:int = 2;
      
      public static const const_1967:int = 3;
      
      public static const const_1574:int = 4;
      
      public static const const_366:int = 5;
      
      public static var var_385:IEventQueue;
      
      private static var var_608:IEventProcessor;
      
      private static var var_1788:uint = const_483;
      
      private static var stage:Stage;
      
      private static var var_167:IWindowRenderer;
       
      
      private var var_2507:EventProcessorState;
      
      private var var_2508:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_207:DisplayObjectContainer;
      
      protected var var_2836:Boolean = true;
      
      protected var var_1247:Error;
      
      protected var var_2015:int = -1;
      
      protected var var_1256:IInternalWindowServices;
      
      protected var var_1510:IWindowParser;
      
      protected var var_2785:IWindowFactory;
      
      protected var var_139:IDesktopWindow;
      
      protected var var_1511:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_536:Boolean = false;
      
      private var var_2506:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_167 = param2;
         this._localization = param4;
         this.var_207 = param5;
         this.var_1256 = new ServiceManager(this,param5);
         this.var_2785 = param3;
         this.var_1510 = new WindowParser(this);
         this.var_2508 = param7;
         if(!stage)
         {
            if(this.var_207 is Stage)
            {
               stage = this.var_207 as Stage;
            }
            else if(this.var_207.stage)
            {
               stage = this.var_207.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_139 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_207.addChild(this.var_139.getDisplayObject());
         this.var_207.doubleClickEnabled = true;
         this.var_207.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2507 = new EventProcessorState(var_167,this.var_139,this.var_139,null,this.var_2508);
         inputMode = const_483;
         this.var_1511 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1788;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_385)
         {
            if(var_385 is IDisposable)
            {
               IDisposable(var_385).dispose();
            }
         }
         if(var_608)
         {
            if(var_608 is IDisposable)
            {
               IDisposable(var_608).dispose();
            }
         }
         switch(value)
         {
            case const_483:
               var_385 = new MouseEventQueue(stage);
               var_608 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1487:
               var_385 = new TabletEventQueue(stage);
               var_608 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_483;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_207.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_207.removeChild(IGraphicContextHost(this.var_139).getGraphicContext(true) as DisplayObject);
            this.var_139.destroy();
            this.var_139 = null;
            this.var_1511.destroy();
            this.var_1511 = null;
            if(this.var_1256 is IDisposable)
            {
               IDisposable(this.var_1256).dispose();
            }
            this.var_1256 = null;
            this.var_1510.dispose();
            this.var_1510 = null;
            var_167 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1247;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2015;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1247 = param2;
         this.var_2015 = param1;
         if(this.var_2836)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1247 = null;
         this.var_2015 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1256;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1510;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2785;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_139;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_139.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1574,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1511;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_139,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_139)
         {
            this.var_139 = null;
         }
         if(param1.state != WindowState.const_459)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_167.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_536 = true;
         if(this.var_1247)
         {
            throw this.var_1247;
         }
         var_608.process(this.var_2507,var_385);
         this.var_536 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2506 = true;
         var_167.update(param1);
         this.var_2506 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_139 != null && !this.var_139.disposed)
         {
            if(this.var_207 is Stage)
            {
               this.var_139.width = Stage(this.var_207).stageWidth;
               this.var_139.height = Stage(this.var_207).stageHeight;
            }
            else
            {
               this.var_139.width = this.var_207.width;
               this.var_139.height = this.var_207.height;
            }
         }
      }
   }
}
