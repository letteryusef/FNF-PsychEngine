/*
	
	oi, here i'm going to show you how to use Preseted Model Views on your mod!

	- To create a view for your models, you can use this example below:

		var _view:PresetViewModel;

		// MAKE SURE TO HIDE THE FLXG CAMERA SO YOU CAN VIEW IT!
		FlxG.camera.alpha = 0; or FlxG.camera.visible = false;

		_view = new PresetViewModel(0, 200, -600);
		_view.view.camera.lookAt(new Vector3D());
	
	* mini GUIDE:
	
		PresetViewModel(X, Y, Z);

	- Simple enough right?, but if you kinda want to show your models as a Sprite on the FlxG Game, just use this:
		
		_view.viewToSprite();
		add(_view.sprite);
	
	- And for updating the view, use this on update() function:

		This prevents your game crash! --> if (_view != null) _view.update();

	- And that's it, have fun with it! :)

*/

package;

import away3d.animators.*;
import away3d.containers.*;
import away3d.controllers.*;
import away3d.debug.*;
import away3d.entities.*;
import away3d.events.*;
import away3d.library.*;
import away3d.library.assets.*;
import away3d.lights.*;
import away3d.loaders.parsers.*;
import away3d.materials.*;
import away3d.materials.lightpickers.*;
import away3d.materials.methods.*;
import away3d.primitives.*;
import away3d.utils.Cast;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.util.FlxDestroyUtil;
import lime.graphics.opengl.GL;
import lime.graphics.opengl.GLFramebuffer;
import lime.utils.UInt8Array;
import openfl.Assets;
import openfl.Vector;
import openfl.display.*;
import openfl.display3D.textures.RectangleTexture;
import openfl.events.*;
import openfl.filters.*;
import openfl.geom.*;
import openfl.text.*;
import openfl.ui.*;
import openfl.utils.ByteArray;
import openfl.Lib;
#if sys
import sys.io.FileOutput;
#end

class PresetViewModel
{
	public var view:View3D;
	public var cameraController:HoverController;

	public var lookAtObject:ObjectContainer3D;

	public var light:DirectionalLight;
	public var lightPicker:StaticLightPicker;
	public var shadowMapMethod:ShadowMapMethodBase;
	public var distance(get, set):Float;
	public var pan(get, set):Float;
	public var tilt(get, set):Float;

	private var bmd:BitmapData;
	public var sprite:FlxSprite;

	public function new(x:Float = 0, y:Float = 0, z:Float = 0)
	{
		view = new View3D();
		setCamPos(x, y, z);
		view.backgroundAlpha = 0;
		resize();
		FlxG.addChildBelowMouse(view);
	}

	public function viewToSprite(initialX:Float = 0, initialY:Float = 0)
	{
		view.alpha = 0;
		bmd = new BitmapData(Std.int(view.width), Std.int(view.height), true, 0x0);
		sprite = new FlxSprite(initialX, initialY);
		sprite.loadGraphic(bmd);
	}

	public function returnToView()
	{
		if (bmd != null && sprite != null)
		{
			bmd.dispose();
			sprite.destroy();
			bmd = null;
			sprite = null;
			view.alpha = 1;
		}
	}

	public function addControllerCamera(near:Float, far:Float)
	{
		lookAtObject = new ObjectContainer3D();
		lookAtObject.x = lookAtObject.y = lookAtObject.z = 0;
		view.scene.addChild(lookAtObject);

		cameraController = new HoverController(view.camera, lookAtObject, 90, 0, 300);
		cameraController.wrapPanAngle = true;
		view.camera.lens.near = near;
		view.camera.lens.far = far;
	}

	public function addLighting(ambient:Float, specular:Float, diffuse:Float)
	{
		light = new DirectionalLight(0., -0.7, -0.7);
		lightPicker = new StaticLightPicker([light]);
		view.scene.addChild(light);
		light.ambient = ambient;
		light.specular = specular;
		light.diffuse = diffuse;

		shadowMapMethod = new FilteredShadowMapMethod(light);
	}

	public function update()
	{
		if (bmd != null || sprite != null)
		{
			view.backgroundAlpha = 0;
			view.renderer.queueSnapshot(bmd);
			view.render();
			view.backgroundAlpha = 1;
	
			sprite.loadGraphic(bmd);
			sprite.graphic.persist = true;
		} else {
			view.render();
		}
	}

	public function resize() 
	{
		view.width = FlxG.stage.stageWidth;
		view.height = FlxG.stage.stageHeight;
	}

	public function addModel(model:Mesh)
	{
		view.scene.addChild(model);
	}

	public function setCamLookAt(x:Float, y:Float, z:Float)
	{
		lookAtObject.x = x;
		lookAtObject.y = y;
		lookAtObject.z = z;
	}

	public function set_pan(pan:Float)
	{
		return cameraController.panAngle = pan;
	}

	public function get_pan():Float
	{
		return cameraController.panAngle;
	}

	public function set_tilt(tilt:Float)
	{
		return cameraController.tiltAngle = tilt;
	}

	public function get_tilt():Float
	{
		return cameraController.tiltAngle;
	}

	public function set_distance(dist:Float)
	{
		return cameraController.distance = dist;
	}

	public function get_distance():Float
	{
		return cameraController.distance;
	}

	public function setCamPos(x:Float, y:Float, z:Float)
	{
		view.camera.x = x;
		view.camera.y = y;
		view.camera.z = z;
	}

	public function destroy()
	{
		cameraController = null;
		if (lookAtObject != null)
			lookAtObject.dispose();
		lookAtObject = null;
		if (view.camera != null)
		{
			view.camera.disposeWithChildren();
			view.camera.disposeAsset();
		}
		if (light != null)
			light.disposeWithChildren();
		light = null;
		if (lightPicker != null)
			lightPicker.dispose();
		lightPicker = null;
		if (shadowMapMethod != null)
			shadowMapMethod.dispose();
		shadowMapMethod = null;
		for (i in view.scene.numChildren - 1...-1)
		{
			if (view.scene.getChildAt(i) != null)
			{
				view.scene.getChildAt(i).disposeWithChildren();
				view.scene.removeChildAt(i);
			}
		}
		FlxG.game.stage.removeChild(view);
		view.dispose();
		view = null;
	}
}