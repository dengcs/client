package game.handler
{
	import com.google.protobuf.CodedInputStream;
	import game.manager.MessageManager;
	import laya.utils.Handler;
	import game.net.NetClient;
	import game.proto.*;

	/**
	 * ...
	 * @dengcs
	 */
	public final class AccountHandler{

		public function AccountHandler(){			
			registerMessage();
		}

		private function registerMessage():void
		{
			var msgManager:MessageManager = MessageManager.getInstance();
			msgManager.registerMessage("account_login_resp", new Handler(this, handler_account_login_resp));
		}

		private function handler_account_login_resp(ntMessage:NetMessage):void
		{
			var resp_data:account_login_resp = new account_login_resp();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)

			if(resp_data.ret == 0)
			{
				var q_player:query_players = new query_players();
				
				q_player.account = "dcs1001";
				
				NetClient.send("query_players", q_player);
			}
		}
	}

}