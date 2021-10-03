package com.sulake.habbo.inventory.trading
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAcceptEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAlreadyOpenEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCloseEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCompletedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingConfirmationEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingNotOpenEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOtherNotAllowedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingYouAreNotAllowedEvent;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.AcceptTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.AddItemToTradeComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.CloseTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.ConfirmAcceptTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.ConfirmDeclineTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.OpenTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.RemoveItemFromTradeComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.UnacceptTradingComposer;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.enum.InventorySubCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class TradingModel implements IInventoryModel, IGetImageListener
   {
      
      public static const const_1652:uint = 9;
      
      public static const const_172:uint = 0;
      
      public static const const_175:uint = 1;
      
      public static const const_407:uint = 2;
      
      public static const const_305:uint = 3;
      
      public static const const_521:uint = 4;
      
      public static const const_242:uint = 5;
      
      public static const TRADING_STATE_CANCELLED:uint = 6;
       
      
      private var _inventory:HabboInventory;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _roomEngine:IRoomEngine;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_54:TradingView;
      
      private var _disposed:Boolean = false;
      
      private var var_783:Boolean = false;
      
      private var _state:uint = 0;
      
      private var var_700:int = -1;
      
      private var var_2219:String = "";
      
      private var var_243:Map;
      
      private var var_699:Boolean = false;
      
      private var var_2220:Boolean = false;
      
      private var var_1320:int = -1;
      
      private var var_2221:String = "";
      
      private var var_852:Map;
      
      private var var_1066:Boolean = false;
      
      private var _otherUserCanTrade:Boolean = false;
      
      public function TradingModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IRoomEngine, param6:IHabboLocalizationManager)
      {
         super();
         this._inventory = param1;
         this._communication = param3;
         this._assetLibrary = param4;
         this._roomEngine = param5;
         this._localization = param6;
         this.var_54 = new TradingView(this,param2,param4,param5,param6);
      }
      
      public function get running() : Boolean
      {
         return this._state != const_172;
      }
      
      public function get state() : uint
      {
         return this._state;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get method_12() : int
      {
         return this.var_700;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2219;
      }
      
      public function get ownUserItems() : Map
      {
         return this.var_243;
      }
      
      public function get ownUserAccepts() : Boolean
      {
         return this.var_699;
      }
      
      public function get ownUserCanTrade() : Boolean
      {
         return this.var_2220;
      }
      
      public function get otherUserId() : int
      {
         return this.var_1320;
      }
      
      public function get otherUserName() : String
      {
         return this.var_2221;
      }
      
      public function get otherUserItems() : Map
      {
         return this.var_852;
      }
      
      public function get otherUserAccepts() : Boolean
      {
         return this.var_1066;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return this._otherUserCanTrade;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_54 && !this.var_54.disposed)
            {
               this.var_54.dispose();
               this.var_54 = null;
            }
            this._inventory = null;
            this._communication = null;
            this._assetLibrary = null;
            this._roomEngine = null;
            this._localization = null;
            this._disposed = true;
         }
      }
      
      public function startTrading(param1:int, param2:String, param3:Boolean, param4:int, param5:String, param6:Boolean) : void
      {
         this.var_700 = param1;
         this.var_2219 = param2;
         this.var_243 = new Map();
         this.var_699 = false;
         this.var_2220 = param3;
         this.var_1320 = param4;
         this.var_2221 = param5;
         this.var_852 = new Map();
         this.var_1066 = false;
         this._otherUserCanTrade = param6;
         this.var_783 = true;
         this.state = const_175;
         this.var_54.setup(param1,param3,param4,param6);
         this.var_54.updateItemList(this.var_700);
         this.var_54.updateItemList(this.var_1320);
         this.var_54.updateUserInterface();
         this.var_54.clearItemLists();
         this._inventory.toggleInventoryPage(InventoryCategory.const_77);
         this._inventory.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_TRADING));
      }
      
      public function close() : void
      {
         if(this.var_783)
         {
            if(this._state != const_172 && this._state != const_242)
            {
               this.requestCancelTrading();
               this.state = TradingModel.TRADING_STATE_CANCELLED;
            }
            this.state = const_172;
            this._inventory.toggleInventorySubPage(InventorySubCategory.const_49);
            this.var_783 = false;
         }
         this.var_54.setMinimized(false);
      }
      
      public function categorySwitch(param1:String) : void
      {
         this.var_54.setMinimized(param1 != InventoryCategory.const_77);
         this._inventory.updateSubView();
      }
      
      public function set state(param1:uint) : void
      {
         Logger.log("OLD STATE: " + this._state + " NEW STATE: " + param1 + " OWN: " + this.var_699 + " OTHER: " + this.var_1066);
         var _loc2_:Boolean = false;
         if(this._state == param1)
         {
            return;
         }
         switch(this._state)
         {
            case const_172:
               if(param1 == const_175 || param1 == const_242)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               break;
            case const_175:
               if(param1 == const_407)
               {
                  this._state = param1;
                  _loc2_ = true;
                  this.startConfirmCountdown();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  this._state = param1;
                  this.var_54.setMinimized(false);
                  _loc2_ = true;
               }
               break;
            case const_407:
               if(param1 == const_305)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  this._state = param1;
                  this.var_54.setMinimized(false);
                  _loc2_ = true;
               }
               else if(param1 == const_175)
               {
                  this._state = param1;
                  _loc2_ = true;
                  this.cancelConfirmCountdown();
               }
               break;
            case const_305:
               if(param1 == const_521)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               else if(param1 == const_242)
               {
                  this._state = param1;
                  _loc2_ = true;
                  this.close();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  this._state = param1;
                  this.var_54.setMinimized(false);
                  _loc2_ = true;
                  this.close();
               }
               break;
            case const_521:
               if(param1 == const_242)
               {
                  this._state = param1;
                  this.var_54.setMinimized(false);
                  _loc2_ = true;
                  this.close();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  this._state = param1;
                  this.var_54.setMinimized(false);
                  _loc2_ = true;
                  this.close();
               }
               break;
            case const_242:
               if(param1 == const_172)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               break;
            case TRADING_STATE_CANCELLED:
               if(param1 == const_172)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               else if(param1 == const_175)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               break;
            default:
               throw new Error("Unknown trading progress state: \"" + this._state + "\"");
         }
         if(_loc2_)
         {
            this.var_54.updateUserInterface();
            return;
         }
         throw new Error("Error assigning trading process status!");
      }
      
      public function getFurniInventoryModel() : FurniModel
      {
         return this._inventory.furniModel;
      }
      
      public function updateItemGroupMaps(param1:int, param2:Map, param3:int, param4:Map) : void
      {
         if(this._inventory == null)
         {
            return;
         }
         if(this.var_243 != null)
         {
            this.var_243.dispose();
         }
         if(this.var_852 != null)
         {
            this.var_852.dispose();
         }
         if(param1 == this.var_700)
         {
            this.var_243 = param2;
            this.var_852 = param4;
         }
         else
         {
            this.var_243 = param4;
            this.var_852 = param2;
         }
         this.var_699 = false;
         this.var_1066 = false;
         this.var_54.updateItemList(this.var_700);
         this.var_54.updateItemList(this.var_1320);
         this.var_54.updateUserInterface();
         var _loc5_:FurniModel = this._inventory.furniModel;
         if(_loc5_ != null)
         {
            _loc5_.updateItemLocks();
         }
      }
      
      public function getOwnItemIdsInTrade() : Array
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc1_:Array = new Array();
         if(this.var_243 == null || this.var_243.disposed)
         {
            return _loc1_;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.var_243.length)
         {
            _loc2_ = this.var_243.getWithIndex(_loc4_) as GroupItem;
            if(_loc2_ != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc2_.getTotalCount())
               {
                  _loc3_ = _loc2_.getAt(_loc5_);
                  if(_loc3_ != null)
                  {
                     _loc1_.push(_loc3_.ref);
                  }
                  _loc5_++;
               }
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return this.var_54.getWindowContainer();
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
      }
      
      public function subCategorySwitch(param1:String) : void
      {
         if(this.var_783)
         {
            if(this._state != const_172)
            {
               this.requestCancelTrading();
            }
         }
      }
      
      public function closingInventoryView() : void
      {
         if(this.var_783)
         {
            this.close();
         }
      }
      
      public function startConfirmCountdown() : void
      {
         this.var_54.startConfirmCountdown();
      }
      
      public function cancelConfirmCountdown() : void
      {
         this.var_54.cancelConfirmCountdown();
      }
      
      public function confirmCountdownReady() : void
      {
         if(this._state == const_407)
         {
            this.state = const_305;
         }
      }
      
      public function getItemImage(param1:IItem) : BitmapData
      {
         var _loc2_:* = null;
         if(param1 is FloorItem)
         {
            _loc2_ = this._roomEngine.getFurnitureImage(param1.type,new Vector3d(180,0,0),64,this,0,String(param1.extra));
         }
         else
         {
            _loc2_ = this._roomEngine.getWallItemImage(param1.type,new Vector3d(180,0,0),64,this,0,param1.stuffData);
         }
         return _loc2_.data as BitmapData;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         this.var_54.updateItemImage(param1,param2);
      }
      
      public function handleMessageEvent(param1:IMessageEvent) : void
      {
         var _loc2_:* = null;
         if(param1 is TradingAlreadyOpenEvent)
         {
            Logger.log("TRADING::TradingAlreadyOpenEvent");
            this.var_54.alertPopup(TradingView.const_1051);
         }
         else if(param1 is TradingAcceptEvent)
         {
            Logger.log("TRADING::TradingAcceptEvent");
            if(TradingAcceptEvent(param1).userID == this.var_700)
            {
               this.var_699 = TradingAcceptEvent(param1).userAccepts != 0;
            }
            else
            {
               this.var_1066 = TradingAcceptEvent(param1).userAccepts != 0;
            }
            this.var_54.updateUserInterface();
         }
         else if(param1 is TradingConfirmationEvent)
         {
            Logger.log("TRADING::TradingConfirmationEvent");
            this.state = const_407;
         }
         else if(param1 is TradingCompletedEvent)
         {
            Logger.log("TRADING::TradingCompletedEvent");
            this.state = const_242;
         }
         else if(param1 is TradingCloseEvent)
         {
            Logger.log("TRADING::TradingCloseEvent");
            if(!this.var_783)
            {
               Logger.log("Received TradingCloseEvent, but trading already stopped!!!");
               return;
            }
            _loc2_ = param1 as TradingCloseEvent;
            if(_loc2_.userID != this.var_700)
            {
               this.var_54.alertPopup(TradingView.const_1139);
            }
            this.close();
         }
         else if(param1 is TradingNotOpenEvent)
         {
            Logger.log("TRADING::TradingNotOpenEvent");
         }
         else if(param1 is TradingOtherNotAllowedEvent)
         {
            this.var_54.showOtherUserNotification("${inventory.trading.warning.others_account_disabled}");
         }
         else if(param1 is TradingYouAreNotAllowedEvent)
         {
            this.var_54.showOwnUserNotification("${inventory.trading.warning.own_account_disabled}");
         }
         else
         {
            Logger.log("TRADING/Unknown message event: " + param1);
         }
      }
      
      public function requestFurniViewOpen() : void
      {
         this._inventory.toggleInventoryPage(InventoryCategory.const_77);
      }
      
      public function requestOpenTrading(param1:int) : void
      {
         this._communication.getHabboMainConnection(null).send(new OpenTradingComposer(param1));
      }
      
      public function requestAddItemToTrading(param1:int, param2:int, param3:int, param4:Boolean, param5:String = "") : Boolean
      {
         var _loc6_:* = null;
         if(this.var_699)
         {
            return false;
         }
         if(this.var_243 == null)
         {
            return false;
         }
         if(this.var_243.length < const_1652)
         {
            this._communication.getHabboMainConnection(null).send(new AddItemToTradeComposer(param1));
         }
         else
         {
            if(!param4)
            {
               return false;
            }
            _loc6_ = String(param2);
            if(param3 == FurniCategory.const_162)
            {
               _loc6_ = String(param2) + "poster" + param5;
            }
            if(this.var_243.getValue(_loc6_) == null)
            {
               return false;
            }
            this._communication.getHabboMainConnection(null).send(new AddItemToTradeComposer(param1));
         }
         return true;
      }
      
      public function requestRemoveItemFromTrading(param1:int) : void
      {
         var _loc3_:* = null;
         if(this.var_699)
         {
            return;
         }
         var _loc2_:GroupItem = this.ownUserItems.getWithIndex(param1);
         if(_loc2_)
         {
            _loc3_ = _loc2_.peek();
            if(_loc3_)
            {
               this._communication.getHabboMainConnection(null).send(new RemoveItemFromTradeComposer(_loc3_.id));
            }
         }
      }
      
      public function requestAcceptTrading() : void
      {
         this._communication.getHabboMainConnection(null).send(new AcceptTradingComposer());
      }
      
      public function requestUnacceptTrading() : void
      {
         this._communication.getHabboMainConnection(null).send(new UnacceptTradingComposer());
      }
      
      public function requestConfirmAcceptTrading() : void
      {
         this.state = const_521;
         this._communication.getHabboMainConnection(null).send(new ConfirmAcceptTradingComposer());
      }
      
      public function requestConfirmDeclineTrading() : void
      {
         this._communication.getHabboMainConnection(null).send(new ConfirmDeclineTradingComposer());
      }
      
      public function requestCancelTrading() : void
      {
         this._communication.getHabboMainConnection(null).send(new CloseTradingComposer());
      }
   }
}
