package game.net
{
	import com.google.protobuf.ByteArray;
	import game.NetMessage;
	import com.google.protobuf.CodedInputStream;
	import game.query_players_resp;

	/**
	 * ...
	 * @author
	 */
	public class NetHandler{
		private static  var _instance:NetHandler = null;

		public function NetHandler(){
			if (_instance != null) {
                 throw new Error("只能用getInstance()来获取实例!");
             }
		}

		public static function getInstance():NetHandler {
            if (_instance == null) {
                _instance = new NetHandler();
            }
            return _instance;
        }

		public function handlerMsg(message:*=null):void
		{
			if(message != null)
			{
				var bytes:ByteArray = new ByteArray(message);
				var ntMessage:NetMessage = new NetMessage();
				ntMessage.readFrom(new CodedInputStream(bytes));
				var resp_q:query_players_resp = new query_players_resp();
				resp_q.readFrom(new CodedInputStream(ntMessage.payload));
				trace(resp_q)
			}
		}
	}

}