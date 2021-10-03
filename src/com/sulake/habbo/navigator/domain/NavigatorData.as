package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1725:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_199:MsgWithRequestId;
      
      private var var_630:RoomEventData;
      
      private var var_2610:Boolean;
      
      private var var_2614:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2145:int;
      
      private var var_263:GuestRoomData;
      
      private var var_955:PublicRoomShortData;
      
      private var var_2611:int;
      
      private var var_2613:Boolean;
      
      private var var_2618:int;
      
      private var var_2615:Boolean;
      
      private var var_1857:int;
      
      private var var_2616:Boolean;
      
      private var var_1396:Array;
      
      private var var_1449:Array;
      
      private var var_2609:int;
      
      private var var_1450:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1196:Boolean;
      
      private var var_2612:int;
      
      private var var_2617:Boolean;
      
      private var var_2619:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1396 = new Array();
         this.var_1449 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_263 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_263 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_955 = null;
         this.var_263 = null;
         this._currentRoomOwner = false;
         if(param1.guestRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_955 = param1.publicSpace;
            this.var_630 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_630 != null)
         {
            this.var_630.dispose();
            this.var_630 = null;
         }
         if(this.var_955 != null)
         {
            this.var_955.dispose();
            this.var_955 = null;
         }
         if(this.var_263 != null)
         {
            this.var_263.dispose();
            this.var_263 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_263 != null)
         {
            this.var_263.dispose();
         }
         this.var_263 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_630 != null)
         {
            this.var_630.dispose();
         }
         this.var_630 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_199 != null && this.var_199 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_199 != null && this.var_199 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_199 != null && this.var_199 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_199 = param1;
         this.var_1196 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_199 = param1;
         this.var_1196 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_199 = param1;
         this.var_1196 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_199 == null)
         {
            return;
         }
         this.var_199.dispose();
         this.var_199 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_199 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_199 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_199 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_630;
      }
      
      public function get avatarId() : int
      {
         return this.var_2145;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2610;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2614;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_263;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_955;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2613;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2618;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1857;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2615;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2612;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2611;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2616;
      }
      
      public function get adIndex() : int
      {
         return this.var_2619;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2617;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2145 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2618 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2613 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2610 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2614 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2615 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1857 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2612 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2611 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2616 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2619 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2617 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1396 = param1;
         this.var_1449 = new Array();
         for each(_loc2_ in this.var_1396)
         {
            if(_loc2_.visible)
            {
               this.var_1449.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1396;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1449;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2609 = param1.limit;
         this.var_1450 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1450 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_263.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_263 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_263.flatId;
         return this.var_1857 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1450 >= this.var_2609;
      }
      
      public function startLoading() : void
      {
         this.var_1196 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1196;
      }
   }
}
