public class pascalWalker extends pascalBaseListener {
    public void enterProgram(pascalParser.ProgramContext ctx ) {
        System.out.println("Program " + ctx.programHeading().identifier().IDENT());
    }
    public void enterBlock(pascalParser.BlockContext ctx ) {
        System.out.println("var ");
    }
}