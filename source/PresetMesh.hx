/*
	
	oi, here i'm going to show you how to use Preseted Mesh (more like shapes lol) on your mod!

	- To create a Mesh, you can use this example below:

		var _shape:PresetMesh;

		_shape = new PresetMesh(0, 0, 0, 'plane', [400, 400], 'floor_test.png', _view);
	
	* mini GUIDE:
	
		PresetMesh(X, Y, Z, SHAPE, SHAPE OPTIONS (Search throw the Away3D Primative Library to find it), TEXTURE OR COLOR, VIEW THAT YOU WANT TO ADD IT IN);

	- And for changing your Mesh, use this as example:

		This prevents your game crash! --> if (_shape != null) _shape.rotationY += 1;

	- And that's it, have fun with it! :)

*/

package;

import away3d.entities.*;
import away3d.materials.*;
import away3d.primitives.*;
import away3d.utils.*;

using StringTools;

class PresetMesh
{
	public var mesh:Mesh;

	public function new(x:Float = 0, y:Float = 0, z:Float = 0, shape:String, shapeOptions:Array<Dynamic>, texture:String, view:PresetViewModel)
	{
		var geometricFormat:Dynamic = null;
		var stringToMaterial:Dynamic = null;

		switch(shape.toLowerCase().trim())
		{
			case 'plane': geometricFormat = new PlaneGeometry(shapeOptions[0], shapeOptions[1]);
			case 'cube': geometricFormat = new CubeGeometry(shapeOptions[0], shapeOptions[1], shapeOptions[2]);
			case 'sphere': geometricFormat = new SphereGeometry(shapeOptions[0], shapeOptions[1], shapeOptions[2], shapeOptions[3]);
		}

		if(texture.toLowerCase().startsWith('0x'))
		{
			var parseColor:Int = Std.parseInt(texture);
			stringToMaterial = new ColorMaterial(parseColor);
		} else {
			stringToMaterial = new TextureMaterial(Cast.bitmapTexture(Paths.modelsTexture(texture)));
		}

		mesh = new Mesh(geometricFormat, stringToMaterial);
		view.addModel(mesh);
	}

	public function setPosition(?x:Float, ?y:Float, ?z:Float)
	{
		if (mesh != null)
		{
			if (x != null) mesh.x = x else mesh.x = mesh.x;
			if (y != null) mesh.y = y else mesh.y = mesh.y;
			if (z != null) mesh.z = z else mesh.z = mesh.z;
		}
	}

	public function dispose()
	{
		if (mesh != null)
		{
			mesh.disposeWithAnimatorAndChildren();
			mesh.disposeAsset();
			mesh = null;
		}
	}
}