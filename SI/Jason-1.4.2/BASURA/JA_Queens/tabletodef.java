
import java.awt.*;
import java.util.*;
import jason.asSyntax.*;
import jason.environment.*;

public class MarsEnv extends Environment
{
        public static List<int> bussy;
        public static final int GSize = 8;
        public static final int BLACK  = 4;

        static Logger logger = Logger.getLogger(MarsEnv.class.getName());

        private MarsModel model;
        private MarsView  view;

        @Override
        public void init(String[] args)
        {
                bussy = new ArrayList<int>();

                model = new MarsModel();
                view  = new MarsView(model);

                model.setView(view);

                updatePercepts();
        }

        @Override
        public boolean executeAction(String agName, Structure action)
        {
                if (action.getFunctor().equals("burn"))
                {
                        addPercept(Literal.parseLiteral("fire"));
                        return true;
                }
                else if(action.getFunctor().equals("run"))
                {
                        System.out.println("This girl is on fire...");
                        return true;
                }
                else
                {
                        logger.info("executing: "+action+", but not implemented!");
                        return false;
                }
        }


        /** creates the agents perception based on the MarsModel */
        void updatePercepts()
        {

        }

        class MarsModel extends GridWorldModel
        {
                Random random = new Random(System.currentTimeMillis());

                private MarsModel()
                {
                        super(GSize, GSize, 2);
                        for(int i=0; i<GSize;i++)
                                for(int k=0; k<GSize;k++)
                                        if((i+k)%2==0)add(BLACK,i,k);
                }

                //Aquí funciones

        }

        class MarsView extends GridWorldView {

                public MarsView(MarsModel model)
                {
                        super(model, "Mars World", 600);
                        defaultFont = new Font("Arial", Font.BOLD, 18);
                        setVisible(true);
                        repaint();
                }

                /** draw application objects */
                @Override
                public void draw(Graphics g, int x, int y, int object)
                {
                        switch (object)
                        {
                                case MarsEnv.BLACK: drawBlak(g,x,y); break;
                        }
                }

                @Override
                public void drawAgent(Graphics g, int x, int y, Color c, int id) {

                }

                public void drawBlak(Graphics g, int x, int y) {
                        super.drawEmpty(g, x, y);
                        g.setColor(Color.black);
                }

        }
}
