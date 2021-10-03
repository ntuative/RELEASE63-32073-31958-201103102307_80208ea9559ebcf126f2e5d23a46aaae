package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.friendlist.IFriend;
   import flash.display.BitmapData;
   
   public class Friend implements IFriend, IDisposable
   {
      
      public static const const_1775:int = "F".charCodeAt(0);
      
      public static const const_1853:int = "M".charCodeAt(0);
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_990:int;
      
      private var var_721:Boolean;
      
      private var var_1846:Boolean;
      
      private var _figure:String;
      
      private var var_1845:String;
      
      private var var_1697:String;
      
      private var var_1416:int;
      
      private var var_191:Boolean;
      
      private var _disposed:Boolean;
      
      private var var_17:IWindowContainer;
      
      private var var_1189:BitmapData;
      
      private var var_1696:String;
      
      public function Friend(param1:FriendData)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this._id = param1.id;
         this._name = param1.name;
         this.var_990 = param1.gender;
         this.var_721 = param1.online;
         this.var_1846 = param1.followingAllowed && param1.online;
         this._figure = param1.figure;
         this.var_1845 = param1.motto;
         this.var_1697 = param1.lastAccess;
         this.var_1416 = param1.categoryId;
         this.var_1696 = param1.realName;
         Logger.log("Creating friend: " + this.id + ", " + this.name + ", " + this.gender + ", " + this.online + ", " + this.followingAllowed + ", " + this.figure + ", " + this.categoryId);
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         if(this.var_1189 != null)
         {
            this.var_1189.dispose();
            this.var_1189 = null;
         }
         this._disposed = true;
         this.var_17 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_990;
      }
      
      public function get online() : Boolean
      {
         return this.var_721;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1846;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get motto() : String
      {
         return this.var_1845;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1697;
      }
      
      public function get categoryId() : int
      {
         return this.var_1416;
      }
      
      public function get selected() : Boolean
      {
         return this.var_191;
      }
      
      public function get view() : IWindowContainer
      {
         return this.var_17;
      }
      
      public function get face() : BitmapData
      {
         return this.var_1189;
      }
      
      public function get realName() : String
      {
         return this.var_1696;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_990 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_721 = param1;
      }
      
      public function set followingAllowed(param1:Boolean) : void
      {
         this.var_1846 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1845 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1697 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1416 = param1;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.var_191 = param1;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this.var_17 = param1;
      }
      
      public function set face(param1:BitmapData) : void
      {
         this.var_1189 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1696 = param1;
      }
   }
}
