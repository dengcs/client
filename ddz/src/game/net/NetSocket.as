package game.net
{
	import laya.net.Socket;
	import laya.events.Event;

	/**
	 * ...
	 * @dengcs
	 */
	public final class NetSocket{

		private static  var _instance:NetSocket = null;

		private var socket:Socket = null;

		public function NetSocket(){
			if (_instance != null) {
                 throw new Error("只能用getInstance()来获取实例!");
             }else{
				 socket = new Socket();
			 }
		}

		public static function getInstance():NetSocket {
            if (_instance == null) {
                _instance = new NetSocket();
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
			
			Laya.timer.frameOnce(100, null, NetClient.handshake)
		}
		
		private function onSocketClose(e:*=null):void
		{
			trace("closed");
		}
		
		private function onMessageReveived(message:*=null):void
		{
			trace("reveived");

			NetHandler.getInstance().handlerMsg(message);
		}

		private function onConnectError(e:*=null):void
		{
			trace("error");
		}
	}

}