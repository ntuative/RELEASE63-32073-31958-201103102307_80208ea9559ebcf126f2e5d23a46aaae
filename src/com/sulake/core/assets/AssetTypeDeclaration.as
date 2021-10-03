package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2712:String;
      
      private var var_2711:Class;
      
      private var var_2710:Class;
      
      private var var_1909:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2712 = param1;
         this.var_2711 = param2;
         this.var_2710 = param3;
         if(rest == null)
         {
            this.var_1909 = new Array();
         }
         else
         {
            this.var_1909 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2712;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2711;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2710;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1909;
      }
   }
}
