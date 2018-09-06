package game.net
{
	import laya.net.Socket;
	import game.NetError;
	import game.NetHeader;
	import game.NetMessage;
	import com.google.protobuf.Message;
	import com.google.protobuf.ByteArray;
	import game.net.NetSocket;
	import game.query_players;

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

			NetSocket.getInstance().sendAndFlush(sendMsg.getUint8Array(0,sendMsg.length));
		}

		public static function handshake():void
		{
			var q_player:query_players = new query_players();

			q_player.account = "dcs1006";
			
			send("query_players", q_player);
		} 
	}

}