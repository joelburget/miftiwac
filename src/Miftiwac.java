import jess.JessException;
import jess.Rete;

public class Miftiwac {
	// Pointers to used objects.
	private static Question question;
	private static GUIFace GUIused;

	// Static variables for GUI to reference.
	public static int dynamicPageType;
	public static String[] text;
	public static int answer;
	public static boolean solutionFound;

	// Lets JESS pass the reference for shadow facts object.
	public static void prepQuestion(Object o) {
		Miftiwac.question = (Question) o;
	}

	// Lets JESS tell the controller the question is ready.
	public static void questionReady() {
		// Sets the type of the question for the GUI.
		switch (Miftiwac.question.getType()) {
		case 0: // boolean
			Miftiwac.dynamicPageType = 1;
			break;
		case 1: // radio
			Miftiwac.dynamicPageType = 3;
			break;
		case 2: // integer
			Miftiwac.dynamicPageType = 2;
			break;
		}

		// Creates the array of texts for the GUI, where 0 is question, 1-n are
		// answers.
		if (Miftiwac.question.getType() == 1) {
			Miftiwac.text = new String[Miftiwac.question.getAnswerTexts().length + 1];
		} else {
			Miftiwac.text = new String[1];
		}
		Miftiwac.text[0] = Miftiwac.question.getQuestionText();
		for (int i = 1; i <= question.getAnswerTexts().length; i++) {
			Miftiwac.text[i] = question.getAnswerTexts()[i - 1];
		}

		// Tells the GUI it's ready to display.
		GUIused.display();	
		
		// If radio, subtract 1 for offset between two arrays.
		if (Miftiwac.dynamicPageType == 3) {
			Miftiwac.answer--;
		}
		
		// Put answer into question.
		Miftiwac.question.setAnswer(Miftiwac.answer);
		
		return;
	}

	public static void main(String[] args) {
		// Prep GUI.
		Miftiwac.GUIused = new GUIText();
		
		// Prep shared memory with GUI.
		Miftiwac.dynamicPageType = 0;
		Miftiwac.text = new String[0];
		Miftiwac.answer = 0;
		Miftiwac.solutionFound = false;
		
		try {
			// Create a Jess rule engine.
			Rete engine = new Rete();
			engine.reset();

			// Load the rules.
			engine.batch("src/rules.clp");

			// Run the engine.
			engine.run();
		} catch (JessException e) {
			System.out.println(e);
		}
	}
}
