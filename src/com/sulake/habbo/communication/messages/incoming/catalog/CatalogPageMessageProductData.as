package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_85:String = "i";
      
      public static const const_92:String = "s";
      
      public static const const_271:String = "e";
       
      
      private var var_1585:String;
      
      private var var_2264:int;
      
      private var var_1297:String;
      
      private var var_1296:int;
      
      private var var_1583:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1585 = param1.readString();
         this.var_2264 = param1.readInteger();
         this.var_1297 = param1.readString();
         this.var_1296 = param1.readInteger();
         this.var_1583 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1585;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2264;
      }
      
      public function get extraParam() : String
      {
         return this.var_1297;
      }
      
      public function get productCount() : int
      {
         return this.var_1296;
      }
      
      public function get expiration() : int
      {
         return this.var_1583;
      }
   }
}
