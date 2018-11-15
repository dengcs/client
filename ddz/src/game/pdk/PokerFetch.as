package game.pdk
{

	import laya.utils.Dictionary;
	import game.pdk.PokerType;

	/**
	 * ...
	 * @dengcs
	 */
	public class PokerFetch{

		public static function get_mode(cards:Vector.<int>):Dictionary
		{
			var mode:Dictionary = new Dictionary();
			for(var i:int in cards)
			{
				var card:int = PokerType.get_card(cards[i]);
				var data:Array = mode[card];
				if(data == null)
				{
					data = new Array();
					mode[card] = data
				}
				data.push(i);
			}
			return mode;
		}

		public static function fetch_one(mode:Dictionary, value:int):Object
		{
			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;

			var firstVal:int = 0;
			var secondVal:int = 0;
			var thirdVal:int = 0;

			for each(var card:int in mode.keys)
			{
				var modeVals:Array = mode[card];
				if(card > value)
				{
					if(modeVals.length == 1)
					{
						if(card < firstVal || firstVal == 0)
						{
							firstVal = card;
						}
					}else if(modeVals.length == 2)
					{
						if(card < secondVal || secondVal == 0)
						{
							secondVal = card;
						}
					}else if(modeVals.length == 3)
					{
						if(card < thirdVal || thirdVal == 0)
						{
							thirdVal = card;
						}
					}
				}
			}

			if(firstVal > 0)
			{
				max_value = firstVal;
			}else if(secondVal > 0)
			{
				max_value = secondVal;
			}else if(thirdVal > 0)
			{
				max_value = thirdVal;
			}

			if(max_value > 0)
			{
				indexes.push(mode[max_value][0])

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_two(mode:Dictionary, value:int):Object
		{
			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;

			var firstVal:int = 0;
			var secondVal:int = 0;

			for each(var card:int in mode.keys)
			{
				var modeVals:Array = mode[card];
				if(card > value)
				{
					if(modeVals.length == 2)
					{
						if(card < firstVal || firstVal == 0)
						{
							firstVal = card;
						}
					}else if(modeVals.length == 3)
					{
						if(card < secondVal || secondVal == 0)
						{
							secondVal = card;
						}
					}
				}
			}

			if(firstVal > 0)
			{
				max_value = firstVal;
			}else if(secondVal > 0)
			{
				max_value = secondVal;
			}

			if(max_value > 0)
			{
				indexes.push(mode[max_value][0]);
				indexes.push(mode[max_value][1]);

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_three(mode:Dictionary, value:int):Object
		{
			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;

			for each(var card:int in mode.keys)
			{
				var modeVals:Array = mode[card];
				if(card > value)
				{
					if(modeVals.length == 3)
					{
						if(card < max_value || max_value == 0)
						{
							max_value = card;
						}
					}
				}
			}

			if(max_value > 0)
			{
				indexes.push(mode[max_value][0]);
				indexes.push(mode[max_value][1]);
				indexes.push(mode[max_value][2]);

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_bomb(mode:Dictionary, value:int):Object
		{
			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;

			for each(var card:int in mode.keys)
			{
				var modeVals:Array = mode[card];
				if(card > value)
				{
					if(modeVals.length == 4)
					{
						if(card < max_value || max_value == 0)
						{
							max_value = card;
						}
					}
				}
			}

			if(max_value > 0)
			{
				indexes.push(mode[max_value][0]);
				indexes.push(mode[max_value][1]);
				indexes.push(mode[max_value][2]);
				indexes.push(mode[max_value][3]);

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_king(mode:Dictionary):Object
		{
			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;

			for each(var card:int in mode.keys)
			{
				var modeVals:Array = mode[card];
				if(card > 13)
				{
					if(modeVals.length == 2)
					{						
						max_value = card;
						break;
					}
				}
			}

			if(max_value > 0)
			{
				indexes.push(mode[max_value][0]);
				indexes.push(mode[max_value][1]);

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_1straight(mode:Dictionary, value:int, count:int):Object
		{
			if(count < 5)
			{
				return null;
			}

			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;			

			mode.keys.sort(PokerType.compare)
			var straightCount:int = 0;
			var first_card:int = mode.keys[0];
			for(var i:int in mode.keys)
			{
				var card:int = mode.keys[i];
				if(first_card + i == card)
				{
					straightCount++;
				}else{
					straightCount = 1;
					first_card = card - i;
				}

				if(straightCount >= count)
				{
					if(card > value)
					{						
						max_value = card;
						break;
					}
				}
			}

			if(max_value > 0)
			{
				for(var k:int = count; k>0; k--)
				{
					indexes.push(mode[max_value - k + 1][0])
				}

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_2straight(mode:Dictionary, value:int, count:int):Object
		{
			if(count < 3)
			{
				return null;
			}

			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;			

			mode.keys.sort(PokerType.compare)
			var straightCount:int = 0;
			var first_card:int = mode.keys[0];
			for(var i:int in mode.keys)
			{
				var card:int = mode.keys[i];
				if(first_card + i == card)
				{
					straightCount++;
				}else{
					straightCount = 1;
					first_card = card - i;
				}

				if(straightCount >= count)
				{
					if(card > value)
					{						
						max_value = card;
						break;
					}
				}
			}

			if(max_value > 0)
			{
				var cardVal:int = 0;
				for(var k:int = count; k>0; k--)
				{
					cardVal = max_value - k + 1;
					indexes.push(mode[cardVal][0]);
					indexes.push(mode[cardVal][1]);
				}

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_3straight(mode:Dictionary, value:int, count:int):Object
		{
			if(count < 2)
			{
				return null;
			}

			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;			

			mode.keys.sort(PokerType.compare)
			var straightCount:int = 0;
			var first_card:int = mode.keys[0];
			for(var i:int in mode.keys)
			{
				var card:int = mode.keys[i];
				if(first_card + i == card)
				{
					straightCount++;
				}else{
					straightCount = 1;
					first_card = card - i;
				}

				if(straightCount >= count)
				{
					if(card > value)
					{						
						max_value = card;
						break;
					}
				}
			}

			if(max_value > 0)
			{
				var cardVal:int = 0;
				for(var k:int = count; k>0; k--)
				{
					cardVal = max_value - k + 1;
					indexes.push(mode[cardVal][0]);
					indexes.push(mode[cardVal][1]);
					indexes.push(mode[cardVal][2]);
				}

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_3with1(mode:Dictionary, value:int, count:int):Object
		{
			if(count < 1)
			{
				return null;
			}

			var attachMap:Dictionary = new Dictionary();
			var attachNum:int = 0;
			var targetNum:int = 0;
			for(var m:int in mode)
			{
				var len:int = mode[m].length;

				if(len == 3)
				{
					targetNum++;
				}

				if(len < 3)
				{
					attachMap.set(m, mode[m]);
					attachNum += len
				}
			}

			if(targetNum < count)
			{
				return null;
			}
			if(attachNum < count)
			{
				return null;
			}

			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;			

			mode.keys.sort(PokerType.compare)
			var straightCount:int = 0;
			var first_card:int = mode.keys[0];
			for(var i:int in mode.keys)
			{
				var card:int = mode.keys[i];
				if(first_card + i == card)
				{
					straightCount++;
				}else{
					straightCount = 1;
					first_card = card - i;
				}

				if(straightCount >= count)
				{
					if(card > value)
					{						
						max_value = card;
						break;
					}
				}
			}

			if(max_value > 0)
			{
				var cardVal:int = 0;
				for(var k:int = count; k>0; k--)
				{
					cardVal = max_value - k + 1;
					indexes.push(mode[cardVal][0]);
					indexes.push(mode[cardVal][1]);
					indexes.push(mode[cardVal][2]);
				}

				var attachCount:int = 0;
				attachMap.keys.sort(PokerType.compare)

				for(var n:int = 1; n < 3; n++)
				{
					for each(var a:int in attachMap.keys)
					{
						if(attachCount >= count)
						{
							break;
						}

						if(attachMap[a].length == n)
						{
							for each(var b:int in attachMap[a])
							{
								indexes.push(b);
								attachCount++;

								if(attachCount >= count)
								{
									break;
								}
							}
						}
					}
				}

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_3with2(mode:Dictionary, value:int, count:int):Object
		{
			if(count < 1)
			{
				return null;
			}

			var attachMap:Dictionary = new Dictionary();
			var attachNum:int = 0;
			var targetNum:int = 0;
			for(var m:int in mode)
			{
				var len:int = mode[m].length;

				if(len == 3)
				{
					targetNum++;
				}

				if(len < 4)
				{
					attachMap.set(m, mode[m]);
					attachNum++;
				}
			}

			if(targetNum < count)
			{
				return null;
			}

			if(attachNum < count*2)
			{
				return null;
			}

			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;			

			mode.keys.sort(PokerType.compare)
			var straightCount:int = 0;
			var first_card:int = mode.keys[0];
			for(var i:int in mode.keys)
			{
				var card:int = mode.keys[i];
				if(first_card + i == card)
				{
					straightCount++;
				}else{
					straightCount = 1;
					first_card = card - i;
				}

				if(straightCount >= count)
				{
					if(card > value)
					{						
						max_value = card;
						break;
					}
				}
			}

			if(max_value > 0)
			{
				var cardVal:int = 0;
				for(var k:int = count; k>0; k--)
				{
					cardVal = max_value - k + 1;
					indexes.push(mode[cardVal][0]);
					indexes.push(mode[cardVal][1]);
					indexes.push(mode[cardVal][2]);

					attachMap.remove(cardVal);
				}

				var attachCount:int = 0;
				attachMap.keys.sort(PokerType.compare)

				for(var n:int = 2; n < 4; n++)
				{
					for each(var a:int in attachMap.keys)
					{
						if(attachCount >= count)
						{
							break;
						}

						if(attachMap[a].length == n)
						{
							indexes.push(attachMap[a][0]);
							indexes.push(attachMap[a][1]);
							attachCount++;
						}
					}
				}

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_4with1(mode:Dictionary, value:int):Object
		{
			var attachMap:Dictionary = new Dictionary();
			var targetMap:Dictionary = new Dictionary();
			var attachNum:int = 0;
			var targetNum:int = 0;
			for(var m:int in mode)
			{
				var len:int = mode[m].length;

				if(len == 4)
				{
					targetMap.set(m, mode[m]);
					targetNum++;
				}else
				{
					attachMap.set(m, mode[m]);
					attachNum += len;
				}
			}

			if(targetNum < 1)
			{
				return null;
			}
			if(attachNum < 1)
			{
				return null;
			}

			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;			

			for(var card:int in targetMap)
			{				
				if(card > value)
				{
					if(max_value == 0 || card < max_value)
					{
						max_value = card;
					}
				}
			}

			if(max_value > 0)
			{
				indexes.push(targetMap[max_value][0]);
				indexes.push(targetMap[max_value][1]);
				indexes.push(targetMap[max_value][2]);
				indexes.push(targetMap[max_value][3]);

				var attachCount:int = 0;
				attachMap.keys.sort(PokerType.compare)

				for(var n:int = 1; n < 4; n++)
				{
					for each(var a:int in attachMap.keys)
					{
						if(attachCount > 0)
						{
							break;
						}

						if(attachMap[a].length == n)
						{
							for each(var b:int in attachMap[a])
							{
								indexes.push(b);
								attachCount++;

								if(attachCount > 0)
								{
									break;
								}
							}
						}
					}
				}

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_4with21(mode:Dictionary, value:int):Object
		{
			var attachMap:Dictionary = new Dictionary();
			var targetMap:Dictionary = new Dictionary();
			var attachNum:int = 0;
			var targetNum:int = 0;
			for(var m:int in mode)
			{
				var len:int = mode[m].length;

				if(len == 4)
				{
					targetMap.set(m, mode[m]);
					targetNum++;
				}else
				{
					attachMap.set(m, mode[m]);
					attachNum += len;
				}
			}

			if(targetNum < 1)
			{
				return null;
			}
			if(attachNum < 2)
			{
				return null;
			}

			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;			

			for(var card:int in targetMap)
			{				
				if(card > value)
				{
					if(max_value == 0 || card < max_value)
					{
						max_value = card;
					}
				}
			}

			if(max_value > 0)
			{
				indexes.push(targetMap[max_value][0]);
				indexes.push(targetMap[max_value][1]);
				indexes.push(targetMap[max_value][2]);
				indexes.push(targetMap[max_value][3]);

				var attachCount:int = 0;
				attachMap.keys.sort(PokerType.compare)

				for(var n:int = 1; n < 4; n++)
				{
					for each(var a:int in attachMap.keys)
					{
						if(attachCount > 1)
						{
							break;
						}

						if(attachMap[a].length == n)
						{
							for each(var b:int in attachMap[a])
							{
								indexes.push(b);
								attachCount++;

								if(attachCount > 1)
								{
									break;
								}
							}
						}
					}
				}

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}

		public static function fetch_4with22(mode:Dictionary, value:int):Object
		{
			var attachMap:Dictionary = new Dictionary();
			var targetMap:Dictionary = new Dictionary();
			var attachNum:int = 0;
			var targetNum:int = 0;
			for(var m:int in mode)
			{
				var len:int = mode[m].length;

				if(len == 4)
				{
					targetMap.set(m, mode[m]);
					targetNum++;
				}else if(len > 1)
				{
					attachMap.set(m, mode[m]);
					attachNum++;
				}
			}

			if(targetNum < 1)
			{
				return null;
			}
			if(attachNum < 2)
			{
				return null;
			}

			var retData:Object = null;
			var indexes:Array = new Array();
			var max_value:int = 0;			

			for(var card:int in targetMap)
			{				
				if(card > value)
				{
					if(max_value == 0 || card < max_value)
					{
						max_value = card;
					}
				}
			}

			if(max_value > 0)
			{
				indexes.push(targetMap[max_value][0]);
				indexes.push(targetMap[max_value][1]);
				indexes.push(targetMap[max_value][2]);
				indexes.push(targetMap[max_value][3]);

				var attachCount:int = 0;
				attachMap.keys.sort(PokerType.compare)

				for(var n:int = 2; n < 4; n++)
				{
					for each(var a:int in attachMap.keys)
					{
						if(attachCount > 1)
						{
							break;
						}

						if(attachMap[a].length == n)
						{							
							indexes.push(attachMap[a][0]);
							indexes.push(attachMap[a][1]);
							attachCount++;

							if(attachCount > 1)
							{
								break;
							}
						}
					}
				}

				retData = new Object();
				retData.indexes = indexes;
				retData.max_value = max_value;
			}

			return retData;
		}
	}

}