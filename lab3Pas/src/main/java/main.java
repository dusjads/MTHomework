import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.FileWriter;
import java.io.PrintWriter;

public class main {
    public static void main(String[] args) throws Exception {

        String fileName = "add.pas";
        pascalLexer lexer = new pascalLexer(CharStreams.fromFileName(fileName));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        pascalParser parser = new pascalParser(tokens);
        String res = parser.program().res;
        //System.out.println(res);
        PrintWriter out = new PrintWriter(new FileWriter("Obfuskated" + fileName));
        out.print(res);
        out.close();
    }
}