package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import flash.events.Event;
   import flash.net.URLRequest;
   
   public class AvatarAssetDownloadLibrary extends EventDispatcher
   {
      
      private static var name_2:int = 0;
      
      private static var var_1760:int = 1;
      
      private static var name_3:int = 2;
       
      
      private var _state:int;
      
      private var var_905:String;
      
      private var _revision:String;
      
      private var var_1394:String;
      
      private var _assets:IAssetLibrary;
      
      public function AvatarAssetDownloadLibrary(param1:String, param2:String, param3:String, param4:IAssetLibrary)
      {
         super();
         this._state = name_2;
         this._assets = param4;
         this.var_905 = String(param1);
         this._revision = String(param2);
         this.var_1394 = param3 + this.var_905 + ".swf";
         this.var_1394 = this.var_1394.replace("%revision%",this._revision);
         var _loc5_:AssetLibraryCollection = this._assets as AssetLibraryCollection;
         var _loc6_:IAssetLibrary = _loc5_.getAssetLibraryByUrl(this.var_905 + ".swf");
         if(_loc6_ != null)
         {
            Logger.log("[AvatarAssetDownloadLibrary] Already Downloaded by Core: " + this.var_905);
            this._state = name_3;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function startDownloading() : void
      {
         this._state = var_1760;
         var _loc1_:URLRequest = new URLRequest(this.var_1394);
         var _loc2_:LibraryLoader = new LibraryLoader();
         this._assets.loadFromFile(_loc2_,true);
         _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.onLoaderComplete);
         _loc2_.load(_loc1_);
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.onLoaderComplete);
         this._state = name_3;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function get libraryName() : String
      {
         return this.var_905;
      }
      
      public function get isReady() : Boolean
      {
         return this._state == name_3;
      }
      
      public function toString() : String
      {
         var _loc1_:String = this.var_905;
         return _loc1_ + (!!this.isReady ? "[x]" : "[ ]");
      }
   }
}
