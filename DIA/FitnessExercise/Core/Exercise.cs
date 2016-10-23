﻿using System;
namespace FitnessExercise.core
{
	public class Exercise
	{
		public string Name { get; private set; }
		public float  Meters { get; private set; }
		public short  Minutes { get; private set; }
		public DateTime Date { get; private set; }

		public Exercise( string Name, float Meters, short Minutes)
		{
			this.Name = Name;
			this.Meters = Meters;
			this.Minutes = Minutes;
			this.Date = DateTime.Now;
		}
	}
}