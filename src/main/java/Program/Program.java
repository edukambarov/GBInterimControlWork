package Program;

import Classes.*;

import java.lang.reflect.Method;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.stream.Stream;

public class Program {
    private static ArrayList<Animal> animals;
    public Program(){
        animals = new ArrayList<>();
    }
    public void addCat(Calendar birthday, String name, ArrayList<String> skills) {
        Cat cat = new Cat (birthday, name, skills);
        animals.add(cat);
    }
    public void addDog(Calendar birthday, String name, ArrayList<String> skills) {
        Dog dog = new Dog (birthday, name, skills);
        animals.add(dog);
    }
    public void addHamster(Calendar birthday, String name, ArrayList<String> skills) {
        Hamster hamster = new Hamster (birthday, name, skills);
        animals.add(hamster);
    }
    public void addHorse(Calendar birthday, String name, ArrayList<String> skills) {
        Horse horse = new Horse (birthday, name, skills);
        animals.add(horse);
    }

    public void addDonkey(Calendar birthday, String name, ArrayList<String> skills) {
        Donkey donkey = new Donkey (birthday, name, skills);
        animals.add(donkey);
    }

    public void addCamel(Calendar birthday, String name, ArrayList<String> skills) {
        Camel camel = new Camel (birthday, name, skills);
        animals.add(camel);
    }

    public void showAnimals () {
        Stream.generate(() -> "*").limit(50).forEach(System.out::print);
        System.out.println();
        for (Animal animal: animals) {
            System.out.println(animal);
        }
        Stream.generate(() -> "*").limit(50).forEach(System.out::print);
        System.out.println();
    }
    public void showSkills (int inputID){
        for (Animal animal: animals) {
            int animalID = animal.getId();
            if (animalID == inputID) {
                String skillsOfChosen = animal.getSkills().toString().
                        replace("[","").
                        replace("]","");
                if (skillsOfChosen.isEmpty()) {
                    System.out.println("Selected animal cannot do anything yet.");
                }
                else {
                    System.out.println("Skills of selected animal: "+ skillsOfChosen + ".");
                }
            }
            else System.out.println("Not animal with this ID was found.");
        }
    }
    public void findListOfCommands(int inputID) {
        for (Animal animal: animals) {
            int animalID = animal.getId();
            Class relatedClass = animal.getClass();
            Class apprInterface = null;
            if (animalID == inputID) {
                Class[] relatedInterfaces = relatedClass.getInterfaces();
                if (relatedInterfaces.length == 1) {
                    apprInterface = relatedInterfaces[0];
                    ArrayList<String> availableCommands = new ArrayList<String>();
                    for (Method method : apprInterface.getDeclaredMethods()) {
                        availableCommands.add(method.getName());
                    }
                    System.out.println("Choose one of the commands and enter it: \n" +
                                    availableCommands.toString().
                                    replace("[","").
                                    replace("]",""));
                }
            }
            else System.out.println("Not animal with this ID was found.");
        }
    }

    public void teachCommand(int inputID, String command) {
        for (Animal animal: animals) {
            int animalID = animal.getId();
            if (animalID == inputID) {
                animal.learnCommand(command);
            }
        }
    }
}











