package game.pdk
{
	import game.pdk.PokerType;
	import laya.utils.Dictionary;
	import common.GameConstants;
	import common.GameFunctions;

	/**
	 * ...
	 * @dengcs
	 */
	public class PokerType{

		public static function check_type(type:int, cards:Vector.<int>):int
		{
			switch(type)
			{
				case GameConstants.POKER_TYPE_ONE:
				{
					return PokerType.check_one(cards);
				}
				case GameConstants.POKER_TYPE_TWO:
				{
					return PokerType.check_two(cards);
				}
				case GameConstants.POKER_TYPE_THREE:
				{
					return PokerType.check_three(cards);
				}
				case GameConstants.POKER_TYPE_BOMB:
				{
					return PokerType.check_bomb(cards);
				}
				case GameConstants.POKER_TYPE_KING:
				{
					return PokerType.check_king(cards);
				}
				case GameConstants.POKER_TYPE_1STRAIGHT:
				{
					return PokerType.check_1straight(cards);
				}
				case GameConstants.POKER_TYPE_2STRAIGHT:
				{
					return PokerType.check_2straight(cards);
				}
				case GameConstants.POKER_TYPE_3STRAIGHT:
				{
					return PokerType.check_3straight(cards);
				}
				case GameConstants.POKER_TYPE_3WITH1:
				{
					return PokerType.check_3with1(cards);
				}
				case GameConstants.POKER_TYPE_3WITH2:
				{
					return PokerType.check_3with2(cards);
				}
				case GameConstants.POKER_TYPE_4WITH1:
				{
					return PokerType.check_4with1(cards);
				}
				case GameConstants.POKER_TYPE_4WITH21:
				{
					return PokerType.check_4with21(cards);
				}
				case GameConstants.POKER_TYPE_4WITH22:
				{
					return PokerType.check_4with22(cards);
				}
			}
			return 0;
		}

		public static function test_type(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len == 1)
			{
				if(PokerType.check_one(cards) > 0)
				{
					return GameConstants.POKER_TYPE_ONE;
				}
			}
			else if(len == 2)
			{
				if(PokerType.check_king(cards) > 0)
				{
					return GameConstants.POKER_TYPE_KING;
				}else if(PokerType.check_two(cards) > 0)
				{
					return GameConstants.POKER_TYPE_TWO;
				}
			}
			else if(len == 3)
			{
				if(PokerType.check_three(cards) > 0)
				{
					return GameConstants.POKER_TYPE_THREE;
				}
			}
			else if(len == 4)
			{
				if(PokerType.check_3with1(cards) > 0)
				{
					return GameConstants.POKER_TYPE_3WITH1;
				}else if(PokerType.check_bomb(cards) > 0)
				{
					return GameConstants.POKER_TYPE_BOMB;
				}
			}
			else if(len > 4)
			{
				if(PokerType.check_1straight(cards) > 0)
				{
					return GameConstants.POKER_TYPE_1STRAIGHT;
				}
				else if(PokerType.check_2straight(cards) > 0)
				{
					return GameConstants.POKER_TYPE_2STRAIGHT;
				}
				else if(PokerType.check_3straight(cards) > 0)
				{
					return GameConstants.POKER_TYPE_3STRAIGHT;
				}
				else if(PokerType.check_4with1(cards) > 0)
				{
					return GameConstants.POKER_TYPE_4WITH1;
				}
				else if(PokerType.check_4with21(cards) > 0)
				{
					return GameConstants.POKER_TYPE_4WITH21;
				}
				else if(PokerType.check_4with22(cards) > 0)
				{
					return GameConstants.POKER_TYPE_4WITH22;
				}
				else if(PokerType.check_3with1(cards) > 0)
				{
					return GameConstants.POKER_TYPE_3WITH1;
				}
				else if(PokerType.check_3with2(cards) > 0)
				{
					return GameConstants.POKER_TYPE_3WITH2;
				}
			}

			return 0;
		}

		public static function check_one(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len == 1)
			{
				return GameFunctions.getCardVal(cards[0]);
			}

			return 0;
		}

		public static function check_two(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len == 2)
			{
				var card1:int = GameFunctions.getCardVal(cards[0]);
				var card2:int = GameFunctions.getCardVal(cards[1]);

				if(card1 == card2)
				{
					return card1;
				}
			}

			return 0;
		}

		public static function check_three(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len == 3)
			{
				var card1:int = GameFunctions.getCardVal(cards[0]);
				var card2:int = GameFunctions.getCardVal(cards[1]);
				var card3:int = GameFunctions.getCardVal(cards[2]);

				if(card1==card2 && card2==card3)
				{
					return card1;
				}
			}

			return 0;
		}

		public static function check_bomb(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len == 4)
			{
				var card1:int = GameFunctions.getCardVal(cards[0]);
				var card2:int = GameFunctions.getCardVal(cards[1]);
				var card3:int = GameFunctions.getCardVal(cards[2]);
				var card4:int = GameFunctions.getCardVal(cards[3]);

				if(card1==card2 && card2==card3 && card3==card4)
				{
					return card1;
				}
			}

			return 0;
		}

		public static function check_king(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len == 2)
			{
				var card1:int = GameFunctions.getCardVal(cards[0]);
				var card2:int = GameFunctions.getCardVal(cards[1]);

				if(card1 > 13 && card2 > 13)
				{
					return card1;
				}
			}

			return 0;
		}

		public static function check_1straight(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len > 4)
			{
				cards.sort(GameFunctions.compareIntAsc);

				var firstcard:int = GameFunctions.getCardVal(cards[0]);
				var curcard:int = 0;
				
				for(var i:int = 0;i<len;i++)
				{
					curcard = GameFunctions.getCardVal(cards[i]);
					if(firstcard+i != curcard)
					{
						return 0;
					}
				}

				return curcard;
			}

			return 0;
		}

		public static function check_2straight(cards:Vector.<int>):int
		{
			var len:int = cards.length;
			if(len > 5)
			{
				cards.sort(GameFunctions.compareIntAsc);
				var child_len:int = Math.ceil(len/2);
				if(child_len*2 != len)
				{
					return 0;
				}

				var firstcard:int = GameFunctions.getCardVal(cards[0]);
				
				for(var i:int = 0;i<child_len;i++)
				{
					var card1:int = GameFunctions.getCardVal(cards[i*2]);
					var card2:int = GameFunctions.getCardVal(cards[i*2 + 1]);
					if(card1 != card2)
					{
						return 0;
					}

					if(firstcard+i != card1)
					{
						return 0;
					}
				}

				return firstcard + child_len - 1;
			}

			return 0;
		}

		public static function check_3straight(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len > 5)
			{
				cards.sort(GameFunctions.compareIntAsc);

				var child_len:int = Math.ceil(len/3);
				if(child_len*3 != len)
				{
					return 0;
				}

				var firstcard:int = GameFunctions.getCardVal(cards[0]);
				
				for(var i:int = 0;i<child_len;i++)
				{
					var card1:int = GameFunctions.getCardVal(cards[i*3]);
					var card2:int = GameFunctions.getCardVal(cards[i*3 + 1]);
					var card3:int = GameFunctions.getCardVal(cards[i*3 + 2]);
					if(card1 != card2 || card2 != card3)
					{
						return 0;
					}

					if(firstcard+i != card1)
					{
						return 0;
					}
				}

				return firstcard + child_len - 1;
			}

			return 0;
		}

		public static function check_3with1(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len > 3)
			{
				var target_count:int = 0;
				var temp_data:Dictionary = new Dictionary();
				var check_cards:Vector.<int> = new Vector.<int>();
				for each(var item:int in cards)
				{
					var card:int = GameFunctions.getCardVal(item);
					if(temp_data[card] == null)
					{
						temp_data[card] = 1;
					}else{
						temp_data[card]++;
						if(temp_data[card] == 3)
						{
							target_count++;
							check_cards.push(card);
						}
					}
				}

				// 判断牌数对不对
				if(target_count*4 != len)
				{
					return 0
				}

				// 判断连续
				check_cards.sort(GameFunctions.compareIntAsc);
				var first_card:int = check_cards[0]
				for(var i:int=0;i<target_count;i++)
				{
					if(first_card + i != check_cards[i])
					{
						return 0
					}
				}
				return first_card + target_count - 1
			}

			return 0;
		}

		public static function check_3with2(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len > 4)
			{
				var target_count:int = 0;
				var type_count:int = 0;
				var temp_data:Dictionary = new Dictionary();
				var check_cards:Vector.<int> = new Vector.<int>();
				for each(var item:int in cards)
				{
					var card:int = GameFunctions.getCardVal(item);
					if(temp_data[card] == null)
					{
						temp_data[card] = 1;
					}else{
						temp_data[card]++;
						if(temp_data[card] == 3)
						{
							target_count++;
							check_cards.push(card);
						}else if(temp_data[card] == 2)
						{
							type_count++;
						}
					}
				}

				// 判断牌数对不对
				if(target_count*5 != len)
				{
					return 0
				}

				// 判断带的数量对不对
				if(target_count*2 != type_count)
				{
					return 0
				}

				// 判断连续
				check_cards.sort(GameFunctions.compareIntAsc);
				var first_card:int = check_cards[0]
				for(var i:int=0;i<target_count;i++)
				{
					if(first_card + i != check_cards[i])
					{
						return 0
					}
				}
				return first_card + target_count - 1
			}

			return 0;
		}

		public static function check_4with1(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len == 5)
			{
				var temp_data:Dictionary = new Dictionary();
				for each(var item:int in cards)
				{
					var card:int = GameFunctions.getCardVal(item);
					if(temp_data[card] == null)
					{
						temp_data[card] = 1;
					}else{
						temp_data[card]++;
						if(temp_data[card] == 4)
						{
							return card
						}
					}
				}
			}

			return 0;
		}

		public static function check_4with21(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len == 6)
			{
				var temp_data:Dictionary = new Dictionary();
				for each(var item:int in cards)
				{
					var card:int = GameFunctions.getCardVal(item);
					if(temp_data[card] == null)
					{
						temp_data[card] = 1;
					}else{
						temp_data[card]++;
						if(temp_data[card] == 4)
						{
							return card;
						}
					}
				}
			}

			return 0;
		}

		public static function check_4with22(cards:Vector.<int>):int
		{
			var len:int = cards.length;

			if(len == 6)
			{
				var target_card:int = 0;
				var type_count:int = 0;
				var temp_data:Dictionary = new Dictionary();
				for each(var item:int in cards)
				{
					var card:int = GameFunctions.getCardVal(item);
					if(temp_data[card] == null)
					{
						temp_data[card] = 1;
					}else{
						temp_data[card]++;
						if(temp_data[card] == 4)
						{
							target_card = card;
						}else if(temp_data[card] == 2)
						{
							type_count++;
						}
					}
				}

				if(target_card < 1)
				{
					return 0;
				}

				if(type_count != 3)
				{
					return 0
				}

				return target_card;
			}

			return 0;
		}		
	}

}