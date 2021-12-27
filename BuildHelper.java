import java.io.File;
import java.nio.file.*;

public class BuildHelper {
    public static void main(String[] filePathList) {
        
        for (String ag : filePathList) {
            System.out.println(ag);
        }

        for (String curFilePathStr : filePathList) {
            File file = new File(curFilePathStr);
            System.out.print(file.exists()); System.out.print(file.getPath().startsWith("force-app"));
            if (file.exists() && file.getPath().startsWith("force-app")) {                
                String srcDirStr = curFilePathStr.substring(0, curFilePathStr.lastIndexOf('/'));
                String destDirStr = srcDirStr.replaceFirst("force-app", "deploy-sf");
                File srcDir;
                File destDir = new File(destDirStr);
                if(!destDir.exists()){
                    if(destDir.mkdirs()){
                        System.out.println("created");
                    }
                    else{
                        System.out.println("not created");
                    }
                }
                
                Path srcPath;
                Path destPath = destDir.toPath();

                if (srcDirStr.contains("aura") || srcDirStr.contains("lwc")) {
                    srcDir = new File(srcDirStr);
                    srcPath = srcDir.toPath();
                    try {
                        Files.walk(srcPath)
                        .forEach(srcPt -> {
                            try {
                            //System.out.println(srcPt);
                            Files.copy(srcPt, destPath.resolve(srcPath.relativize(srcPt)));
                            } catch (Exception e) {
                                System.out.println("message: "+e.getMessage());System.out.println("Exception: "+e);
                            }
                        });
                    } catch (Exception e) {
                        System.out.println("message: "+e.getMessage());System.out.println("Exception: "+e);
                    }
                } else {
                    srcPath = file.toPath();
                    try {
                        //System.out.println(destDir.exists());
                        Files.copy(srcPath, destPath.resolve(srcPath.getFileName()));
                    } catch (Exception e) {
                        System.out.println("message: "+e.getMessage());System.out.println("Exception: "+e);
                    }
                    String metaFilePathStr = curFilePathStr + "-meta.xml";
                    File metaFile = new File(metaFilePathStr);
                    if (metaFile.exists()) {
                        Path metaSrcPath = metaFile.toPath();
                        try {
                            //System.out.println("metaFile exists? "+metaFile.exists());
                            Files.copy(metaSrcPath, destPath.resolve(metaSrcPath.getFileName()));
                        } catch (Exception e) {
                            System.out.println("message: "+e.getMessage());System.out.println("Exception: "+e);
                        }
                    }
                }
            } else {
                System.out.println("The file does not exist.");
            }
        }
    }
    
}