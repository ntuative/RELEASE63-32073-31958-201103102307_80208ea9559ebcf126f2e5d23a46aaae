package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1663:String = "pricing_model_unknown";
      
      public static const const_539:String = "pricing_model_single";
      
      public static const const_455:String = "pricing_model_multi";
      
      public static const const_425:String = "pricing_model_bundle";
      
      public static const const_1660:String = "price_type_none";
      
      public static const const_619:String = "price_type_credits";
      
      public static const const_1045:String = "price_type_activitypoints";
      
      public static const const_1052:String = "price_type_credits_and_activitypoints";
       
      
      private var var_796:String;
      
      private var var_1233:String;
      
      private var _offerId:int;
      
      private var var_1932:String;
      
      private var var_1231:int;
      
      private var var_1232:int;
      
      private var var_1647:int;
      
      private var var_439:ICatalogPage;
      
      private var var_797:IProductContainer;
      
      private var var_2723:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1932 = param1.localizationId;
         this.var_1231 = param1.priceInCredits;
         this.var_1232 = param1.priceInActivityPoints;
         this.var_1647 = param1.activityPointType;
         this.var_439 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_439;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1932;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1231;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1232;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1647;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_797;
      }
      
      public function get pricingModel() : String
      {
         return this.var_796;
      }
      
      public function get priceType() : String
      {
         return this.var_1233;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2723;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2723 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1932 = "";
         this.var_1231 = 0;
         this.var_1232 = 0;
         this.var_1647 = 0;
         this.var_439 = null;
         if(this.var_797 != null)
         {
            this.var_797.dispose();
            this.var_797 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_796)
         {
            case const_539:
               this.var_797 = new SingleProductContainer(this,param1);
               break;
            case const_455:
               this.var_797 = new MultiProductContainer(this,param1);
               break;
            case const_425:
               this.var_797 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_796);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_796 = const_539;
            }
            else
            {
               this.var_796 = const_455;
            }
         }
         else if(param1.length > 1)
         {
            this.var_796 = const_425;
         }
         else
         {
            this.var_796 = const_1663;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1231 > 0 && this.var_1232 > 0)
         {
            this.var_1233 = const_1052;
         }
         else if(this.var_1231 > 0)
         {
            this.var_1233 = const_619;
         }
         else if(this.var_1232 > 0)
         {
            this.var_1233 = const_1045;
         }
         else
         {
            this.var_1233 = const_1660;
         }
      }
   }
}
