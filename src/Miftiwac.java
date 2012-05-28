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
		case 1: // integer
			Miftiwac.dynamicPageType = 2;
			break;
		case 2: // radio
			Miftiwac.dynamicPageType = 3;
			break;
		case 3: // answer
			Miftiwac.dynamicPageType = 4;
		}

		// Creates the array of texts for the GUI, where 0 is question, 1-n are
		// answers.
		if (Miftiwac.question.getType() == 2) {
			Miftiwac.text = new String[Miftiwac.question.getAnswerTexts().length + 2];
		} else if (Miftiwac.question.getType() == 3) {
			Miftiwac.text = new String[3];
		} else {
			Miftiwac.text = new String[2];
		}

		// Put in question text.
		if (Miftiwac.question.getType() == 3) {
			for (int i = 0; i < 3; i++) {
				Miftiwac.text[i] = question.getAnswerTexts()[i];
			}
		} else {
			// Put in question text.
			Miftiwac.text[0] = Miftiwac.question.getQuestionText();

			// Put in answer text.
			Miftiwac.text[1] = Miftiwac.question.getExplanation();

			// Put in answer texts if radio or explanation.
			if (Miftiwac.question.getType() == 2) {
				for (int i = 2; i < 2 + question.getAnswerTexts().length; i++) {
					Miftiwac.text[i] = question.getAnswerTexts()[i - 1];
				}
			}
		}

		// Tells the GUI it's ready to display.
		GUIused.display();

		// If radio, subtract 2 for offset between two arrays.
		if (Miftiwac.question.getType() == 2) {
			Miftiwac.answer -= 2;
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
