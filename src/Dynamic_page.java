import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Group;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 * 
 * @author Idle_Thought
 */
public class Dynamic_page implements Initializable {
	//<Question/Radio Options, Answer>: The most recent question (or radio options for radio buttons) and the answer the user gave
	static Map<List<String>, Integer> allAnswers;	
	static List<List<String>> allQuestions;
	static List<Integer> allQuestionTypes;
	
	static Map<List<String>, Integer> backButtonAnswers;
	static List<List<String>> backButtonQuestions;
	static List<Integer> backButtonQuestionTypes;
	
	static List<String> currentQuestion;
	
	static int numOfQuestions;
	static boolean firstRun;
	
	//layout items
	static Group root;
	static AnchorPane rootAnchorPane;
	static VBox vbox;
	static Label questionBox;
	static Separator split;
	static Button continueButton, backButton, forwardButton;
	static ToggleButton toggleTrue, toggleFalse;
	static TextField integerResponseField;
	static MenuBar menuBar;
	static ToggleGroup radioButtonOptions;
	static RadioButton[] radioButtons;
	
	Dynamic_page() {	
		allAnswers = new HashMap<List<String>, Integer>();
		allQuestions = new ArrayList<List<String>>();
		allQuestionTypes = new ArrayList<Integer>();
		backButtonAnswers = new HashMap<List<String>, Integer>();
		backButtonQuestions = new ArrayList<List<String>>();
		backButtonQuestionTypes = new ArrayList<Integer>();
		currentQuestion = new ArrayList<String>();
		numOfQuestions = 0;
		firstRun = true;
		root = new Group();
		intializeMenuBar();
		intializeQuestionBox();
		intializeHorizontalSeparator();
		intializeAnswerArea();
		intializeContinueButton();
		intializeBackButton();
		intializeForwardButton();
		intializeIntegerTextField();
		intializeBooleanToggleButton();
	}
	
	private void intializeMenuBar(){
		//Menu Bar
        vbox = new VBox(20);
        menuBar = new MenuBar();
        MenuItem closeOption = MenuItemBuilder.create().text("Close").build();
        closeOption.setOnAction(new EventHandler<ActionEvent>() {
            @Override public void handle(ActionEvent t) {
            	 Platform.exit();
            }
        });
        
        MenuItem aboutOption = MenuItemBuilder.create().text("About").build();
        aboutOption.setOnAction(new EventHandler<ActionEvent>() {
            @Override public void handle(ActionEvent t) {
            	final Stage stage = new Stage(StageStyle.UNDECORATED);
                Group aboutPopup = new Group();
                stage.setScene(new Scene(aboutPopup, 400, 250, Color.WHITESMOKE));
            	
            	Label teamName = new Label("Team MIFTIWAC");
            	teamName.setStyle("" +
                		"-fx-font-size: 18px;");
            	teamName.setLayoutX(133.0);
            	teamName.setLayoutY(30.0);
            	
            	Label aboutInfo = new Label("More information coming soon!");
            	aboutInfo.setLayoutX(94.0);
            	aboutInfo.setLayoutY(115.0);
            	
            	Button closeButton = new Button("Close");
            	closeButton.setLayoutX(170.0);
            	closeButton.setLayoutY(179.0);
            	closeButton.setFocusTraversable(true);
            	closeButton.setOnAction(new EventHandler<ActionEvent>() {
		            @Override public void handle(ActionEvent t) { 
		            	stage.close();
		            }
            	});
            	
                aboutPopup.getChildren().add(teamName);
                aboutPopup.getChildren().add(aboutInfo);
                aboutPopup.getChildren().add(closeButton);
                stage.centerOnScreen();
                stage.show();
            }
        });
        
        Menu file = MenuBuilder.create().text("File").items(closeOption).build();
        Menu help = MenuBuilder.create().text("Help").items(aboutOption).build();
        menuBar.getMenus().addAll(file);
        menuBar.getMenus().addAll(help);
        menuBar.setPrefSize(1200, 30);
        vbox.getChildren().addAll(menuBar);
	}
	
