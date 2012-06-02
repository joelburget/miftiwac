import jess.JessException;
import jess.Rete;

public class MiftiwacM {
	// Pointers to used objects.
	private static Question question;
	private static GUIFace GUIused;

	// Static variables for GUI to reference.
	public static int dynamicPageType;
	public static String[] text;
	public static int answer;

	// Lets JESS pass the reference for shadow facts object.
	public static void prepQuestion(Object o) {
		MiftiwacM.question = (Question) o;
	}

	// Lets JESS tell the controller the question is ready.
	public static void questionReady() {
		try {
		// Sets the type of the question for the GUI.
		switch (MiftiwacM.question.getType()) {
		case 0: // boolean
			MiftiwacM.dynamicPageType = 1;
			break;
		case 1: // integer
			MiftiwacM.dynamicPageType = 2;
			break;
		case 2: // radio
			MiftiwacM.dynamicPageType = 3;
			break;
		case 3: // answer
			MiftiwacM.dynamicPageType = 4;
		}

		// Creates the array of texts for the GUI, where 0 is question, 1-n are
		// answers.
		if (MiftiwacM.question.getType() == 2) {
			MiftiwacM.text = new String[MiftiwacM.question.getAnswerTexts().length + 2];
		} else if (MiftiwacM.question.getType() == 3) {
			MiftiwacM.text = new String[3];
		} else {
			MiftiwacM.text = new String[2];
		}

		// Put in question text.
		if (MiftiwacM.question.getType() == 3) {
			for (int i = 0; i < 3; i++) {
				MiftiwacM.text[i] = question.getAnswerTexts()[i];
			}
		} else {
			// Put in question text.
			MiftiwacM.text[0] = MiftiwacM.question.getQuestionText();

			// Put in answer text.
			MiftiwacM.text[1] = MiftiwacM.question.getExplanation();

			// Put in answer texts if radio or explanation.
			if (MiftiwacM.question.getType() == 2) {
				for (int i = 2; i < 2 + question.getAnswerTexts().length; i++) {
					//System.out.println(question.getAnswerTexts()[i - 2]);
					MiftiwacM.text[i] = question.getAnswerTexts()[i - 2];
				}
			}
		}

		// Tells the GUI it's ready to display.
		GUIused.display();

		// If radio, subtract 2 for offset between two arrays.
		if (MiftiwacM.question.getType() == 2) {
			MiftiwacM.answer -= 1;
		}

		// Put answer into question.
		MiftiwacM.question.setAnswer(MiftiwacM.answer);
		
		return;
		}
		catch (Exception e) {
			e.printStackTrace();
			System.exit(0);
		}
	}

	public static void main(String[] args) {
		// Prep GUI.
		MiftiwacM.GUIused = new GUIText();

		// Prep shared memory with GUI.
		MiftiwacM.dynamicPageType = 0;
		MiftiwacM.text = new String[0];
		MiftiwacM.answer = 0;

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
