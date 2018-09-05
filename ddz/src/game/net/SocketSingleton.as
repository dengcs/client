package game.net
{
	import laya.net.Socket;
	import laya.webgl.shapes.Ellipse;
	import laya.events.Event;
	import game.query_players;
	import com.google.protobuf.ByteArray;
	import game.NetMessage;
	import com.google.protobuf.CodedInputStream;
	import game.query_players_resp;

	/**
	 * ...
	 * @dengcs
	 */
	public class SocketSingleton{

		private static  var _instance:SocketSingleton = null;

		private var socket:Socket = null;

		public function SocketSingleton(){
			if (_instance != null) {
                 throw new Error("只能用getInstance()来获取实例!");
             }else{
				 socket = new Socket();
			 }
		}

		public static function getInstance():SocketSingleton {
            if (_instance == null) {
                _instance = new SocketSingleton();
            }
            return _instance;
        }

		public function connectToServer(url:String):void
		{
			if(socket == null)
			{
				socket = new Socket();
			}

			if(socket.connected)
			{
				socket.cleanSocket();
			}

			socket.connectByUrl(url);

			socket.on(Event.OPEN, this, onSocketOpen);
			socket.on(Event.CLOSE, this, onSocketClose);
			socket.on(Event.MESSAGE, this, onMessageReveived);
			socket.on(Event.ERROR, this, onConnectError);
		}

		public function sendAndFlush(data:*):void
		{
			if(socket.connected == false)
			{
				throw new Error("请调用connectToServer建立到服务器的连接!");
			}else{
				socket.send(data);
				socket.flush();
			}
		}

		private function onSocketOpen(e:*=null):void
		{
			trace("Connected");

			var q_player:query_players = new query_players();

			q_player.account = "dcs1004";
			
			NetClient.send("query_players", q_player);
		}
		
		private function onSocketClose(e:*=null):void
		{
			trace("closed");
		}
		
		private function onMessageReveived(message:*=null):void
		{
			trace("reveived");

			var bytes:ByteArray = new ByteArray(message);
			var ntMessage:NetMessage = new NetMessage();
			ntMessage.readFrom(new CodedInputStream(bytes));
			var resp_q:query_players_resp = new query_players_resp();
			resp_q.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_q)
		}

		private function onConnectError(e:*=null):void
		{
			trace("error");
		}
	}

}