	private void intializeQuestionBox(){
		//Question Box
        questionBox = new Label("");
		questionBox.setStyle("" +
        		"-fx-font-size: 35px;" +
        		"-fx-text-alignment: left;");
        questionBox.setLayoutX(20.0);
        questionBox.setLayoutY(50.0);
        questionBox.setPrefSize(1166.0, 286.0);
	}
	
	private void intializeHorizontalSeparator(){
		//Horizontal Separator
        split = new Separator();
        split.setLayoutX(15.0);
        split.setLayoutY(348.0);
        split.setPrefSize(1171.0, 4.0);
	}
	
	private void intializeAnswerArea(){
		//User selection/answer area
        radioButtonOptions = new ToggleGroup();
		radioButtons = new RadioButton[5];
		double yLayout = 390.0;
		for(int i = 0; i < 5; i++){
			RadioButton radioButton = new RadioButton();
			radioButton.setToggleGroup(radioButtonOptions);
			radioButton.setPrefSize(750.0, 50.0);
			radioButton.setLayoutX(186.0);
			radioButton.setLayoutY(yLayout);
			radioButton.setStyle("" +
	        		"-fx-font-size: 20px;");
			radioButton.setOnAction(new EventHandler<ActionEvent>() {
				@Override
				public void handle(ActionEvent event) {
					continueButton.setDisable(false);
				}
				
			});
			radioButtons[i] = radioButton;
			yLayout = yLayout + 50.0;
		}
	}
	
