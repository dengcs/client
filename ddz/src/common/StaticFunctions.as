package common
{
	/**
	 * ...
	 * @dengcs
	 */
	public class StaticFunctions{
		public static function compareObjDes(a:Object, b:Object):Number
		{
			if(a.value < b.value)
			{
				return 1;
			}
			return -1;
		}

		public static function compareIntAsc(x:int, y:int):Number
		{
			if(x > y)
			{
				return 1;
			}
			return -1;
		}
	}

}