using System;
namespace FitnessExercises.core
{
	public class Exercise
	{
		public string Name { get; private set; }
		public float  Meters { get; private set; }
		public short  Minutes { get; private set; }

		public Exercise( string Name, float Meters, short Minutes )
		{
			this.Name = Name;
			this.Meters = Meters;
			this.Minutes = Minutes;
		}
	}
}
