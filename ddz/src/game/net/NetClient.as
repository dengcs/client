package game.net
{
	import laya.net.Socket;
	import com.google.protobuf.Message;
	import com.google.protobuf.ByteArray;
	import game.net.NetSocket;
	import game.net.NetClient;
	import game.proto.*;
	import game.proto.account_login;
	import game.proto.register;
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
			var reg:register = new register();
				
			reg.account 	= "dcs1001";
			reg.passwd 	= "12345678";
			
			send("register", reg);
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