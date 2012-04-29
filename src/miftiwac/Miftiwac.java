package miftiwac;

import jess.*;

public class Miftiwac {    
	public static void main(String[] args) {
		try {
		// Create a Jess rule engine
        Rete engine = new Rete();
        engine.reset();

        // Load the pricing rules
        engine.batch("rules.clp");

        // Mark end of catalog data for later
        WorkingMemoryMarker marker = engine.mark();
        
        engine.run();
		} catch (JessException e) {
			System.out.println(e);
		}
	}
}