package game.manager
{
	import laya.utils.Dictionary;
	import laya.utils.Handler;
	import game.proto.NetMessage;

	/**
	 * ...
	 * @dengcs
	 */
	public final class MessageManager{
		private static  var _instance:MessageManager = null;

		private var messageDic:Dictionary = new Dictionary();

		public function MessageManager(){
			if (_instance != null) {
                 throw new Error("只能用getInstance()来获取实例!");
             }
		}

		public static function getInstance():MessageManager
		{
			if (_instance == null) {
                _instance = new MessageManager();
            }
            return _instance;
		}

		public function registerMessage(protoName:String, hander:Handler):void
		{
			messageDic.set(protoName, hander);
		}

		public function processMessage(message:NetMessage):void
		{
			if(message != null && message.header != null)
			{
				var protoName:String = message.header.proto;
				if(protoName != null && protoName.length>0)
				{
					var hander:Handler = messageDic.get(protoName);
					if(hander != null)
					{
						hander.runWith(message);
					}
				}
			}
		}

	}

}