import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.Cursor;
import javafx.scene.Group;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.scene.media.AudioClip;
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
	
	//Map<Question||RadioOption, relating mediaResource> 
	static Map<String, String> mediaResources = new HashMap<String, String>();
	static int numOfQuestions;
	static boolean firstRun;
	//static boolean questionMediaTogglePressed;
	static boolean[] mediaTogglesPressed;
	//layout items
	static Group root;
	static AnchorPane rootAnchorPane;
	static VBox vbox;
	static Label questionBox, bpmCounterAssistanceLabel;
	static TextArea descriptionArea;
	static Separator split;
	static Button continueButton, backButton, forwardButton, bpmCounterButton;
	static ToggleButton toggleTrue, toggleFalse;
	static ToggleButton[] mediaToggles;
	static TextField integerResponseField;
	static MenuBar menuBar;
	static ToggleGroup radioButtonOptions;
	static RadioButton[] radioButtons;
	static int tapCounter;
	long bpmAvgWholeNumber;
	double bpmAvgDecimal, bpmAvg;
	static double msecsFirst, msecsPrevious;
	static AudioClip[] audioClips;
	
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
		mediaToggles = new ToggleButton[6];
		mediaTogglesPressed = new boolean[6];
		audioClips = new AudioClip[6];
		tapCounter = 0;
		bpmAvgWholeNumber = 0;
		bpmAvgDecimal = 0.0;
		bpmAvg = 0.0;
		msecsFirst = 0.0;
		msecsPrevious = 0.0;
		root = new Group();
		intializeMenuBar();
		intializeQuestionBox();
		intializeDescriptionArea();
		intializeMediaToggleButtons();
		intializeHorizontalSeparator();
		intializeAnswerArea();
		intializeContinueButton();
		intializeBackButton();
		intializeForwardButton();
		intializeIntegerTextField();
		intializeBPMcounter();
		intializeBooleanToggleButton();
		
		readInMediaResources();
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
            	final Stage stage = new Stage(StageStyle.UTILITY);
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
        questionBox.setAlignment(Pos.TOP_LEFT);
        questionBox.setWrapText(true);
		questionBox.setStyle("" +
        		"-fx-font-size: 35px;");
        questionBox.setLayoutX(64.0);
        questionBox.setLayoutY(51.0);
        questionBox.setPrefSize(1122.0, 100.0);
	}
	
	private void intializeDescriptionArea(){
		descriptionArea = new TextArea();
		descriptionArea.setStyle("" +
        		"-fx-font-size: 18px; " +
        	    "-fx-focus-color: #FFFFFF;"+
        		"-fx-text-alignment: left; " +
        		"-fx-text-box-border: derive(-fx-background,100.0%);");
		descriptionArea.setFocusTraversable(false);
		descriptionArea.setEditable(false);
		descriptionArea.setCursor(Cursor.DEFAULT);
		descriptionArea.setLayoutX(78.0);
		descriptionArea.setLayoutY(119.0);
		descriptionArea.setPrefSize(1094.0, 230.0);
		
	}
	
	private void intializeMediaToggleButtons(){
		int yLayout = 413;
		for(int i = 0; i < 6; i++){
			final ToggleButton tButton = new ToggleButton();
			final int cnt = i;
			tButton.setTooltip(new Tooltip("Press For Example Audio"));
			tButton.setStyle("" +
					"-fx-cursor: hand; " +
					"-fx-background-repeat: no-repeat; " +
					"-fx-background-position: center;" +
					"-fx-base: white;" +
					"-fx-background-color: white;" +
					"-fx-background-image: url('file:resources/pictures/media_not_started_icon.png');");
			tButton.setPrefSize(32.0, 32.0);
			
			tButton.setOnAction(new EventHandler<ActionEvent>() {
	            @Override public void handle(ActionEvent t) {
	            	String mediaIcon = "NULL";
	            	for(int i = 0; i < 6; i++){
	            		if(i != cnt){
	            			if(mediaTogglesPressed[i] == true){
	            				audioClips[i].stop();
	            			}
	            			mediaTogglesPressed[i] = false;
	            			mediaToggles[i].setStyle("" +
	    	        				"-fx-cursor: hand; " +
	    	        				"-fx-background-repeat: no-repeat; " +
	    	        				"-fx-background-position: center;" +
	    	        				"-fx-base: white;" +
	    	        				"-fx-background-color: white;" +
	    	        				"-fx-background-image: url('file:resources/pictures/media_not_started_icon.png');");
	            		}
	            	}
	            	
	            	if(mediaTogglesPressed[cnt] =! mediaTogglesPressed[cnt]){
	            		mediaIcon = "-fx-background-image: url('file:resources/pictures/media_started_icon.png');";
	            		audioClips[cnt].play();
	            	}else{
	            		mediaIcon = "-fx-background-image: url('file:resources/pictures/media_not_started_icon.png');";
	            		audioClips[cnt].stop();
	            	}
	          
	            	tButton.setStyle("" +
	        				"-fx-cursor: hand; " +
	        				"-fx-background-repeat: no-repeat; " +
	        				"-fx-background-position: center;" +
	        				"-fx-base: white;" +
	        				"-fx-background-color: white;" +
	        				mediaIcon);
	            }
	        });
			
			if(i == 0){
				tButton.setLayoutX(20.0);
				tButton.setLayoutY(60.0);
				tButton.setPrefSize(32.0, 32.0);
			}else{
				tButton.setLayoutX(130.0);
				tButton.setLayoutY(yLayout);
				yLayout = yLayout + 50;
			}
			mediaToggles[i] = tButton;
		}
	}
	
	private void intializeHorizontalSeparator(){
		//Horizontal Separator
        split = new Separator();
        split.setLayoutX(15.0);
        split.setLayoutY(377.0);
        split.setPrefSize(1171.0, 4.0);
	}
	
	private void intializeAnswerArea(){
		//User selection/answer area
        radioButtonOptions = new ToggleGroup();
		radioButtons = new RadioButton[5];
		double yLayout = 403.0;
		for(int i = 0; i < 5; i++){
			RadioButton radioButton = new RadioButton();
			radioButton.setToggleGroup(radioButtonOptions);
			radioButton.setPrefSize(750.0, 50.0);
			radioButton.setLayoutX(186.0);
			radioButton.setLayoutY(yLayout);
			radioButton.setStyle("" +
	        		"-fx-font-size: 23px;");
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
        continueButton.setLayoutY(683.0);
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
            	bpmCounterAssistanceLabel.setVisible(false);
            	bpmCounterButton.setVisible(false);
            	toggleFalse.setVisible(false);
            	toggleTrue.setVisible(false);           	
            	
            	for(int i = 0; i < 5; i++){
    	        	radioButtons[i].setVisible(false);
    	        	radioButtons[i].setSelected(false);
    	        }
            	
            	for(int i = 0; i < 6; i++){
            		if(mediaTogglesPressed[i] == true){
        				audioClips[i].stop();
        			}
    	        	mediaToggles[i].setVisible(false);
    	        	mediaTogglesPressed[i] = false;
    	        	mediaToggles[i].setStyle("" +
            				"-fx-cursor: hand; " +
            				"-fx-background-repeat: no-repeat; " +
            				"-fx-background-position: center;" +
            				"-fx-base: white;" +
            				"-fx-background-color: white;" +
            				"-fx-background-image: url('file:resources/pictures/media_not_started_icon.png');");
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
		backButton.setLayoutY(682.0);
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
		forwardButton.setLayoutY(682.0);
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
        integerResponseField.setLayoutY(522.0);
        
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
	
	
	private void intializeBPMcounter(){
		bpmCounterAssistanceLabel = new Label("*If you are not sure what the BPM is, click 'BPM Counter' for assistance.*");
		bpmCounterAssistanceLabel.setStyle("" +
        		"-fx-font-size: 20px;" +
        		"-fx-text-alignment: center;");
		bpmCounterAssistanceLabel.setLayoutX(283.0);
		bpmCounterAssistanceLabel.setLayoutY(400.0);
		bpmCounterAssistanceLabel.setPrefSize(635.0, 26.0);
		
		bpmCounterButton = new Button("BPM Counter");
		bpmCounterButton.setStyle("" +
        		"-fx-font-size: 20px;" +
        		"-fx-cursor: hand;" +
        		"-fx-text-alignment: center;" +
        		"-fx-font-style: italic;");
		bpmCounterButton.setDefaultButton(false);
		bpmCounterButton.setLayoutX(530.0);
		bpmCounterButton.setLayoutY(440.0);
		bpmCounterButton.setPrefSize(149.0, 40.0);
		bpmCounterButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override public void handle(ActionEvent t) {
            	tapCounter = 0;
            	msecsFirst = 0.0;
            	msecsPrevious = 0.0;
            	final Stage stage = new Stage(StageStyle.UTILITY);
            	
                Group bpmCounterPopup = new Group();
               // bpmCounterPopup.setStyle("-fx-background-image: url('file:resources/pictures/bpm_background.png');");
                
                stage.setScene(new Scene(bpmCounterPopup, 600, 500, Color.WHITE));
            	
            	Label bpmCounterLabel = new Label("BPM Counter");
            	Label instructionsLabel = new Label("Start tapping any key to measure the BPM.");
            	Label numberOfTapsLabel = new Label("Number of taps:");
            	final Label numberOfTaps = new Label();
            	Label averageBPMLabel = new Label("Average BPM:");
            	final Label averageBPM = new Label();
            	
            	
            	bpmCounterLabel.setStyle("" +
                		"-fx-font-size: 30px;" +
                		"-fx-font-style: italic;" +
                		"-fx-font-weight: bold;");
            	bpmCounterLabel.setLayoutX(198.0);
            	bpmCounterLabel.setLayoutY(38.0);
            	bpmCounterLabel.setPrefSize(205.0, 40.0);
            	
            	instructionsLabel.setLayoutX(160.0);
            	instructionsLabel.setLayoutY(116.0);
            	
            	numberOfTapsLabel.setStyle("" +
                		"-fx-font-size: 20px;" +
                		"-fx-font-weight: bold;");
            	numberOfTapsLabel.setLayoutX(225.0);
            	numberOfTapsLabel.setLayoutY(174.0);
            	
            	numberOfTaps.setStyle("" +
                		"-fx-font-size: 22px;" +
                		"-fx-text-fill: RED;" +
                		"-fx-alignment: CENTER;" +
                		"-fx-font-style: italic;" +
                		"-fx-font-weight: bold;");
            	numberOfTaps.setLayoutX(232.0);
            	numberOfTaps.setLayoutY(220.0);
            	numberOfTaps.setPrefSize(137.0, 30.0);
            	
            	averageBPMLabel.setStyle("" +
                		"-fx-font-size: 20px;" +
                		"-fx-font-weight: bold;");
            	averageBPMLabel.setLayoutX(233.0);
            	averageBPMLabel.setLayoutY(288.0);
            	
            	averageBPM.setStyle("" +
                		"-fx-font-size: 22px;" +
                		"-fx-text-fill: RED;" +
                		"-fx-alignment: CENTER;" +
                		"-fx-font-style: italic;" +
                		"-fx-font-weight: bold;");
            	averageBPM.setLayoutX(232.0);
            	averageBPM.setLayoutY(338.0);
            	averageBPM.setPrefSize(137.0, 30.0);
            	
            	Button finishButton = new Button("Finished!");
            	finishButton.setStyle("" +
                		"-fx-font-size: 17px;" +
                		"-fx-alignment: CENTER;" +
                		"-fx-font-style: italic;" +
                		"-fx-font-weight: bold;");
            	finishButton.setLayoutX(250.0);
            	finishButton.setLayoutY(408.0);
            	finishButton.setPrefSize(102.0, 40.0);
            	finishButton.setFocusTraversable(false);
            	finishButton.setOnAction(new EventHandler<ActionEvent>() {
                    @Override public void handle(ActionEvent t) { 
                    	if(bpmAvgWholeNumber != 0){
                    		integerResponseField.setText(String.valueOf(bpmAvgWholeNumber));
                        	continueButton.setDisable(false);
                    	}
                    	stage.close();
                    }
            	});
            	
            	bpmCounterPopup.getChildren().add(bpmCounterLabel);
            	bpmCounterPopup.getChildren().add(instructionsLabel);
            	bpmCounterPopup.getChildren().add(numberOfTapsLabel);
            	bpmCounterPopup.getChildren().add(numberOfTaps);
                bpmCounterPopup.getChildren().add(averageBPMLabel);
                bpmCounterPopup.getChildren().add(averageBPM);
                bpmCounterPopup.getChildren().add(finishButton);
                
                bpmCounterPopup.setOnKeyTyped(new EventHandler<KeyEvent>() {
        			@Override
        			public void handle(KeyEvent event) {
        				Calendar cal = Calendar.getInstance();
        				double timeOfKeyPress = cal.getTimeInMillis();
        				
        				if(tapCounter == 0){
        					msecsFirst = timeOfKeyPress;
        				    averageBPM.setText("First Tap");
        				    numberOfTaps.setText("First Tap");
        					tapCounter++;
        				}else{
        					bpmAvg = 60000 * tapCounter / (timeOfKeyPress - msecsFirst);
        					bpmAvgDecimal = Math.round(bpmAvg * 100) / 100;
        				    bpmAvgWholeNumber = Math.round(bpmAvg);
        				    averageBPM.setText(String.valueOf(bpmAvgWholeNumber));
        				    numberOfTaps.setText(String.valueOf(++tapCounter));
        				}
        			}
                });
                bpmCounterPopup.setFocusTraversable(true);
                stage.centerOnScreen();
                stage.show();
            }
        });
	}
	
	
	private void intializeBooleanToggleButton(){
		//Boolean Question User Input True or False Toggle Button
        toggleTrue = new ToggleButton("Yes");
        toggleFalse = new ToggleButton("No");
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
        toggleTrue.setLayoutY(500.0);
        toggleFalse.setLayoutX(661.0);
        toggleFalse.setLayoutY(500.0);
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
	
	
    public static void readInMediaResources(){
    	//Scanner text = new Scanner(new BufferedReader(new FileReader(new File("solutionPageInformation.txt"))));
    	//text.useDelimiter("\r\n");
    	//while (text.hasNext()) {
    	//	
    	//}
    	mediaResources.put("Is there an obvious tempo?", "file:resources/audio/DrumNBassBeats01.mp3");
    	mediaResources.put("Which of the following best describes the song structure?", "file:resources/audio/DrumNBassBeats03.mp3");
    	
    	mediaResources.put("Verse Chorus", "file:resources/audio/AcidandSynthBasslines1.mp3");
    	mediaResources.put("Buildup Breakdown", "file:resources/audio/AcidandSynthBasslines2.mp3");
    }
	
    private void changeLayoutHeight(int incYLayout){
    	descriptionArea.setLayoutY(119.0 + incYLayout); //Description Area
    	split.setLayoutY(377.0 + incYLayout); // Horizontal Seperator

    	double yLayout = 403.0;	//Radio Buttons
    	for(int i = 0; i < 5; i++){
    		radioButtons[i].setLayoutY(yLayout + incYLayout);
    		yLayout = yLayout + 50.0;
    	}

    	continueButton.setLayoutY(683.0 + incYLayout); //Continue Button
    	backButton.setLayoutY(682.0 + incYLayout); // Back Button
    	forwardButton.setLayoutY(682.0 + incYLayout); // Forward Button
    	integerResponseField.setLayoutY(522.0 + incYLayout); // Integer Input Field
    	bpmCounterAssistanceLabel.setLayoutY(400.0 + incYLayout); // BPM Assistance Label
    	bpmCounterButton.setLayoutY(440.0 + incYLayout); // BPM Counter Button
    	toggleTrue.setLayoutY(500.0 + incYLayout); // True Button
    	toggleFalse.setLayoutY(500.0 + incYLayout); // False Button

    	yLayout = 413.0;	//Media Toggles
    	for(int i = 1; i < 6; i++){
    		mediaToggles[i].setLayoutY(yLayout + incYLayout);
    		yLayout = yLayout + 50;
    	}
    }
    
	public void display(){
		//keep track of the number of questions		
		numOfQuestions++;
		
		if(firstRun){
			firstRun = false;
			MIFTIWAC.mainStage.setScene(new Scene(root));
		
			root.getChildren().add(vbox);
			root.getChildren().add(questionBox);
			root.getChildren().add(descriptionArea);
			root.getChildren().add(split);
			root.getChildren().add(continueButton);
			//root.getChildren().add(backButton);
			//root.getChildren().add(forwardButton);
			root.getChildren().add(toggleTrue);
	        root.getChildren().add(toggleFalse);	        
	        root.getChildren().add(integerResponseField);
	        root.getChildren().add(bpmCounterAssistanceLabel);
	        root.getChildren().add(bpmCounterButton);

	        
	        //backButton.setVisible(false);
	        //forwardButton.setVisible(false);
	        bpmCounterAssistanceLabel.setVisible(false);
	        bpmCounterButton.setVisible(false);
	        toggleTrue.setVisible(false);
	        toggleFalse.setVisible(false);
	        integerResponseField.setVisible(false);
	        for(int i = 0; i < 5; i++){
	        	root.getChildren().add(radioButtons[i]);
	        	radioButtons[i].setVisible(false);
	        	radioButtons[i].setSelected(false);
	        }
	        for(int i = 0; i < 6; i++){
	        	root.getChildren().add(mediaToggles[i]);
	        	mediaToggles[i].setVisible(false);
	        	mediaTogglesPressed[i] = false;
	        }
	        
		}
		String tempQuestion = "NULL";
		if(MIFTIWAC.dynamicPageType == 1){
			//boolean question
			if(MIFTIWAC.questionText.size() > 0){
				if(MIFTIWAC.questionText.get(0).length() > 60){
					changeLayoutHeight(32);
				}else{
					changeLayoutHeight(0);
				}
				tempQuestion = MIFTIWAC.questionText.get(0);
				System.out.println("Should display to the question box: " + tempQuestion);
				if(mediaResources.containsKey(tempQuestion)){
					mediaToggles[0].setVisible(true);
					audioClips[0] = new AudioClip(mediaResources.get(tempQuestion));
				}
				questionBox.setText(tempQuestion);
		        toggleTrue.setVisible(true);
		        toggleFalse.setVisible(true);
			}else{
				System.out.println("Error! There is no question in the ArrayList to display!");
			}
		}else if(MIFTIWAC.dynamicPageType == 2){
			//integer question
			if(MIFTIWAC.questionText.size() > 0){
				if(MIFTIWAC.questionText.get(0).length() > 60){
					changeLayoutHeight(32);
				}else{
					changeLayoutHeight(0);
				}
				tempQuestion = MIFTIWAC.questionText.get(0);
				System.out.println("Should display to the question box: " + tempQuestion);
				if(mediaResources.containsKey(tempQuestion)){
					mediaToggles[0].setVisible(true);
					audioClips[0] = new AudioClip(mediaResources.get(tempQuestion));
				}
				if(tempQuestion.compareToIgnoreCase("What is the BPM (Beats Per Minute)?") == 0){
					bpmCounterAssistanceLabel.setVisible(true);
					bpmCounterButton.setVisible(true);
				}
				questionBox.setText(tempQuestion);
				integerResponseField.setVisible(true);
			}else{
				System.out.println("Error! There is no question in the String Array to display!");
			}
		}else if(MIFTIWAC.dynamicPageType == 3){
			//radio question
			if(MIFTIWAC.questionText.size() > 0){
				if(MIFTIWAC.questionText.get(0).length() > 60){
					changeLayoutHeight(32);
				}else{
					changeLayoutHeight(0);
				}
				tempQuestion = MIFTIWAC.questionText.get(0);
				System.out.println("Should display to the question box: " + tempQuestion);
				if(mediaResources.containsKey(tempQuestion)){
					mediaToggles[0].setVisible(true);
					audioClips[0] = new AudioClip(mediaResources.get(tempQuestion));
				}
				questionBox.setText(tempQuestion);
				if(MIFTIWAC.questionText.size() > 1){
					for(int i = 1; i < MIFTIWAC.questionText.size(); i++){
						radioButtons[(i - 1)].setVisible(true);
						radioButtons[(i - 1)].setText(MIFTIWAC.questionText.get(i));
						if(mediaResources.containsKey(MIFTIWAC.questionText.get(i))){
							mediaToggles[i].setVisible(true);
							audioClips[i] = new AudioClip(mediaResources.get(MIFTIWAC.questionText.get(i)));
						}
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