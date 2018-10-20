package game.handler
{
	import com.google.protobuf.CodedInputStream;
	import game.manager.MessageManager;
	import laya.utils.Handler;
	import game.proto.NetMessage;
	import game.proto.create_player;
	import game.net.NetClient;
	import game.proto.*;
	import game.proto.player_login;
	import game.proto.room_create;

	/**
	 * ...
	 * @dengcs
	 */
	public final class PlayerHandler{

		public function PlayerHandler(){			
			registerMessage();
		}

		private function registerMessage():void
		{
			var msgManager:MessageManager = MessageManager.getInstance();
			msgManager.registerMessage("query_players_resp", new Handler(this, handler_query_players_resp));
			msgManager.registerMessage("create_player_resp", new Handler(this, handler_create_player_resp));
			msgManager.registerMessage("player_login_resp", new Handler(this, handler_player_login_resp));
		}

		private function handler_query_players_resp(ntMessage:NetMessage):void
		{
			var resp_data:query_players_resp = new query_players_resp();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)

			// 没有就创建角色
			if(resp_data.ret != 0)
			{
				var createMsg:create_player = new create_player();
				createMsg.nickname = "邓1";
				createMsg.portrait = "portrait";
				createMsg.sex = 1;

				NetClient.send("create_player", createMsg);
			}else{
				var loginMsg:player_login = new player_login();
				NetClient.send("player_login", loginMsg);
			}
		}

		private function handler_create_player_resp(ntMessage:NetMessage):void
		{
			var resp_data:create_player_resp = new create_player_resp();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)

			// 创建成功则登录
			if(resp_data.ret == 0)
			{
				var loginMsg:player_login = new player_login();
				NetClient.send("player_login", loginMsg);
			}
		}

		private function handler_player_login_resp(ntMessage:NetMessage):void
		{
			var resp_data:player_login_resp = new player_login_resp();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)

			if(resp_data.ret == 0)
			{
				var roomMsg:room_create = new room_create();
				roomMsg.channel = 1
				NetClient.send("room_create", roomMsg);
			}
		}
	}

}