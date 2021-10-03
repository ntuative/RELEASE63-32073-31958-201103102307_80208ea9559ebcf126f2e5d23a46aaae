package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.ActivityPointDisplayCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.BotCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.CatalogWidgetEnum;
   import com.sulake.habbo.catalog.viewer.widgets.ClubBuyCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ColourGridCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ICatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ItemGridCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ItemGroupCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.LocalizationCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceOwnItemsCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.NewPetsCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PetsCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ProductViewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PurchaseCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PurseCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RecyclerCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RecyclerPrizesCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RedeemItemCodeCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SingleViewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SpacesCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SpecialInfoWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TextInputCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TraxPreviewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TrophyCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetsInitializedEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import flash.events.Event;
   
   public class CatalogPage implements ICatalogPage
   {
      
      protected static const const_1685:String = "ctlg_";
       
      
      protected var var_2013:XML;
      
      protected var _window:IWindowContainer;
      
      private var _viewer:ICatalogViewer;
      
      private var _pageId:int;
      
      private var var_1120:String;
      
      private var _offers:Array;
      
      private var _localization:IPageLocalization;
      
      private var var_48:Array;
      
      private var var_478:EventDispatcher;
      
      private var _catalog:HabboCatalog;
      
      private var var_1119:ItemGridCatalogWidget;
      
      public function CatalogPage(param1:ICatalogViewer, param2:int, param3:String, param4:IPageLocalization, param5:Array, param6:HabboCatalog)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         this.var_48 = [];
         super();
         this._viewer = param1;
         this._pageId = param2;
         this.var_1120 = param3;
         this._localization = param4;
         this._offers = new Array();
         this._catalog = param6;
         for each(_loc7_ in param5)
         {
            _loc8_ = new Offer(_loc7_,this);
            if(_loc8_.productContainer != null)
            {
               this._offers.push(_loc8_);
            }
            else
            {
               _loc8_.dispose();
            }
         }
         this.var_478 = new EventDispatcher();
         this.var_48 = new Array();
         this.init();
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function get viewer() : ICatalogViewer
      {
         return this._viewer;
      }
      
      public function get pageId() : int
      {
         return this._pageId;
      }
      
      public function get layoutCode() : String
      {
         return this.var_1120;
      }
      
      public function get offers() : Array
      {
         return this._offers;
      }
      
      public function get localization() : IPageLocalization
      {
         return this._localization;
      }
      
      public function get links() : Array
      {
         return this._localization.getLinks(this.var_1120);
      }
      
      public function get hasLinks() : Boolean
      {
         return this._localization.hasLinks(this.var_1120);
      }
      
      public function selectOffer(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_1119 != null)
         {
            Logger.log("selecting offer " + param1);
            for each(_loc2_ in this._offers)
            {
               if(_loc2_.offerId == param1)
               {
                  _loc3_ = _loc2_.productContainer as IGridItem;
                  this.var_1119.select(_loc3_);
               }
            }
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_48)
         {
            _loc1_.dispose();
         }
         this.var_48 = null;
         this._localization.dispose();
         for each(_loc2_ in this._offers)
         {
            _loc2_.dispose();
         }
         this._offers = [];
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_478 != null)
         {
            this.var_478.dispose();
            this.var_478 = null;
         }
         this._viewer = null;
         this.var_2013 = null;
         this._pageId = 0;
         this.var_1120 = "";
      }
      
      public function init() : void
      {
         this.createWindow(this.layoutCode);
         this.createWidgets();
      }
      
      protected function createWindow(param1:String) : void
      {
         var _loc2_:String = const_1685 + param1;
         var _loc3_:XmlAsset = this.viewer.catalog.assets.getAssetByName(_loc2_) as XmlAsset;
         if(_loc3_ == null)
         {
            Logger.log("Could not find asset for layout " + _loc2_);
            return;
         }
         this.var_2013 = _loc3_.content as XML;
         this._window = this.viewer.catalog.windowManager.buildFromXML(this.var_2013) as IWindowContainer;
         if(this._window == null)
         {
            Logger.log("Could not create layout " + param1);
         }
      }
      
      private function localize() : void
      {
      }
      
      private function createWidgets() : void
      {
         this.createWidgetsRecursion(this._window);
         this.initializeWidgets();
      }
      
      private function createWidgetsRecursion(param1:IWindowContainer) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.numChildren)
            {
               _loc3_ = param1.getChildAt(_loc2_) as IWindowContainer;
               if(_loc3_ != null)
               {
                  this.createWidget(_loc3_);
                  this.createWidgetsRecursion(_loc3_);
               }
               _loc2_++;
            }
         }
      }
      
      private function createWidget(param1:IWindowContainer) : void
      {
         if(param1 == null)
         {
            return;
         }
         switch(param1.name)
         {
            case CatalogWidgetEnum.const_1677:
               if(this.var_1119 == null)
               {
                  this.var_1119 = new ItemGridCatalogWidget(param1);
                  this.var_48.push(this.var_1119);
               }
               break;
            case CatalogWidgetEnum.const_1565:
               this.var_48.push(new ItemGroupCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1627:
               this.var_48.push(new ProductViewCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1489:
               this.var_48.push(new SingleViewCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1513:
               this.var_48.push(new PurchaseCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1467:
               this.var_48.push(new PurseCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1409:
               this.var_48.push(new ColourGridCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1645:
               this.var_48.push(new TraxPreviewCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1434:
               this.var_48.push(new RedeemItemCodeCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1418:
               this.var_48.push(new SpacesCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1674:
               this.var_48.push(new TrophyCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1583:
               this.var_48.push(new PetsCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1629:
               this.var_48.push(new NewPetsCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1638:
               this.var_48.push(new TextInputCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1595:
               this.var_48.push(new SpecialInfoWidget(param1));
               break;
            case CatalogWidgetEnum.const_1622:
               this.var_48.push(new RecyclerCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1679:
               this.var_48.push(new RecyclerPrizesCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1602:
               this.var_48.push(new BotCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1475:
               this.var_48.push(new MarketPlaceCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1387:
               this.var_48.push(new MarketPlaceOwnItemsCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1412:
               this.var_48.push(new ClubGiftWidget(param1,this._catalog.getClubGiftController()));
               break;
            case CatalogWidgetEnum.const_1400:
               this.var_48.push(new ClubBuyCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1543:
               this.var_48.push(new ActivityPointDisplayCatalogWidget(param1));
         }
      }
      
      private function initializeWidgets() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = [];
         for each(_loc1_ in this.var_48)
         {
            _loc1_.page = this;
            _loc1_.events = this.var_478;
            if(!_loc1_.init())
            {
               _loc2_.push(_loc1_);
            }
         }
         this.removeWidgets(_loc2_);
         this.initializeLocalizations();
         this.var_478.dispatchEvent(new CatalogWidgetsInitializedEvent());
      }
      
      private function initializeLocalizations() : void
      {
         var _loc1_:ICatalogWidget = new LocalizationCatalogWidget(this._window);
         this.var_48.push(_loc1_);
         _loc1_.page = this;
         _loc1_.events = this.var_478;
         _loc1_.init();
      }
      
      private function removeWidgets(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         for each(_loc2_ in this.var_48)
         {
            if(_loc2_.window != null)
            {
               for each(_loc3_ in param1)
               {
                  if(_loc3_.window != null)
                  {
                     if(_loc3_.window.getChildIndex(_loc2_.window) >= 0)
                     {
                        if(param1.indexOf(_loc2_) < 0)
                        {
                           param1.push(_loc2_);
                        }
                        break;
                     }
                  }
               }
            }
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_.window != null)
            {
               this._window.removeChild(_loc3_.window);
               _loc3_.window.dispose();
            }
            _loc4_ = this.var_48.indexOf(_loc3_);
            if(_loc4_ >= 0)
            {
               this.var_48.splice(_loc4_,1);
            }
            _loc3_.dispose();
         }
      }
      
      public function dispatchWidgetEvent(param1:Event) : Boolean
      {
         if(this.var_478 != null)
         {
            return this.var_478.dispatchEvent(param1);
         }
         return false;
      }
   }
}
