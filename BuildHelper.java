//import java.io.File;

public class BuildHelper {
    public static void main(String[] args) {
        /* String email = args[0];
        notifyAdministratorviaEmail(email);
        System.out.println("Administrator "+email+" has been notified"); */
        /* String[] dirs = {"force-app/main/default/classes/testApex.cls", "force-app/main/default/classes/wordCount.cls", "force-app/main/default/pages/try1.page", "force-app/main/default/triggers/AccountTrigger.trigger"};

        for (String dir : dirs) {
            File myObj = new File(dir);
            if (myObj.exists()) {
            System.out.println("File name: " + myObj.getName());
            System.out.println("Absolute path: " + myObj.getAbsolutePath());
            System.out.println("Writeable: " + myObj.canWrite());
            System.out.println("Readable " + myObj.canRead());
            System.out.println("File size in bytes " + myObj.length());
            } else {
            System.out.println("The file does not exist.");
            }
        } */
        for (String ag : args) {
            System.out.println(ag);
        }
        
    }
    public static void notifyAdministratorviaEmail(String email) {
        //......
    }
}