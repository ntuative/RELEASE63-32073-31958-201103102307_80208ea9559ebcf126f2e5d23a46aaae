package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_2795:int;
      
      private var var_330:RoomEventViewCtrl;
      
      private var var_234:Timer;
      
      private var var_171:RoomSettingsCtrl;
      
      private var var_235:RoomThumbnailCtrl;
      
      private var var_1029:TagRenderer;
      
      private var var_285:IWindowContainer;
      
      private var var_392:IWindowContainer;
      
      private var var_668:IWindowContainer;
      
      private var var_2065:IWindowContainer;
      
      private var var_2064:IWindowContainer;
      
      private var var_1276:IWindowContainer;
      
      private var var_904:ITextWindow;
      
      private var var_1023:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_824:ITextWindow;
      
      private var var_1278:ITextWindow;
      
      private var var_1025:ITextWindow;
      
      private var var_822:ITextWindow;
      
      private var var_1548:ITextWindow;
      
      private var var_233:IWindowContainer;
      
      private var var_826:IWindowContainer;
      
      private var var_1546:IWindowContainer;
      
      private var var_2068:ITextWindow;
      
      private var var_667:ITextWindow;
      
      private var var_2067:IWindow;
      
      private var var_1280:IContainerButtonWindow;
      
      private var var_1279:IContainerButtonWindow;
      
      private var var_1274:IContainerButtonWindow;
      
      private var var_1281:IContainerButtonWindow;
      
      private var var_1282:IContainerButtonWindow;
      
      private var var_1277:IContainerButtonWindow;
      
      private var var_1547:IButtonWindow;
      
      private var var_1545:IButtonWindow;
      
      private var var_1549:IButtonWindow;
      
      private var var_825:IWindowContainer;
      
      private var var_1275:ITextWindow;
      
      private var var_1022:ITextFieldWindow;
      
      private var var_67:IWindowContainer;
      
      private var var_1024:IButtonWindow;
      
      private var var_823:IButtonWindow;
      
      private var var_2066:String;
      
      private var var_2063:String;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_330 = new RoomEventViewCtrl(this._navigator);
         this.var_171 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_235 = new RoomThumbnailCtrl(this._navigator);
         this.var_1029 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_171);
         this.var_234 = new Timer(6000,1);
         this.var_234.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_94,this.onToolbarIconState);
         }
         if(this.var_234)
         {
            this.var_234.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_234.reset();
            this.var_234 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_234.reset();
         this.var_330.active = true;
         this.var_171.active = false;
         this.var_235.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_234.reset();
         this.var_171.load(param1);
         this.var_171.active = true;
         this.var_330.active = false;
         this.var_235.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_171.active = true;
         this.var_330.active = false;
         this.var_235.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_234.reset();
         this.var_171.active = false;
         this.var_330.active = false;
         this.var_235.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1036,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_234.reset();
         this.var_330.active = false;
         this.var_171.active = false;
         this.var_235.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_53,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_234.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_234.reset();
         this.var_330.active = false;
         this.var_171.active = false;
         this.var_235.active = false;
         this.refresh();
         if(!this._window.visible)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_53,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            this._window.parent.activate();
         }
         else
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_438,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
         this._window.height = Util.getLowestPoint(this._window);
         this._window.y = this._window.desktop.height - this._window.height - 5;
         Logger.log("MAIN: " + this.var_285.rectangle + ", " + this.var_233.rectangle + ", " + this._window.rectangle);
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_285);
         this.var_285.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_171.refresh(this.var_285);
         this.var_235.refresh(this.var_285);
         Util.moveChildrenToColumn(this.var_285,["room_details","room_buttons"],0,2);
         this.var_285.height = Util.getLowestPoint(this.var_285);
         this.var_285.visible = true;
         Logger.log("XORP: " + this.var_392.visible + ", " + this.var_1276.visible + ", " + this.var_668.visible + ", " + this.var_668.rectangle + ", " + this.var_285.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_233);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_330.refresh(this.var_233);
         if(Util.hasVisibleChildren(this.var_233) && !(this.var_171.active || this.var_235.active))
         {
            Util.moveChildrenToColumn(this.var_233,["event_details","event_buttons"],0,2);
            this.var_233.height = Util.getLowestPoint(this.var_233);
            this.var_233.visible = true;
         }
         else
         {
            this.var_233.visible = false;
         }
         Logger.log("EVENT: " + this.var_233.visible + ", " + this.var_233.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_171.active && !this.var_235.active && !this.var_330.active)
         {
            this.var_825.visible = true;
            this.var_1022.text = this.getEmbedData();
         }
         else
         {
            this.var_825.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this.var_67)
         {
            return;
         }
         if(this.var_171.active)
         {
            this.var_67.visible = false;
            return;
         }
         this.var_67.visible = true;
         if(this.var_1024)
         {
            if(this.var_2066 == "exit_homeroom")
            {
               this.var_1024.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1024.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_823)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_823.visible = _loc1_;
            if(this.var_2063 == "0")
            {
               this.var_823.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_823.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_171.active || this.var_235.active)
         {
            return;
         }
         this.var_904.text = param1.roomName;
         this.var_904.height = this.var_904.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_824.text = param1.description;
         this.var_1029.refreshTags(this.var_392,param1.tags);
         this.var_824.visible = false;
         if(param1.description != "")
         {
            this.var_824.height = this.var_824.textHeight + 5;
            this.var_824.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1279,"facebook_logo_small",_loc3_,null,0);
         this.var_1279.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1280,"thumb_up",_loc4_,null,0);
         this.var_1280.visible = _loc4_;
         this.var_822.visible = !_loc4_;
         this.var_1548.visible = !_loc4_;
         this.var_1548.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_392,"home",param2,null,0);
         this._navigator.refreshButton(this.var_392,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_392,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_904.y,0);
         this.var_392.visible = true;
         this.var_392.height = Util.getLowestPoint(this.var_392);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_392.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_171.active || this.var_235.active)
         {
            return;
         }
         this.var_1023.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1023.height = this.var_1023.textHeight + 5;
         this.var_1278.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1278.height = this.var_1278.textHeight + 5;
         Util.moveChildrenToColumn(this.var_668,["public_space_name","public_space_desc"],this.var_1023.y,0);
         this.var_668.visible = true;
         this.var_668.height = Math.max(86,Util.getLowestPoint(this.var_668));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_330.active)
         {
            return;
         }
         this.var_2068.text = param1.eventName;
         this.var_667.text = param1.eventDescription;
         this.var_1029.refreshTags(this.var_826,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_667.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_667.height = this.var_667.textHeight + 5;
            this.var_667.y = Util.getLowestPoint(this.var_826) + 2;
            this.var_667.visible = true;
         }
         this.var_826.visible = true;
         this.var_826.height = Util.getLowestPoint(this.var_826);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_171.active || this.var_235.active)
         {
            return;
         }
         this.var_1547.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1274.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1281.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1282.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1277.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1276.visible = Util.hasVisibleChildren(this.var_1276);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_330.active)
         {
            return;
         }
         this.var_1545.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1549.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1546.visible = Util.hasVisibleChildren(this.var_1546);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
         this._window.setParamFlag(HabboWindowParam.const_60,false);
         this._window.setParamFlag(HabboWindowParam.const_1391,true);
         this._window.visible = false;
         this.var_285 = IWindowContainer(this.find("room_info"));
         this.var_392 = IWindowContainer(this.find("room_details"));
         this.var_668 = IWindowContainer(this.find("public_space_details"));
         this.var_2065 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2064 = IWindowContainer(this.find("rating_cont"));
         this.var_1276 = IWindowContainer(this.find("room_buttons"));
         this.var_904 = ITextWindow(this.find("room_name"));
         this.var_1023 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_824 = ITextWindow(this.find("room_desc"));
         this.var_1278 = ITextWindow(this.find("public_space_desc"));
         this.var_1025 = ITextWindow(this.find("owner_caption"));
         this.var_822 = ITextWindow(this.find("rating_caption"));
         this.var_1548 = ITextWindow(this.find("rating_txt"));
         this.var_233 = IWindowContainer(this.find("event_info"));
         this.var_826 = IWindowContainer(this.find("event_details"));
         this.var_1546 = IWindowContainer(this.find("event_buttons"));
         this.var_2068 = ITextWindow(this.find("event_name"));
         this.var_667 = ITextWindow(this.find("event_desc"));
         this.var_1279 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1280 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2067 = this.find("staff_pick_button");
         this.var_1274 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1281 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1282 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1277 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_1547 = IButtonWindow(this.find("room_settings_button"));
         this.var_1545 = IButtonWindow(this.find("create_event_button"));
         this.var_1549 = IButtonWindow(this.find("edit_event_button"));
         this.var_825 = IWindowContainer(this.find("embed_info"));
         this.var_1275 = ITextWindow(this.find("embed_info_txt"));
         this.var_1022 = ITextFieldWindow(this.find("embed_src_txt"));
         this.var_67 = IWindowContainer(this.find("buttons_container"));
         this.var_1024 = IButtonWindow(this.find("exit_room_button"));
         this.var_823 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1274,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1281,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1547,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1282,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1277,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_1545,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1549,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1022,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1280,this.onThumbUp);
         Util.setProcDirectly(this.var_2067,this.onStaffPick);
         Util.setProcDirectly(this.var_1279,this.onFacebookLike);
         Util.setProcDirectly(this.var_823,this.onZoomClick);
         Util.setProcDirectly(this.var_1024,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1274,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1281,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1282,"home",true,null,0);
         this._navigator.refreshButton(this.var_1277,"home",true,null,0);
         this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         Util.setProcDirectly(this.var_285,this.onHover);
         Util.setProcDirectly(this.var_233,this.onHover);
         this.var_1025.width = this.var_1025.textWidth;
         Util.moveChildrenToRow(this.var_2065,["owner_caption","owner_name"],this.var_1025.x,this.var_1025.y,3);
         this.var_822.width = this.var_822.textWidth;
         Util.moveChildrenToRow(this.var_2064,["rating_caption","rating_txt"],this.var_822.x,this.var_822.y,3);
         this.var_1275.height = this.var_1275.textHeight + 5;
         Util.moveChildrenToColumn(this.var_825,["embed_info_txt","embed_src_txt"],this.var_1275.y,2);
         this.var_825.height = Util.getLowestPoint(this.var_825) + 5;
         this.var_2795 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1022.setSelection(0,this.var_1022.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_39);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_39);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_94)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2063 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2066 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_234.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_438,HabboToolbarIconEnum.ROOMINFO,this._window,false));
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_94,this.onToolbarIconState);
         }
      }
   }
}
