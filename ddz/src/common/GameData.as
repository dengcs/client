package common
{
	import game.pdk.PokerType;

	/**
	 * ...
	 * @dengcs
	 */
	public class GameData{
		public static var roundState:Object = null;
		public static var roundData:Object = null;

		public static function init():void
		{
			roundState = {curIdx:2, preIdx:0};
			roundData = {type:0,value:0,count:0};
		}

		public static function isMain():Boolean
		{
			var tmp:int = (roundState.preIdx + 2) % 3
			return roundState.curIdx == tmp;
		}

		public static function testType(values:Vector.<int>):void
		{
			var retData:Object = PokerType.test_type(values);
			if(retData != null)
			{
				roundData.type = retData.type;
				roundData.value = retData.value;
				roundData.count = retData.count;
			}
		}
	}

}