package game.net
{
	import laya.net.Socket;
	import com.google.protobuf.Message;
	import com.google.protobuf.ByteArray;
	import game.net.NetSocket;
	import game.proto.NetHeader;
	import game.proto.NetMessage;
	import game.proto.query_players;
	import game.net.NetClient;
	/**
	 * ...
	 * @dengcs
	 */
	public final class NetClient{
		
		public static function send(protoName:String, msg:Message):void
		{
			var ntHeader:NetHeader = new NetHeader();
			var ntMessage:NetMessage = new NetMessage();

			ntHeader.proto = protoName;
			ntMessage.header = ntHeader;
			
			var payload:ByteArray = Message.toByteArray(msg);
			ntMessage.payload = payload;

			var sendMsg:ByteArray = Message.toByteArray(ntMessage);			

			NetSocket.getInstance().sendAndFlush(sendMsg.buffer);
		}

		private static function login():void
		{
			var q_player:query_players = new query_players();
				
			q_player.account = "dcs1001";
			
			send("query_players", q_player);
		}

		public static function handshake():void
		{			
			if(NetSocket.getInstance().isOpened() == false)
			{
				Laya.timer.once(100, null, NetClient.handshake);
			}else{
				login();
			}
		} 
	}

}