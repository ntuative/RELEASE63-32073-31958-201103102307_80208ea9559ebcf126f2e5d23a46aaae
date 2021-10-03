package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_356:int = 1;
      
      public static const const_270:int = 2;
      
      public static const const_293:int = 3;
      
      public static const const_385:int = 4;
      
      public static const const_223:int = 5;
      
      public static const const_334:int = 1;
      
      public static const const_696:int = 2;
      
      public static const const_629:int = 3;
      
      public static const const_618:int = 4;
      
      public static const const_264:int = 5;
      
      public static const const_791:int = 6;
      
      public static const const_870:int = 7;
      
      public static const const_218:int = 8;
      
      public static const const_379:int = 9;
      
      public static const const_1919:int = 10;
      
      public static const const_771:int = 11;
      
      public static const const_431:int = 12;
       
      
      private var var_398:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_398 = new Array();
         this.var_398.push(new Tab(this._navigator,const_356,const_431,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_467));
         this.var_398.push(new Tab(this._navigator,const_270,const_334,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_467));
         this.var_398.push(new Tab(this._navigator,const_385,const_771,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1023));
         this.var_398.push(new Tab(this._navigator,const_293,const_264,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_467));
         this.var_398.push(new Tab(this._navigator,const_223,const_218,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_739));
         this.setSelectedTab(const_356);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_385;
      }
      
      public function get tabs() : Array
      {
         return this.var_398;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_398)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_398)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_398)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
