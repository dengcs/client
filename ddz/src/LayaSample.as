package {
	import common.GameConstants;

	import laya.display.Stage;
	import laya.net.ResourceVersion;
	import laya.webgl.WebGL;
	import laya.wx.mini.MiniAdpter;
	import laya.utils.Handler;
	import game.query_players;
	import game.NetMessage;
	import game.NetError;
	import game.NetHeader;
	import laya.events.Event;
	import laya.net.Socket;
	import laya.utils.Byte;
	import com.google.protobuf.Message;
	import com.google.protobuf.ByteArray;
	import com.google.protobuf.Int64;
	import com.google.protobuf.CodedInputStream;
	import com.google.protobuf.CodedOutputStream;
	import game.query_players_resp;
	import game.net.NetClient;
	import game.net.SocketSingleton;
	public class LayaSample {
		private var socket:Socket;
		private var output:Byte;
		
		public function LayaSample() {
			MiniAdpter.init();
			//初始化引擎
			Laya.init(GameConstants.stageWidth, GameConstants.stageHeight, WebGL);
			
			Laya.stage.alignH = Stage.ALIGN_CENTER;
			Laya.stage.alignV = Stage.ALIGN_TOP;
			Laya.stage.scaleMode = Stage.SCALE_FIXED_WIDTH;
			Laya.stage.screenMode = Stage.SCREEN_HORIZONTAL;
			
			//设置版本控制类型为使用文件名映射的方式
            ResourceVersion.type = ResourceVersion.FILENAME_VERSION;
            //加载版本信息文件
            ResourceVersion.enable("version.json", Handler.create(this, beginLoad));   
		}

		private function beginLoad():void {
			//加载引擎需要的资源
			//Laya.loader.load(atlasUrls(), Handler.create(this, onLoaded));
			onLoaded();
		}
		
		private function onLoaded():void {
			SocketSingleton.getInstance().connectToServer("ws://192.168.188.83:51001");
		}
		

		private function atlasUrls():Array
		{
			var urls:Array=[];

			return urls;
		}
	}
}