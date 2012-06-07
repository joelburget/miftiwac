
import java.net.URL;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import javafx.application.Application;
import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.fxml.Initializable;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import jess.JessException;
import jess.Rete;

/**
 *
 * @author Jon Martin
 */
public class MIFTIWAC extends Application implements Initializable {
	public static Rete engine;
	private static Dynamic_page questionPage;
	private static Group rootOfQuestionPage;
	public static Stage mainStage;
	public static boolean blankPage;
	public static Question question;
	
	//---------------------------------------------------------------------------------------------------
	//Integer for JESS to update to tell Java if it is 
	//0.) Default Null Value
	//1.) Boolean
	//2.) Integer
	//3.) Radio Button(s)
	public static int dynamicPageType;
	
	//Information that is updated to manage the dynamic Q/A page
	public static List<String> questionText;
	
	//Information about the question.
	public static String questionDescription;
	
	//boolean question: 1 is for true, 0 is for false
	//integer question: number value
	//radio choice: index of the answer on text
	public static Integer answer;
	
	//Used to inform us when the display has an answer from the user
	public static IntegerProperty hasUserResponded;
	
	//this is what Jess will updated when the final answer has been chosen
	public static String subGenreAnswer;
	
	//this is what will need to be updated in order to have the reasoning section filled out on the solution page
	public static String reasoning;
    
	public static WebView webView;
	
    @Override
    public void initialize(URL arg0, ResourceBundle arg1){

    }   
    
    public void init(Stage primaryStage){
    	//startup initializations
    	questionPage = new Dynamic_page();
    	questionText = new ArrayList<String>();
    	questionDescription = "NULL";
    	hasUserResponded = new SimpleIntegerProperty(0);
    	subGenreAnswer = "NULL";
    	reasoning = "NULL";
    	answer = 0;
    	dynamicPageType = 0;
    	blankPage = true;
    	
    	//loads the fxml file for the MIFTIWAC homepage and then sets it as the primary stage
    	//try {
    	//	MIFTIWAC.rootOfQuestionPage = new Group((Parent)(FXMLLoader.load(getClass().getResource("testHomepage.fxml"))));
    	//	primaryStage.setScene(new Scene(MIFTIWAC.rootOfQuestionPage));
    	//} catch (IOException e) {
		//	e.printStackTrace();
		//}
    	 MIFTIWAC.rootOfQuestionPage = new Group();
         primaryStage.setScene(new Scene(MIFTIWAC.rootOfQuestionPage));
         webView = new WebView();
         webView.setMinSize(1200, 800);
         webView.setPrefSize(1200, 800); 	
         final WebEngine eng = webView.getEngine();
         eng.load("http://cse731group3.wordpress.com");
         
         MIFTIWAC.rootOfQuestionPage.getChildren().add(webView);
         
         Button testButton = new Button("Start MIFTIWAC");
         testButton.setStyle("" +
         		"-fx-font-size: 15px;" +
        		"-fx-background-radius: 5, 5, 4, 3;" +
        		"-fx-shadow-highlight-color: derive(-fx-background, -65%);" +
         		"-fx-cursor: hand;");
         testButton.setDefaultButton(true);
         testButton.setLayoutX(535.0);
         testButton.setLayoutY(14.0);
         testButton.setPrefSize(131.0, 50.0);
         testButton.setOnAction(new EventHandler<ActionEvent>() {
             @Override public void handle(ActionEvent t) {
            	 startButtonHandler(t);
             }
         });
         MIFTIWAC.rootOfQuestionPage.getChildren().add(testButton);
         
    	
		//this is the listener the responds every time the user clicks on the "Continue..." button in the GUI
		MIFTIWAC.hasUserResponded.addListener(new ChangeListener<Number>(){
			@Override
			public void changed(ObservableValue<? extends Number> observable,
					Number oldValue, Number newValue) {	
				int questionTextSize = questionText.size();
				for(int i = 0; i < questionTextSize; i++){
					questionText.remove(0);
				}
				
				// If radio, subtract 2 for offset between two arrays.
				if (MIFTIWAC.dynamicPageType == 3) {
					MIFTIWAC.answer -= 1;
				}

				// Put answer into question.
				MIFTIWAC.question.setAnswer(MIFTIWAC.answer);
				
				try {
					// resume execution of Jess code
					MIFTIWAC.engine.run();
				} catch (JessException e) {
					e.printStackTrace();
				}
			}
		});
    }
   
	public void startButtonHandler(ActionEvent a){
		// Create, load, and run the Jess rule engine
		try {
			MIFTIWAC.engine = new Rete();
			engine.reset();
			engine.batch("src/rules.clp");
			engine.run();
		} catch (JessException e) {
			System.out.println("ERROR: " + e);
		}
    }
	
    @Override
    public void start(final Stage primaryStage){
    	primaryStage.initStyle(StageStyle.UTILITY);
    	primaryStage.setResizable(false);
        mainStage = primaryStage;
    	init(primaryStage);
        primaryStage.show();
    }

    public static void main(String[] args){
		launch(args);	
    }

	public static void questionReady() {
		// Sets the type of the question for the GUI.
		MIFTIWAC.questionText.add(MIFTIWAC.question.getQuestionText());
		MIFTIWAC.questionDescription = MIFTIWAC.question.getExplanation();
		switch (MIFTIWAC.question.getType()) {
		case 0: // boolean
			MIFTIWAC.dynamicPageType = 1;
			break;
		case 1: // integer
			MIFTIWAC.dynamicPageType = 2;
			break;
		case 2: // radio
			MIFTIWAC.dynamicPageType = 3;
			for (int i = 2; i < (question.getAnswerTexts().length + 2); i++) {
				MIFTIWAC.questionText.add(i - 1, question.getAnswerTexts()[i - 2]);
			}
			break;
		case 3: // solution
			MIFTIWAC.dynamicPageType = 4;
			MIFTIWAC.subGenreAnswer = question.getAnswerTexts()[1];
			MIFTIWAC.reasoning = question.getAnswerTexts()[2];
			break;
		default: System.out.println("ERROR! MIFTIWAC.question.getType() did not match any of the dynamicPageTypes!!");
			break;
		}
		
		System.out.println("This is questionTest: " + MIFTIWAC.questionText);

		try {
			// stop execution of Jess engine until engine.run is called
			MIFTIWAC.engine.halt();
		} catch (JessException e) {
			e.printStackTrace();
		}
		// Tells the GUI it's ready to display.
		MIFTIWAC.questionPage.display();
		
		return;
	}

	// Lets JESS pass the reference for shadow facts object.
	public static void prepQuestion(Object o) {
		MIFTIWAC.question = (Question) o;
	}
	
}