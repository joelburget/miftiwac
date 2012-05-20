package miftiwac;

import jess.JessException;
import jess.Rete;

public class Controller {
	// Pointers to used objects.
	private static GUIFace GUIused;
	private static Question question;

	// Static variables for GUI to reference.
	public static int dynamicPageType;
	public static String[] text;
	public static int answer;
	public static int solutionFound;

	// Lets JESS pass the reference for shadow facts object.
	public static void prepQuestion(Object o) {
		Controller.question = (Question) o;
	}

	// Lets JESS tell the controller the question is ready.
	public static void questionReady() {
		// Sets the type of the question for the GUI.
		switch (Controller.question.type) {
		case 0: // boolean
			Controller.dynamicPageType = 1;
			break;
		case 1: // radio
			Controller.dynamicPageType = 3;
			break;
		case 2: // integer
			Controller.dynamicPageType = 2;
			break;
		}

		// Creates the array of texts for the GUI, where 0 is question, 1-n are answers.
		if (Controller.question.type == 1) {
			Controller.text = new String[Controller.question.answerTexts.length + 1];
		} else {
			Controller.text = new String[1];
		}
		Controller.text[0] = Controller.question.questionText;
		for (int i = 1; i < question.answerTexts.length; i++) {
			Controller.text[i] = question.answerTexts[i-1];
		}

		// Tells the GUI it's ready to display.
		GUIused.display();
		
		
	}

	public static void result() {
		Controller.dynamicPageType = 4;
		
		GUIused.display();
	}

	public static void main(String[] args) {
		try {
			// Create a Jess rule engine
			Rete engine = new Rete();
			engine.reset();

			// Load the rules
			engine.batch("src/miftiwac/rules.clp");

			// Mark end of catalog data for later
			// WorkingMemoryMarker marker = engine.mark();

			engine.run();
		} catch (JessException e) {
			System.out.println(e);
		}
	}
}
