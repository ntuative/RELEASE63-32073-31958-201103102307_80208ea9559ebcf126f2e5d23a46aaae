package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ToolbarView
   {
       
      
      private var _window:IWindowContainer;
      
      private var _events:IEventDispatcher;
      
      private var var_306:ToolbarBarMenuAnimator;
      
      private var var_2822:Array;
      
      private var var_261:Array;
      
      private var var_625:Array;
      
      private var var_225:IWindowContainer;
      
      private var var_1443:Boolean = false;
      
      private var var_508:String = "LEFT";
      
      private var var_161:Number = 50;
      
      private var var_1187:Boolean = true;
      
      private var var_1188:Number = 1;
      
      private var var_1444:Number = 0;
      
      private var var_1843:Number = 15;
      
      private var var_1844:Number = 5;
      
      public function ToolbarView(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IConnection, param4:IEventDispatcher)
      {
         this.var_2822 = new Array();
         this.var_261 = new Array();
         this.var_625 = new Array();
         super();
         this._events = param4;
         var _loc5_:XmlAsset = param2.getAssetByName("toolbar_window_xml") as XmlAsset;
         this._window = param1.buildFromXML(_loc5_.content as XML,2) as IWindowContainer;
         if(this._window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         this._window.tags.push("habbo_toolbar");
         this.var_161 = this._window.width;
         this.var_225 = param1.createWindow("extrabar_container_window","",HabboWindowType.const_62,HabboWindowStyle.const_1062,0 | 0,new Rectangle(0,0,1,1),null,0,0) as IWindowContainer;
         this._window.tags.push("habbo_extrabar");
         var _loc6_:XmlAsset = param2.getAssetByName("toolbar_xml") as XmlAsset;
         if(_loc6_ == null)
         {
            return;
         }
         var _loc7_:XML = _loc6_.content as XML;
         this.var_1187 = String(_loc7_.relocate_by_drag.@state) == "true";
         if(this.var_1187)
         {
            this._window.addEventListener(WindowMouseEvent.const_46,this.onToolbarMouseDown);
            this._window.context.getDesktopWindow().getDisplayObject().stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
            this._window.context.getDesktopWindow().getDisplayObject().stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         }
         this._window.context.getDesktopWindow().addEventListener(WindowEvent.const_50,this.onRoomViewResized);
         this.var_1188 = _loc7_.toolbar.@margin_top;
         this.var_1444 = _loc7_.toolbar.@margin_bottom;
         this.var_1843 = _loc7_.toolbar.@min_group_margin;
         this.var_1844 = _loc7_.toolbar.@margin_to_extrabar;
         this.var_306 = new ToolbarBarMenuAnimator(param1,this);
         var _loc8_:XMLList = XMLList(_loc7_.toolbar).children();
         var _loc9_:XMLList = XMLList(_loc7_.extras).children();
         this.createGroupsFromXmlList(_loc8_,this.var_261,param1,param2,param3,this._window,this.var_306);
         this.createGroupsFromXmlList(_loc9_,this.var_625,param1,param2,param3,this.var_225,this.var_306);
         this.alignWindows();
      }
      
      private function createGroupsFromXmlList(param1:XMLList, param2:Array, param3:IHabboWindowManager, param4:IAssetLibrary, param5:IConnection, param6:IWindowContainer, param7:ToolbarBarMenuAnimator) : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         while(_loc11_ < param1.length())
         {
            _loc8_ = param1[_loc11_];
            _loc9_ = _loc8_.children();
            _loc10_ = new ToolbarIconGroup(param3,param4,param5,_loc11_,this._events,param6,param7,this.var_161);
            _loc10_.defaultIconSize = _loc8_.@icon_size;
            _loc10_.iconSize = _loc10_.defaultIconSize;
            _loc10_.orientation = _loc8_.@default_orientation;
            _loc10_.windowMargin = _loc8_.@window_margin;
            _loc10_.windowBottomMargin = _loc8_.@window_bottom_margin;
            if(_loc10_.addContentIndexFromXmlList(_loc8_))
            {
               param2.push(_loc10_);
            }
            _loc11_++;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         while(this.var_261.length > 0)
         {
            _loc1_ = this.var_261.shift();
            _loc1_.dispose();
            _loc1_ = null;
         }
         while(this.var_625.length > 0)
         {
            _loc1_ = this.var_625.shift();
            _loc1_.dispose();
            _loc1_ = null;
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_225 != null)
         {
            this.var_225.dispose();
            this.var_225 = null;
         }
      }
      
      public function get barSize() : Number
      {
         return this.var_161;
      }
      
      public function get orientation() : String
      {
         return this.var_508;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Point = null) : void
      {
         var _loc4_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc4_ != null)
         {
            _loc4_.animateWindowIn(param1,param2,this.var_161,this.var_508,param3);
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer) : void
      {
         var _loc3_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.animateWindowOut(param1,param2,this.var_508);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer) : void
      {
         this.alignWindows();
         var _loc3_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.positionWindow(param1,param2,this.var_161,this.var_508);
         }
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer) : void
      {
         this.alignWindows();
         var _loc3_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.hideWindow(param1,param2,this.var_161,this.var_508);
         }
      }
      
      public function setIcon(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc3_ != null)
         {
            _loc3_.setIcon(param1,param2);
            this.alignWindows();
         }
      }
      
      public function method_7(param1:String, param2:BitmapData) : void
      {
         var _loc3_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc3_ != null)
         {
            _loc3_.setContent(param1,param2);
            this.alignWindows();
         }
      }
      
      public function setIconState(param1:String, param2:String) : void
      {
         var _loc3_:ToolbarIcon = this.getIconById(param1);
         if(_loc3_ != null)
         {
            _loc3_.state = param2;
            this.alignWindows();
         }
      }
      
      public function removeIcon(param1:String) : void
      {
         var _loc2_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            _loc2_.removeContent(param1);
            this.alignWindows();
         }
      }
      
      public function getIconLoc(param1:String) : Point
      {
         var _loc2_:ToolbarIcon = this.getIconById(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return new Point(_loc2_.x,_loc2_.y);
      }
      
      private function onRoomViewResized(param1:WindowEvent) : void
      {
         this.alignWindows();
         var _loc2_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_1206);
         this._events.dispatchEvent(_loc2_);
      }
      
      private function getGroupForIcon(param1:String) : ToolbarIconGroup
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < this.var_261.length)
         {
            _loc2_ = this.var_261[_loc3_];
            if(_loc2_.acceptsIcon(param1))
            {
               return _loc2_;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.var_625.length)
         {
            _loc2_ = this.var_625[_loc3_];
            if(_loc2_.acceptsIcon(param1))
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function getIconById(param1:String) : ToolbarIcon
      {
         var _loc2_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            return _loc2_.getIconById(param1);
         }
         return null;
      }
      
      public function getIconByMenuId(param1:String) : ToolbarIcon
      {
         var _loc2_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            return _loc2_.getIconByMenuId(param1);
         }
         return null;
      }
      
      private function alignWindows() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         if(this._window == null || this.var_225 == null)
         {
            return;
         }
         var _loc1_:IDesktopWindow = this._window.context.getDesktopWindow();
         if(_loc1_ == null)
         {
            return;
         }
         this._window.visible = true;
         switch(this.orientation)
         {
            case "LEFT":
               this._window.height = _loc1_.height;
               this._window.x = 0;
               this._window.y = 0;
               this.var_225.x = this.var_161 + this.var_1844;
               this.var_225.y = 0;
               _loc4_ = this._window.height;
               break;
            case "RIGHT":
               this._window.width = this.var_161;
               this._window.height = _loc1_.height;
               this._window.x = _loc1_.width - this.var_161;
               this._window.y = 0;
               this.var_225.x = 0;
               this.var_225.y = 0;
               _loc4_ = this._window.height;
               break;
            case "TOP":
               this._window.width = _loc1_.width;
               this._window.height = this.var_161;
               this._window.x = 0;
               this._window.y = 0;
               this.var_225.x = 0;
               this.var_225.y = this.var_161 + this.var_1844;
               _loc4_ = this._window.width;
               break;
            case "BOTTOM":
               this._window.width = _loc1_.width;
               this._window.height = this.var_161;
               this._window.x = 0;
               this._window.y = _loc1_.height - this.var_161;
               this.var_225.x = 0;
               this.var_225.y = 0;
               _loc4_ = this._window.width;
         }
         _loc4_ -= this.var_1444;
         _loc4_ -= this.var_1188;
         var _loc5_:* = 0;
         _loc2_ = 0;
         while(_loc2_ < this.var_261.length)
         {
            _loc3_ = this.var_261[_loc2_];
            _loc5_ += _loc3_.iconCount * _loc3_.defaultIconSize;
            _loc2_++;
         }
         var _loc6_:* = 0;
         var _loc7_:Number = this.var_1188;
         var _loc8_:* = 1;
         if(_loc5_ > _loc4_)
         {
            _loc8_ = Number(_loc4_ / _loc5_);
         }
         else
         {
            _loc8_ = Number(Math.max(1,_loc4_ / (_loc5_ / 0.7)));
            if(this.var_261.length > 1)
            {
               if(this.orientation == "LEFT" || this.orientation == "RIGHT")
               {
                  _loc6_ = Number(Math.max(this.var_1843,(this._window.height - _loc5_ * _loc8_ - this.var_1188 - this.var_1444) / (this.var_261.length - 1)));
               }
               else
               {
                  _loc6_ = Number(Math.max(this.var_1843,(this._window.width - _loc5_ * _loc8_ - this.var_1188 - this.var_1444) / (this.var_261.length - 1)));
               }
            }
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_261.length)
         {
            _loc3_ = this.var_261[_loc2_];
            if(_loc3_ != null)
            {
               _loc3_.orientation = this.var_508;
               _loc3_.iconSize = _loc3_.defaultIconSize * _loc8_;
               _loc3_.position = _loc7_;
               _loc7_ += _loc3_.size + _loc6_;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_625.length)
         {
            _loc3_ = this.var_625[_loc2_];
            if(_loc3_ != null)
            {
               _loc3_.position = _loc2_;
            }
            _loc2_++;
         }
         if(this.var_306 != null)
         {
            this.var_306.refresh();
         }
      }
      
      private function onToolbarMouseDown(param1:WindowEvent) : void
      {
         if(this.var_1187)
         {
            this.var_1443 = true;
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_1187 && this.var_1443)
         {
            _loc2_ = this.getTargetOrientationFromXY(param1.stageX,param1.stageY);
            if(_loc2_ != null && _loc2_ != this.var_508)
            {
               this.var_508 = _loc2_;
               this.alignWindows();
               if(this._events != null)
               {
                  _loc3_ = new HabboToolbarEvent(HabboToolbarEvent.const_544);
                  _loc3_.orientation = this.var_508;
                  this._events.dispatchEvent(_loc3_);
               }
            }
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         if(this.var_1187 && this.var_1443)
         {
            this.var_1443 = false;
         }
      }
      
      private function getTargetOrientationFromXY(param1:Number, param2:Number) : String
      {
         var _loc3_:IDesktopWindow = this._window.context.getDesktopWindow();
         if(_loc3_ == null)
         {
            return null;
         }
         if(param1 <= this.var_161)
         {
            return "LEFT";
         }
         if(param1 >= _loc3_.width - this.var_161)
         {
            return "RIGHT";
         }
         if(param2 <= this.var_161)
         {
            return "TOP";
         }
         if(param2 >= _loc3_.height - this.var_161)
         {
            return "BOTTOM";
         }
         return null;
      }
   }
}