	private void intializeContinueButton(){
		//Submit Button
		continueButton = new Button("Continue...");
		continueButton.setStyle("" +
        		"-fx-font-size: 20px;" +
        		"-fx-cursor: hand;" +
        		"-fx-text-alignment: center;" +
        		"-fx-font-style: italic;" +
        		"-fx-font-weight: bold;");
        continueButton.setDefaultButton(true);
        continueButton.setDisable(true);
        continueButton.setLayoutX(530.0);
        continueButton.setLayoutY(670.0);
        continueButton.setPrefSize(140.0, 47.0);
        continueButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override public void handle(ActionEvent t) {
            	//boolean question: 1 is for true, 0 is for false
            	//integer question: number value
            	//radio choice: index of the answer on text
            	if(MIFTIWAC.dynamicPageType == 1){
        			//boolean question
        			if(toggleTrue.isSelected()){
        				MIFTIWAC.answer = 1;
        				toggleTrue.setSelected(false);
        			}else{
        				MIFTIWAC.answer = 0;
        				toggleFalse.setSelected(false);
        			}
        		}else if(MIFTIWAC.dynamicPageType == 2){
        			//integer question
        			if(integerResponseField.getLength() > 0){
        				MIFTIWAC.answer = Integer.valueOf(integerResponseField.getText());
        				integerResponseField.clear();
        			}
        		} else if(MIFTIWAC.dynamicPageType == 3){
        			//radio button question
        			for(int i = 1; i < 5; i++){
        				if(radioButtons[i].isSelected()){
        					MIFTIWAC.answer = i+1;
        				}
        			}
        		}
            	
            	//obtain question and answer for back and forward button operations
            	List<String> question = new ArrayList<String>(MIFTIWAC.questionText);
            	allAnswers.put(question, MIFTIWAC.answer);
            	allQuestions.add(question);
            	//System.out.println("allAnswers - Does it contain the question?: " + allAnswers.containsKey(question) + " The user's answer was: " + allAnswers.get(question));
            	
            	//GUI Reset for next question
            	continueButton.setDisable(true);
            	integerResponseField.setVisible(false);
            	toggleFalse.setVisible(false);
            	toggleTrue.setVisible(false);
            	
            	for(int i = 0; i < 5; i++){
    	        	radioButtons[i].setVisible(false);
    	        	radioButtons[i].setSelected(false);
    	        }

            	//Tell JESS that the user has responded!
            	MIFTIWAC.hasUserResponded.set(MIFTIWAC.hasUserResponded.getValue() + 1);
            }
        });
	}
	
	private void intializeBackButton(){
		//Back Button
		backButton = new Button();
		backButton.setStyle("" +
				"-fx-cursor: hand; " +
				"-fx-background-repeat: no-repeat; " +
				"-fx-background-position: center;" +
				"-fx-base: white;" +
				"-fx-background-color: white;" +
				"-fx-background-image: url('file:resources/pictures/backButtonIcon.png');");
		backButton.setDisable(true);
		backButton.setLayoutX(470.0);
		backButton.setLayoutY(669.0);
		backButton.setPrefSize(48.0, 48.0);
		backButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override public void handle(ActionEvent t) {
            	System.out.println("Back button was pressed!");
            	
            }
        });
	}
	
	private void intializeForwardButton(){
		//Forward Button
		forwardButton = new Button();
		forwardButton.setStyle("" +
				"-fx-cursor: hand;" +
				"-fx-background-repeat: no-repeat; " +
				"-fx-background-position: center;" +
				"-fx-base: white;" +
				"-fx-background-color: white;" +
				"-fx-background-image: url('file:resources/pictures/forwardButtonIcon.png');");
		forwardButton.setDisable(true);
		forwardButton.setLayoutX(682.0);
		forwardButton.setLayoutY(669.0);
		forwardButton.setPrefSize(48.0, 48.0);
        forwardButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override public void handle(ActionEvent t) {
            	System.out.println("Forward button was pressed!");
            }
        });
	}
	
	private void intializeIntegerTextField(){
		//Integer Question User Input Field
		integerResponseField = new TextField();
        integerResponseField.promptTextProperty().set("Type Value Here");
        integerResponseField.setPrefSize(208, 47);
        integerResponseField.setLayoutX(496.0);
        integerResponseField.setLayoutY(488.0);
        
        integerResponseField.setOnKeyReleased(new EventHandler<KeyEvent>() {
			@Override
			public void handle(KeyEvent event) {
				if(integerResponseField.getText().isEmpty()){
					continueButton.setDisable(true);
				}else{
					continueButton.setDisable(false);
				}
			}
        });
	}
	
	private void intializeBooleanToggleButton(){
		//Boolean Question User Input True or False Toggle Button
        toggleTrue = new ToggleButton("TRUE");
        toggleFalse = new ToggleButton("FALSE");
        ToggleGroup booleanToggleGroup = new ToggleGroup();
        toggleTrue.setToggleGroup(booleanToggleGroup);
        toggleFalse.setToggleGroup(booleanToggleGroup);
        toggleTrue.setStyle("" +
        		"-fx-font-size: 20px;" +
        		"-fx-cursor: hand;" +
        		"-fx-text-alignment: center;" +
        		"-fx-font-style: italic;" +
        		"-fx-font-weight: bold;");
        toggleFalse.setStyle("" +
        		"-fx-font-size: 20px;" +
        		"-fx-cursor: hand;" +
        		"-fx-text-alignment: center;" +
        		"-fx-font-style: italic;" +
        		"-fx-font-weight: bold;");
        toggleTrue.setPrefSize(122, 47);
        toggleFalse.setPrefSize(122, 47);
        toggleTrue.setLayoutX(417.0);
        toggleTrue.setLayoutY(485.0);
        toggleFalse.setLayoutX(661.0);
        toggleFalse.setLayoutY(485.0);
        toggleTrue.setOnAction(new EventHandler<ActionEvent>() {
            @Override public void handle(ActionEvent t) {
            	if(!toggleTrue.isSelected()){
            		continueButton.setDisable(true);
            	}else{
            		continueButton.setDisable(false);
            	}
            }
        });
        toggleFalse.setOnAction(new EventHandler<ActionEvent>() {
            @Override public void handle(ActionEvent t) {
            	if(!toggleFalse.isSelected()){
            		continueButton.setDisable(true);
            	}else{
            		continueButton.setDisable(false);
            	}
            }
        });
	}
	
	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		
	}
	
	public void display(){
		//keep track of the number of questions		
		numOfQuestions++;
		
		if(firstRun){
			firstRun = false;
			MIFTIWAC.mainStage.setScene(new Scene(root));
		
			root.getChildren().add(vbox);
			root.getChildren().add(questionBox);
			root.getChildren().add(split);
			root.getChildren().add(continueButton);
			root.getChildren().add(backButton);
			root.getChildren().add(forwardButton);
			root.getChildren().add(toggleTrue);
	        root.getChildren().add(toggleFalse);	        
	        root.getChildren().add(integerResponseField);	        
	        root.getChildren().add(radioButtons[0]);
	        root.getChildren().add(radioButtons[1]);
	        root.getChildren().add(radioButtons[2]);
	        root.getChildren().add(radioButtons[3]);
	        root.getChildren().add(radioButtons[4]);
	        
	        //backButton.setVisible(false);
	        //forwardButton.setVisible(false);
	        toggleTrue.setVisible(false);
	        toggleFalse.setVisible(false);
	        integerResponseField.setVisible(false);
	        for(int i = 0; i < 5; i++){
	        	radioButtons[i].setVisible(false);
	        	radioButtons[i].setSelected(false);
	        }
		}
		
		if(MIFTIWAC.dynamicPageType == 1){
			//boolean question
			if(MIFTIWAC.questionText.size() > 0){
				System.out.println("Should display to the question box: " + MIFTIWAC.questionText.get(0));
				questionBox.setText(MIFTIWAC.questionText.get(0));
		        toggleTrue.setVisible(true);
		        toggleFalse.setVisible(true);
			}else{
				System.out.println("Error! There is no question in the ArrayList to display!");
			}
		}else if(MIFTIWAC.dynamicPageType == 2){
			//integer question
			if(MIFTIWAC.questionText.size() > 0){
				System.out.println("Should display to the question box: " + MIFTIWAC.questionText.get(0));
				questionBox.setText(MIFTIWAC.questionText.get(0));
				integerResponseField.setVisible(true);
			}else{
				System.out.println("Error! There is no question in the String Array to display!");
			}
		}else if(MIFTIWAC.dynamicPageType == 3){
			//radio question
			if(MIFTIWAC.questionText.size() > 0){
				System.out.println("Should display to the question box: " + MIFTIWAC.questionText.get(0));
				questionBox.setText(MIFTIWAC.questionText.get(0));
				if(MIFTIWAC.questionText.size() > 1){
					for(int i = 1; i < MIFTIWAC.questionText.size(); i++){
						radioButtons[(i - 1)].setVisible(true);
						radioButtons[(i - 1)].setText(MIFTIWAC.questionText.get(i));
					}
				}else{
					System.out.println("Error! There are no options for this question to display!");
				}
			}else{
				System.out.println("Error! There is no question in the String Array to display!");
			}
		}else if(MIFTIWAC.dynamicPageType == 4){
			if(MIFTIWAC.subGenreAnswer.compareToIgnoreCase("NULL") != 0){
				MIFTIWAC.blankPage = false;
				try {
					MIFTIWAC.mainStage.setScene(new Scene((Parent)FXMLLoader.load(getClass().getResource("Solution_page.fxml"))));
				} catch (IOException e) {
					e.printStackTrace();
				}
				MIFTIWAC.mainStage.show();
			}else{
				System.out.println("Error! Solution page was triggered but the subGenreAnswer variable doesn't have a correct answer!");
				try {
					MIFTIWAC.mainStage.setScene(new Scene((Parent)FXMLLoader.load(getClass().getResource("Solution_page.fxml"))));
				} catch (IOException e) {
					e.printStackTrace();
				}
				MIFTIWAC.mainStage.show();
			}
		}else{
			System.out.println("Error! There is no SubGenre in the textQuestion array to display!");
		}
	}

}