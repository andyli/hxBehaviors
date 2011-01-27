package hxBehaviors.behavior; 
	using hxBehaviors.Float3DTools;
	import hxBehaviors.Vehicle;
	import hxBehaviors.behavior.AbstractBehavior;
	import hxBehaviors.Float3D;

	/**
	 * @author Eugene Zatepyakin
	 */
	class Seek extends AbstractBehavior {
		
		public var target:Float3D ;
		
		public function new(target:Float3D) 
		{
			super();
			this.target = target;
		}
		
		public override function apply(veh:Vehicle):Void
		{
			accumulator.setDiff(target, veh.position);
			
			var goalLength:Float = 1.1 * veh.velocity.approximateLength();
			accumulator.setApproximateTruncate(goalLength);
			accumulator.setDiff(accumulator, veh.velocity);
			accumulator.setApproximateTruncate(veh.maxForce);
			
			veh.applyGlobalForce(accumulator);
		}
	}
