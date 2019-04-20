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
			msgManager.registerMessage("register_resp", new Handler(this, handler_register_resp));
			msgManager.registerMessage("verify_resp", new Handler(this, handler_verify_resp));
		}

		private function handler_register_resp(ntMessage:NetMessage):void
		{
			var resp_data:register_resp = new register_resp();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)

			if(resp_data.token > 0)
			{
				var vf_msg:verify = new verify();
				
				vf_msg.token = resp_data.token;
				
				NetClient.send("verify", vf_msg);
			}
		}

		private function handler_verify_resp(ntMessage:NetMessage):void
		{
			var resp_data:verify_resp = new verify_resp();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)

			if(resp_data.ret == 0)
			{
				var qp_msg:query_players = new query_players();
				
				qp_msg.account = "dcs1001";
				
				NetClient.send("query_players", qp_msg);
			}
		}
	}

}