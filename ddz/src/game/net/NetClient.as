package game.net
{
	import laya.net.Socket;
	import com.google.protobuf.Message;
	import com.google.protobuf.ByteArray;
	import game.net.NetSocket;
	import game.net.NetClient;
	import game.proto.*;
	import game.proto.account_login;
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
			var acc_login:account_login = new account_login();
				
			acc_login.account 	= "dcs1001";
			acc_login.passwd 	= "12345678";
			
			send("account_login", acc_login);
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