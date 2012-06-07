
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Scanner;

import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.AnchorPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 * 
 * @author Idle_Thought
 */
public class Solution_page implements Initializable {
	// [SubGenre , [{Genre}, {PictureLocation}, {Description}, {RelatedArtists}]]
	static Map<String, ArrayList<ArrayList<String>>> solutionPageInformation = new HashMap<String, ArrayList<ArrayList<String>>>();
	// [Artist, InfoAboutArtist]
	static Map<String, String> relatedArtistsInfo = new HashMap<String, String>();
	
	@FXML private TextArea reasoningTextArea;
	@FXML private AnchorPane genreImagePanel;
	@FXML private Label genreNameLabel, subGenreNameLabel, genreDescription;
	@FXML private Accordion relatedArtistAccordion;
	@FXML private ToggleButton favoritedToggleButton;
	
	String blank = " ";
	
	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {		
		readInSolutionInfo();
    	readInRelatedArtistInfo();
		favoritedToggleButton.setTooltip(new Tooltip("Favorites Button Coming In Future Updates!"));
    	
    	String tempSubGenre = MIFTIWAC.subGenreAnswer;
		//System.out.println("The subgenre should be: " + MIFTIWAC.subGenreAnswer);
    	//Goes through and capitalizes all of the first letters of each word
		char[] chars = tempSubGenre.toCharArray();
		boolean found = false;
		for (int i = 0; i < chars.length; i++) {
			if (!found && Character.isLetter(chars[i])) {
				chars[i] = Character.toUpperCase(chars[i]);
				found = true;
			} else if (Character.isWhitespace(chars[i]) || chars[i]=='.' || chars[i]=='\'' || chars[i]=='-' || chars[i]=='/') {
				found = false;
			}
		}
		tempSubGenre = String.valueOf(chars);
    	
		if (MIFTIWAC.blankPage == false && solutionPageInformation.containsKey(tempSubGenre)) {
			ArrayList<ArrayList<String>> info = new ArrayList<ArrayList<String>>(solutionPageInformation.get(tempSubGenre));
			
			this.subGenreNameLabel.setText(tempSubGenre);
			this.genreNameLabel.setText(info.get(0).toString().substring(1, info.get(0).toString().length()-1));
			this.genreImagePanel.setStyle(info.get(1).toString().substring(1, info.get(1).toString().length()-1));
			this.genreImagePanel.setStyle("-fx-background-size: 100% 100%;" + (info.get(1).toString().substring(1, info.get(1).toString().length()-1)));
			this.genreDescription.setText(info.get(2).toString().substring(1, info.get(2).toString().length()-1));
			
			int numOfRelatedArtists = info.get(3).size();
			TextArea[] textAreaArray = new TextArea[numOfRelatedArtists];
			for (int i = 0; i < numOfRelatedArtists; i++) {
				//textAreaArray[i] = new TextArea(relatedArtistsInfo.get(info.get(3).get(i)));
				textAreaArray[i] = new TextArea("Artist Information Available In Future Updates!");
				textAreaArray[i].setWrapText(true);
				textAreaArray[i].setEditable(false);
				this.relatedArtistAccordion.getPanes().add(i, new TitledPane(info.get(3).get(i), textAreaArray[i]));
			}
			
			this.reasoningTextArea.setText(MIFTIWAC.reasoning);
			
		} else {
			MIFTIWAC.subGenreAnswer = " ";
			ArrayList<ArrayList<String>> info = new ArrayList<ArrayList<String>>(solutionPageInformation.get(MIFTIWAC.subGenreAnswer));
			this.subGenreNameLabel.setText(MIFTIWAC.subGenreAnswer);
			this.genreNameLabel.setText(info.get(0).toString().substring(1, info.get(0).toString().length()-1));
			this.genreImagePanel.setStyle(info.get(1).toString().substring(1, info.get(1).toString().length()-1));
			this.genreDescription.setText(info.get(2).toString().substring(1, info.get(2).toString().length()-1));
			
			this.reasoningTextArea.setText(this.blank);
			
			System.out.println("ERROR! If you are getting this error either the final subgenre that was chosen is not in the solutionPageInformation.txt file, or somehow blankPage is still equal to true.");
		}
	}

    public static void readInSolutionInfo(){
    	Scanner text;
		try {
			text = new Scanner(new BufferedReader(new FileReader(new File("resources/files/solutionPageInformation.txt"))));
			
			text.useDelimiter("\r\n");
	    	while (text.hasNext()) {
	    		String subGenre = null;
	    		ArrayList<String> genre = new ArrayList<String>(), pictureLocation = new ArrayList<String>(), description = new ArrayList<String>(), relatedArtists = new ArrayList<String>();
	    		ArrayList<ArrayList<String>> info = new ArrayList<ArrayList<String>>();
	    		//System.out.println(text.next());
	    		if((text.next()).compareToIgnoreCase("----------------------------") == 0){
	    			text.hasNext();
		    		if(text.hasNext()){
		    			subGenre = text.next();						//SubGenre
		    			//System.out.println(subGenre);
		    		}if(text.hasNext()){
		    			genre.add(text.next());						//Genre - 0
		    			info.add(genre);
		    			//System.out.println(genre);
		    		}if(text.hasNext()){
		    			pictureLocation.add(text.next());			//PictureLocation - 1
		    			info.add(pictureLocation);
		    			//System.out.println(pictureLocation);
		    		}if(text.hasNext()){
		    			description.add(text.next());				//Description - 2
		    			info.add(description);
		    			//System.out.println(description);
		    		}
		    		int counter = 0;
	    			boolean finished = false;
	    			while(!finished){
	    				if(text.hasNext()){
	    					String str = text.next();
		    				if(str.compareToIgnoreCase(" ") == 0){
		    					relatedArtists.add(counter, str);	//RelatedArtists
		    					counter++;
		    				}else if(str.compareToIgnoreCase("----------------------------") == 0){
		    					finished = true;
		    				}else{
		    					relatedArtists.add(counter, str);	//RelatedArtists
		    					counter++;
		    				}
	    				}else{
	    					finished = true;
	    				}
	    			}
	    			info.add(relatedArtists);
	    			solutionPageInformation.put(subGenre, info);
	    		}
	    	}
	    	//System.out.println(solutionPageInformation);
	    	text.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
    	
    }

    public static void readInRelatedArtistInfo(){
    	//Scanner text = new Scanner(new BufferedReader(new FileReader(new File("solutionPageInformation.txt"))));
    	//text.useDelimiter("\r\n");
    	//while (text.hasNext()) {
    	//	
    	//}
    	relatedArtistsInfo.put("Test 1", "Information!");

    }

    public static void closeProgramButton(){
    	Platform.exit();    	
    }

    public static void aboutProgramButton(ActionEvent t){
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

}
