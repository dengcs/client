package {
	import common.GameConstants;

	import laya.display.Stage;
	import laya.net.ResourceVersion;
	import laya.webgl.WebGL;
	import laya.wx.mini.MiniAdpter;
	import laya.utils.Handler;
	import laya.events.Event;
	
	import game.net.NetSocket;
	import view.main.Main;
	public class LayaSample {

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
			Laya.loader.load(atlasUrls(), Handler.create(this, onLoaded));
		}
		
		private function onLoaded():void {
			var main:Main = new Main();
			Laya.stage.addChild(main);

			NetSocket.getInstance().connectToServer("ws://192.168.3.128:51001");
		}
		

		private function atlasUrls():Array
		{
			var atlas:Array=[];

			atlas.push("res/atlas/main/button.atlas");

			return atlas;
		}
	}
}